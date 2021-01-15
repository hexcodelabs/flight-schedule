import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Aircraft extends StatefulWidget {
  static String id = 'aircrafts';
  @override
  _Aircraft createState() => _Aircraft();
}

class _Aircraft extends State<Aircraft> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.05,
        backgroundColor: Colors.blue[900],
        elevation: 0,
        leading: IconButton(
          splashRadius: 15,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: MediaQuery.of(context).size.height * 0.03,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(bottom: 25),
              height: MediaQuery.of(context).size.height * 0.10,
              decoration: BoxDecoration(
                color: Colors.blue[900],
              ),
              child: Center(
                  child: Text(
                "Aircrafts",
                style: TextStyle(fontSize: 40.sp, color: Colors.white),
              )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 20),
            child: Column(
              children: [
                listtitleshow("AirCraft-01"),
                Divider(),
                listtitleshow("AirCraft-02"),
                Divider(),
                listtitleshow("AirCraft-03"),
                Divider(),
                listtitleshow("AirCraft-04"),
                Divider(),
                listtitleshow("AirCraft-05"),
                Divider(),
                listtitleshow("AirCraft-06"),
                Divider(),
                listtitleshow("AirCraft-07"),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget listtitleshow(String s) {
  return ListTile(
    onTap: () {},
    title: Text(s),
    subtitle: Text(s),
    // tileColor: Colors.grey,
    leading: Icon(
      Icons.account_circle_rounded,
      color: Colors.black87,
    ),
    trailing: Icon(Icons.edit),
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    var controllPoint = Offset(25, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
