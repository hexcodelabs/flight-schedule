import 'package:air_club/screens/add_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/chat_screen.dart';
import 'drawer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:air_club/helper/student.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ScreenSelectorStudent extends StatefulWidget {
  static String id = 'screen_selector';

  @override
  _ScreenSelectorState createState() => _ScreenSelectorState();
}

int flag = 0;

class _ScreenSelectorState extends State<ScreenSelectorStudent> {
  String userName = 'Username';
  List<StudentFlight> studentFlightList = [];
  var loadData = false;
  var _firebaseRef = FirebaseDatabase().reference();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    getUserData().then((value) {
      setState(() {
        loadData = true;
      });
    });
    _configureFirebaseListeners();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

/////////////////////////////////////local notifications
  Future onSelectNotification(String payload) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ScreenSelectorStudent()),
    );
  }

  showNotification(Map<String, dynamic> message) async {
    final data = message['data'];
    final not = message['notification'];
    var android = AndroidNotificationDetails('id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, not['title'], not['body'], platform,
        payload: data[message]);
  }

////////////////////////////////////////

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _configureFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        showNotification(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        showNotification(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        showNotification(message);
      },
    );
  }

////////////////////////////////////////
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
    _firebaseRef.once().then((DataSnapshot snapshot) {
      data = snapshot.value;
      data = data['Flights'];
      print(data);
      for (int i = 0; i < data.length; i++) {
        if (data[i] == null) {
          continue;
        }
        StudentFlight temp = StudentFlight();
        if (data[i]['studentname'] == userName) {
          print(data[i]);
          temp.aircraft = data[i]['aircraft'];
          temp.studentName = data[i]['studentname'];
          temp.instructorName = data[i]['instructorname'];
          temp.startTime = data[i]['startTime'];
          temp.date = data[i]['flightDate'];
          temp.requestToCancel = data[i]['requestToCancel'];
          temp.index = i;
          studentFlightList.add(temp);
        }
      }
    });
  }
/////////////////////////////////////////

  _refresh() {
    setState(() {
      loadData = false;
      studentFlightList = [];
    });
    getUserData().then((value) {
      setState(() {
        loadData = true;
      });
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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Transform.scale(
              scale: 1,
              child: IconButton(
                iconSize: 8.0,
                icon: Icon(
                  Icons.refresh,
                  size: 20,
                ),
                onPressed: () {
                  _refresh();
                },
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      drawer: DrawerWidget(userName),
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
                    height: 160,
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
                        FlatButton(
                          height: 30,
                          child: Text('Request to Cancel'),
                          color: requestToCancel ? Colors.grey : Colors.red,
                          textColor: Colors.white,
                          onPressed: () {
                            requestToCancel
                                ? null
                                : showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Request to Cancel?"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Yes"),
                                            onPressed: () async {
                                              await _firebaseRef
                                                  .child("Flights")
                                                  .child(index.toString())
                                                  .update({
                                                'requestToCancel': true,
                                              });
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ScreenSelectorStudent()),
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
