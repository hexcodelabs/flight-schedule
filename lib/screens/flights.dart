import 'package:air_club/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:air_club/helper/student.dart';
import 'package:air_club/screens/add_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:air_club/drawer.dart';
import 'package:air_club/helper/aircrafts.dart';
import 'package:air_club/helper/instructors.dart';

class FlightsScreen extends StatefulWidget {
  static String id = 'flights';
  @override
  _FlightsScreenState createState() => _FlightsScreenState();
}

int flag = 0;

class _FlightsScreenState extends State<FlightsScreen> {
  String userName = 'Username';
  List<StudentFlight> studentFlightList = [];
  var loadData = false;
  var _firebaseRef = FirebaseDatabase().reference();
  final _auth = FirebaseAuth.instance;
  var data, dataFlight, flightData, lastFlightNumber = 0, studentEmail;
  final List<String> students = [];
  var instructorName, studentName, aircraftName, instructorEmail;
  var startTime, endTime;
  var studentDeviceToken;

  String date = 'Select Date';

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    getData();
    getUserData().then((value) {
      setState(() {
        loadData = true;
      });
    });
  }

  void callback(String dateIn) {
    setState(() {
      date = dateIn;
    });
    print('kDate ' + date);
  }

  void callbackStartTime(String time) {
    setState(() {
      startTime = time;
    });
    print('Start time callback ' + startTime);
  }

  void callbackEndTime(String time) {
    setState(() {
      endTime = time;
    });
    print('End time callback ' + endTime);
  }

  Future<void> getData() async {
    final _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    print(user.uid);
    _firebaseRef.once().then((DataSnapshot snapshot) {
      data = snapshot.value;
      data = data['Students'];

      var usernameEvery;

      for (var i in data.keys) {
        usernameEvery = data[i]["username"];
        students.add(usernameEvery);
      }
    });
  }

  Future<void> getUserData() async {
    var data;

    final _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    _firebaseRef.once().then((DataSnapshot snapshot) {
      data = snapshot.value;
      data = data['Students'];
      print(data);

      var username;
      var email;
      for (var i in data.keys) {
        if (i == user.uid) {
          username = data[i]["username"];
          email = data[i]["email"];
        }
      }
      print(username);
      print(email);
      setState(() {
        userName = username;
      });
    });
    await getFlightData();
  }

  Future<void> getFlightData() async {
    var data;
    await _firebaseRef.once().then((DataSnapshot snapshot) {
      data = snapshot.value;
      data = data['Flights'];
      print(data);
      for (int i = 0; i < data.length; i++) {
        if (data[i] == null) {
          continue;
        }
        StudentFlight temp = StudentFlight();

        temp.aircraft = data[i]['aircraft'];
        temp.studentName = data[i]['studentname'];
        temp.instructorName = data[i]['instructorname'];
        temp.startTime = data[i]['startTime'];
        temp.date = data[i]['flightDate'];
        temp.requestToCancel = data[i]['requestToCancel'];
        temp.index = i;
        temp.endTime = data[i]['endTime'];
        studentFlightList.add(temp);
      }
    });
  }

  Future<void> updateData(int index) async {
    for (var i in data.keys) {
      if (studentName == data[i]['username']) {
        studentDeviceToken = data[i]['token'];
      }
    }
    await _firebaseRef.child("Flights").child(index.toString()).update({
      'aircraft': aircraftName,
      'flightDate': date,
      'instructortoken': instructorEmail,
      'instructorname': instructorName,
      'requestToCancel': false,
      'startTime': startTime,
      'endTime': endTime,
      'studentDeviceToken': studentDeviceToken,
      'studentname': studentName
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.05,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      // drawer: DrawerWidget(userName),
      body: loadData == false
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                      children: studentFlightList.map<Widget>((p) {
                    print("date biches" + p.date);
                    return containerMaker(
                        context,
                        p.instructorName,
                        p.aircraft,
                        p.studentName,
                        p.startTime,
                        p.date,
                        p.requestToCancel,
                        p.endTime,
                        p.index);
                  }).toList()),
                ),
              ),
            ),
    );
  }

  containerMaker(
      BuildContext context,
      String str1,
      String str2,
      String str3,
      String startTime,
      String date,
      bool requestToCancel,
      String endTime,
      int index) {
    return Container(
        padding: EdgeInsets.only(left: 44.0, top: 10.0),
//                            color:Colors.lightBlueAccent,
        child: Column(
          children: [
            //padding: EdgeInsets.only(left:30,top:5,right:0 ,bottom:5 ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    startTime,
                    style: TextStyle(fontSize: 12),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 3.0,
                  )),
                ]),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: _backGround(),
                borderRadius: BorderRadius.circular(15.0),
              ),
