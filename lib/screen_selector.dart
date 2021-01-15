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
import 'screens/search_screen.dart';

class ScreenSelector extends StatefulWidget {
  static String id = 'screen_selector';
  @override
  _ScreenSelectorState createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {
  int _selectedPosition = 0;

  List<Widget> _screenContainer = [
    HomeScreen(),
    ScheduleScreen(),
    NotificationScreen(),
    ChatScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.05,
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
        actions: [
          IconButton(
            splashRadius: 20,
              icon: Icon(Icons.search_rounded),
              onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => SearchScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                }
              )
//                MaterialPageRoute(
//                  builder: (_){
//                    return SearchScreen();
//                  }
//                )
            );
          }),
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height*0.1,
        width: 60.w,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: (){
              popBottomSheet(context);
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomTab(),
      body: SafeArea(child: Container(
          height: MediaQuery.of(context).size.height*0.89,
          child: _screenContainer[_selectedPosition]
      )
      ),
    );
  }

  _buildBottomTab() {
    return Container(
      height: MediaQuery.of(context).size.height*0.06,
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
}
