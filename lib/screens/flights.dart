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

class FlightsScreen extends StatefulWidget {
  static String id = 'flights';
  @override
  _FlightsScreenState createState() => _FlightsScreenState();
}

int flag = 0;

class _FlightsScreenState extends State<FlightsScreen> {
  int _selectedPosition = 0;
  String userName = 'Username';
  List<StudentFlight> studentFlightList = [];
  var loadData = false;

  var _firebaseRef = FirebaseDatabase().reference();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserData();
    getUserData().then((value) {
      setState(() {
        loadData = true;
      });
    });
  }

  @override
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

  @override
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
        studentFlightList.add(temp);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.05,
        // automaticallyImplyLeading: false,
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: SvgPicture.asset(
        //       "images/bottomBar/bell.svg",
        //       height: 15,
        //       width: 34,
        //     ),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),

        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      // drawer: DrawerWidget(userName),
      body: loadData == false?Center(child:CircularProgressIndicator()): SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
                children: studentFlightList.map<Widget>((p) {
              return containerMaker(
                  context,
                  p.instructorName,
                  p.aircraft,
                  p.studentName,
                  p.startTime,
                  p.date,
                  p.requestToCancel,
                  p.index);
            }).toList()),
          ),
        ),
      ),
    );
  }

  containerMaker(BuildContext context, String str1, String str2, String str3,
      String startTime, String date, bool requestToCancel, int index) {
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         date,
            //         style: TextStyle(fontSize: 12),
            //       ),
            //       Expanded(
            //           child: Divider(
            //         thickness: 3.0,
            //       )),
            //     ]),
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
}