//                                    color: Colors.blue[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // width:MediaQuery.of(context).size.width*0.75,
                    height: 180,
                    padding: EdgeInsets.only(left: 5.0, top: 10.0),
//                                            color: Colors.amberAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Instructor - " + str1,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 6.0,
                          width: 2.0,
                        ),
                        Text("Aircraft - " + str2,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 6.0,
                          width: 2.0,
                        ),
                        Text("Date - " + date,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text("Student - " + str3,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                            "Requested to cancel - " +
                                requestToCancel.toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        Row(
                          children: [
                            FlatButton(
                              height: 30,
                              child: Text('Delete'),
                              color: Colors.red,
                              textColor: Colors.white,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Request to Delete?"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Yes"),
                                          onPressed: () async {
                                            await _firebaseRef
                                                .child("Flights")
                                                .child(index.toString())
                                                .remove();
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FlightsScreen()),
                                            );
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("Exit"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            FlatButton(
                              height: 30,
                              child: Text('Edit'),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                popBottomSheet(
                                    context,
                                    str1,
                                    str2,
                                    str3,
                                    startTime,
                                    date,
                                    requestToCancel,
                                    endTime,
                                    index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    endTime,
                    style: TextStyle(fontSize: 12),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 3.0,
                  )),
                ]),
          ],
        ));
  }

  Color _backGround() {
    Color color;
    if (flag == 0) {
      flag = flag + 1;
      color = Color.fromRGBO(250, 238, 255, 1);
    } else if (flag == 1) {
      flag = flag + 1;
      color = Color.fromRGBO(254, 243, 232, 1);
    } else {
      flag = 0;
      color = Color.fromRGBO(235, 251, 242, 1);
    }

    return color;
  }

  void popBottomSheet(
      BuildContext context,
      String str1,
      String str2,
      String str3,
      String startTimei,
      String datei,
      bool requestToCancel,
      String endTimei,
      int index) {
    setState(() {
      startTime = startTimei;
      endTime = endTimei;
      date = datei;
    });
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        )),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * .85,
            child: form(context, str1, str2, str3, startTimei, date,
                requestToCancel, endTimei, index),
          );
        });
  }

  Widget form(
      BuildContext context,
      String str1,
      String str2,
      String str3,
      String startTime,
      String date,
      bool requestToCancel,
      String endTime,
      int index) {
    final List<String> instructors = [];
    final List<String> aircrafts = [];

    for (int i = 0; i < instructorList.length; i++) {
      instructors.add(instructorList[i].username);
    }
    for (int i = 0; i < aircraftList.length; i++) {
      aircrafts.add(aircraftList[i].name);
    }

    instructorName = str1;
    studentName = str3;
    aircraftName = str2;

    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w),
      padding: EdgeInsets.zero,
      child: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                // color: Colors.blueGrey,
                child: AddNewEvent(context)),
            Container(
                // color: Colors.blueGrey,
                margin: EdgeInsets.only(top: 35.h, bottom: 0),
                height: 63.h,
                child: fillBoxInstructor("Flight Instructor", instructors)),
            Container(
                margin: EdgeInsets.only(top: 35.h, bottom: 0),
                height: 63.h,
                child: fillBoxStudent("Student", students)),
            Container(
                margin: EdgeInsets.only(top: 35.h, bottom: 0),
                height: 63.h,
                child: fillBoxFlight("Aircraft", aircrafts)),
            Container(
                margin: EdgeInsets.only(top: 35.h, bottom: 0),
                height: 65.h,
                // width: MediaQuery.of(context).size.width*10,
                child: Fdate(callback, date)),
            Container(
              margin: EdgeInsets.only(top: 35.h, bottom: 0),
              // height:63.h,
              height: MediaQuery.of(context).size.height * 0.078,

              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Ftime(callbackStartTime, true, startTime)),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                      flex: 1, child: Ftime(callbackEndTime, false, endTime)),
                ],
              ),
            ),
            Container(
              child: button("Update", index),
            )
          ],
        ),
      ]),
    );
  }

  Widget button(String text, int index) {
    return Container(
      margin: EdgeInsets.only(top: 50.h, bottom: 0.h),
      width: 207.w,
      height: 47.w,
      child: RaisedButton(
        onPressed: () async {
          print(instructorName);
          print(studentName);
          print(aircraftName);
          print(date);
          print(startTime);
          await updateData(index);
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FlightsScreen()),
          );
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'OpenSans-Bold',
              color: Colors.white),
        ),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget fillBoxStudent(String text, list) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.all(0),
            // color: Colors.black87,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 0),
          // color: Colors.blue,
          child: Container(
            height: 42.h,
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text(
                studentName,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'OpenSans-Bold'),
                textAlign: TextAlign.start,
              ),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: 'OpenSans-Bold'),
                  ),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  studentName = _;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget fillBoxInstructor(String text, list) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.all(0),
            // color: Colors.black87,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 0),
          // color: Colors.blue,
          child: Container(
            height: 42.h,
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text(
                instructorName,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'OpenSans-Bold'),
                textAlign: TextAlign.start,
              ),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: 'OpenSans-Bold'),
                  ),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  instructorName = _;
                  for (int i = 0; i < instructorList.length; i++) {
                    if (instructorList[i].username == instructorName) {
                      setState(() {
                        instructorEmail = instructorList[i].email;
                      });
                    }
                  }
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget fillBoxFlight(String text, list) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.all(0),
            // color: Colors.black87,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 0),
          // color: Colors.blue,
          child: Container(
            height: 42.h,
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text(
                aircraftName,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'OpenSans-Bold'),
                textAlign: TextAlign.start,
              ),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: 'OpenSans-Bold'),
                  ),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  aircraftName = _;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget AddNewEvent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (Container(
          margin: EdgeInsets.only(top: 30.h),
          height: 25.h,
          width: 154.w,
          // color: Colors.blue,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Update Event",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  fontFamily: 'OpenSans-Bold'),
            ),
          ),
        )),
        Container(
          margin: EdgeInsets.only(top: 30.h),
          // color: Colors.blueGrey,
          child: IconButton(
            splashRadius: 20.w,
            iconSize: 15.w,
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              maxWidth: 15.w,
              minHeight: 15.h,
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
        ),
      ],
    );
  }
}

