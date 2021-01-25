import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/chat_screen.dart';
import 'drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:air_club/helper/aircrafts.dart';
import 'package:air_club/helper/instructors.dart';
import 'package:intl/intl.dart';

class ScreenSelectorInstructor extends StatefulWidget {
  static String id = 'screen_selector';
  final Instructor instructor;
  ScreenSelectorInstructor(this.instructor);
  @override
  _ScreenSelectorState createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelectorInstructor> {
  int _selectedPosition = 0;
  String userName = 'Username';
  var _firebaseRef = FirebaseDatabase().reference();
  final _auth = FirebaseAuth.instance;
  var data, dataFlight, flightData, lastFlightNumber = 0, studentEmail;
  final List<String> students = [];
  var instructorName, studentName, aircraftName, instructorEmail;
  TimeOfDay time = TimeOfDay(hour: 00, minute: 00);
  var date = "2020/01/01";
  var studentDeviceToken;

  List<Widget> _screenContainer = [
    HomeScreen(),
    ScheduleScreen(),
    NotificationScreen(),
    ChatScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
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
    findFlightNumber();
  }

  Future<void> findFlightNumber() async {
    final FirebaseUser user = await _auth.currentUser();
    _firebaseRef.once().then((DataSnapshot snapshot) {
      dataFlight = snapshot.value;
      flightData = dataFlight['Flights'];
      setState(() {
        lastFlightNumber = flightData.length;
      });
    });
  }

  Future<void> writeData() async {
    for (var i in data.keys) {
      if (studentName == data[i]['username']) {
        studentDeviceToken = data[i]['token'];
      }
    }
    print(studentDeviceToken);
    await _firebaseRef
        .child("Flights")
        .child((lastFlightNumber).toString())
        .set({
      'aircraft': aircraftName,
      'flightDate': date,
      'instructortoken': instructorEmail,
      'instructorname': instructorName,
      'requestToCancel': false,
      'startTime': time.hour.toString() + ":" + time.minute.toString(),
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
      drawer: DrawerWidget(widget.instructor.username),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: 60.w,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {
              await findFlightNumber();
              popBottomSheet(context);
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: _buildBottomTab(),
      body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.89,
              child: _screenContainer[_selectedPosition])),
    );
  }

  _buildBottomTab() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 59.h,
          padding: EdgeInsets.fromLTRB(27.w, 0, 27.w, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: _selectedPosition == 0
                    ? SvgPicture.asset(
                        'images/bottomBar/home.svg',
                        width: 23.w,
                        height: 23.h,
                        color: Colors.black,
                      )
                    : SvgPicture.asset(
                        'images/bottomBar/home.svg',
                        width: 23.w,
                        height: 23.h,
                        color: Colors.grey[600],
                      ),
                onPressed: () {
                  setState(() {
                    _selectedPosition = 0;
                  });
                },
                splashRadius: 25,
              ),
              IconButton(
                icon: _selectedPosition == 1
                    ? SvgPicture.asset(
                        'images/bottomBar/calendar.svg',
                        width: 23.w,
                        height: 23.h,
                        color: Colors.black,
                      )
                    : SvgPicture.asset(
                        'images/bottomBar/calendar.svg',
                        width: 23.w,
                        height: 23.h,
                        color: Colors.grey[600],
                      ),
                onPressed: () {
                  setState(() {
                    _selectedPosition = 1;
                  });
                },
                splashRadius: 25,
              ),
              SizedBox(
                width: 48.w,
              ),
              IconButton(
                icon: _selectedPosition == 2
                    ? SvgPicture.asset(
                        'images/bottomBar/bell.svg',
                        width: 25.w,
                        height: 25.h,
                        color: Colors.black,
                      )
                    : SvgPicture.asset(
                        'images/bottomBar/bell.svg',
                        width: 25.w,
                        height: 25.h,
                        color: Colors.grey[600],
                      ),
                onPressed: () {
                  setState(() {
                    _selectedPosition = 2;
                  });
                },
                splashRadius: 25,
              ),
              IconButton(
                icon: _selectedPosition == 3
                    ? SvgPicture.asset(
                        'images/bottomBar/chat.svg',
                        width: 25.w,
                        height: 25.h,
                        color: Colors.black,
                      )
                    : SvgPicture.asset(
                        'images/bottomBar/chat.svg',
                        width: 25.w,
                        height: 25.h,
                        color: Colors.grey[600],
                      ),
                onPressed: () {
                  setState(() {
                    _selectedPosition = 3;
                  });
                },
                splashRadius: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void popBottomSheet(BuildContext context) {
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
            child: form(context),
          );
        });
  }

  Widget form(BuildContext context) {
    final List<String> instructors = [];
    final List<String> aircrafts = [];

    for (int i = 0; i < instructorList.length; i++) {
      instructors.add(instructorList[i].username);
    }
    for (int i = 0; i < aircraftList.length; i++) {
      aircrafts.add(aircraftList[i].name);
    }

    instructorName = instructors[0];
    studentName = students[0];
    aircraftName = aircrafts[0];

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
                child: fillBoxDate("Date", context)),
            Container(
                margin: EdgeInsets.only(top: 35.h, bottom: 0),
                height: 65.h,
                // width: MediaQuery.of(context).size.width*10,
                child: fillBoxTime("Time", context)),
            // Container(
            //   margin: EdgeInsets.only(top: 35.h, bottom: 0),
            //   height: 63.h,
            //   child: Row(
            //     children: [
            //       Flexible(flex: 1, child: fillBoxInsert("Start Time")),
            //     ],
            //   ),
            // ),
            Container(
              child: button("Add"),
            )
          ],
        ),
      ]),
    );
  }

  Widget button(String text) {
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
          print(time);
          await writeData();
          Navigator.of(context).pop();
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

  Widget fillBoxDate(String text, BuildContext context) {
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
            child: Container(
              height: 40.h,
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
                      onPressed: () async {
                        final DateTime picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2200),
                        );
                        if (picked != null) {
                          setState(() {
                            final DateFormat formatter =
                                DateFormat('yyyy-MM-dd');
                            date = formatter.format(picked).toString();
                          });
                        }
                      },
                    )),
                hint: Container(
                    // color: Colors.red,
                    child: Text(
                  date.substring(0, 10),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'OpenSans'),
                )),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget fillBoxTime(String text, BuildContext context) {
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
            child: Container(
              height: 40.h,
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
                      onPressed: () async {
                        var pickedTime = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(hour: 00, minute: 00),
                        ));
                        if (pickedTime != null) {
                          setState(() {
                            time = pickedTime;
                          });
                        }
                      },
                    )),
                hint: Container(
                    // color: Colors.red,
                    child: Text(
                  time.hour.toString() + ":" + time.minute.toString(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'OpenSans'),
                )),
              ),
            ),
          ),
        )
      ],
    );
  }

  // Widget fillBoxInsert(String text) {
  //   return Column(
  //     children: [
  //       Container(
  //           padding: EdgeInsets.zero,
  //           margin: EdgeInsets.all(0),
  //           // color: Colors.black87,
  //           child: Align(
  //             alignment: Alignment.centerLeft,
  //             child: Text(
  //               text,
  //               style: TextStyle(
  //                 fontSize: 14.sp,
  //                 fontWeight: FontWeight.w400,
  //                 fontFamily: 'OpenSans',
  //               ),
  //             ),
  //           )),
  //       Container(
  //         margin: EdgeInsets.only(top: 0),
  //         // color: Colors.blue,
  //         child: Container(
  //           height: 40.h,
  //           child: TextField(
  //             keyboardType: TextInputType.number,
  //             controller: startTimeController,
  //             decoration: InputDecoration(
  //                 hintStyle: TextStyle(
  //                     fontSize: 13.5.sp,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black87),
  //                 hintText: "Leorm Ipsum"),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

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
                list[0],
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
                list[0],
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
                list[0],
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
              "Add New Event",
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
