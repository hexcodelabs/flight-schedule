import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0)),
      child: Drawer(
        child: Container(
          padding: EdgeInsets.fromLTRB(36, 66, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('images/user.png'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              DrawerTile(icon:Icons.person_rounded,  title:'My Profile'),
              DrawerTile(icon:Icons.calendar_today_outlined,  title:'Schedule'),
              DrawerTile(icon:Ionicons.airplane,  title:'Courses'),
              DrawerTile(icon:Icons.history,  title:'History'),
              DrawerTile(icon:Icons.settings,  title:'Settings'),
              DrawerTile(icon:CupertinoIcons.checkmark_shield,  title:'Privacy Policy'),
              SizedBox(
                height: 60,
              ),
              DrawerTile(icon:Icons.logout,  title:'Log Out'),
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
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}