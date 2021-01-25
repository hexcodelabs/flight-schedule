import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:air_club/authentication/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

double paddingTop = 30.h;
double paddingLeft = 36.w;

class DrawerWidget extends StatelessWidget {
  static String id = 'drawer';
  var userName;
  DrawerWidget(this.userName);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0.h)),
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.only(left: paddingLeft),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25.0.w,
                          backgroundImage: AssetImage('images/user.png'),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          this.userName,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              // DrawerTile(icon:Icons.person_rounded,  title:'My Profile'),
              // DrawerTile(icon:Icons.calendar_today_outlined,  title:'Schedule'),
              // DrawerTile(icon:Ionicons.airplane,  title:'Courses'),
              // DrawerTile(icon:Icons.history,  title:'History'),
              // DrawerTile(icon:Icons.settings,  title:'Settings'),
              // DrawerTile(icon:CupertinoIcons.checkmark_shield,  title:'Privacy Policy'),
              // SizedBox(
              //   height: ( MediaQuery.of(context).size.height * 0.20 - MediaQuery.of(context).padding.top),
              // ),
              DrawerTile(icon: Icons.logout, title: 'Log Out'),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  DrawerTile({@required this.icon, this.title});

  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(paddingLeft, 0, 0, 0),
        // horizontalTitleGap: 0,
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(fontSize: 16.sp),
        ),
        onTap: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        },
      ),
    );
  }
}