class Ftime extends StatefulWidget {
  Function(String) startTimeCallBack;
  bool isStart;
  String time;
  Ftime(this.startTimeCallBack, this.isStart, this.time);

  @override
  _FtimeState createState() => _FtimeState(this.time);
}

class _FtimeState extends State<Ftime> {
  String time;
  _FtimeState(this.time);

  String label;

  @override
  void initState() {
    super.initState();
    label = time;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.all(0),
            // color: Colors.black87,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.isStart ? "Start Time" : "End Time",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans',
                ),
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 0),
          // color: Colors.blue,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 40.h,
              child: TextField(
                readOnly: true,
                // child: Text(label,
                // style: TextStyle(
                //   color: Colors.black
                // ),),
                showCursor: false,
                onTap: () async {
                  TimeOfDay picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (BuildContext context, Widget child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child,
                      );
                    },
                  );
                  setState(() {
                    label = picked.format(context);
                    widget.startTimeCallBack(label);
                  });
                },
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    hintText: label),
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}

class Fdate extends StatefulWidget {
  Function(String) callback;
  String date;
  Fdate(this.callback, this.date);
  @override
  _FdateState createState() => _FdateState(this.date);
}

class _FdateState extends State<Fdate> {
  String date;
  _FdateState(this.date);
  DateTime selectedDate = DateTime.now();

  String k;

  @override
  void initState() {
    super.initState();
    k = date;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.all(0),
            // color: Colors.black87,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Date",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans',
                ),
              ),
            )),
        Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(top: 0),

          // color: Colors.blue,
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () async {
                final DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2200),
                  // initialEntryMode: DatePickerEntryMode.input,
                );
                setState(() {
                  k = picked.toIso8601String().split('T').first;
                  widget.callback(k);
                });
              },
              child: Container(
                // height:40.h,
                height: MediaQuery.of(context).size.height * 0.050,
                child: DropdownButton(
                  icon: Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.blueGrey,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.25),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 25.w,
                        ),
                        color: Colors.black87,
                        padding: EdgeInsets.all(0),
                        constraints: BoxConstraints(),
                        onPressed: () {
                          // print("Hello");
                          // showDatePicker(
                          //   context:context ,
                          //   initialDate: DateTime.now(),
                          //   firstDate: DateTime(2001),
                          //   lastDate: DateTime(2200),
                          // ).then((pickedDate) => print(pickedDate));
                        },
                      )),
                  hint: Container(
                      // color: Colors.red,
                      child: Text(
                    k,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: 'OpenSans'),
                  )),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
