import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/chat_screen.dart';

class ScreenSelector extends StatefulWidget {
  @override
  _ScreenSelectorState createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {
  int selectedPosition = 0;
  int _currentIndex = 0;
  List<Widget> _screenContainer = [
    HomeScreen(),
    ScheduleScreen(),
    NotificationScreen(),
    ChatScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          height: 61.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.add),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _buildBottomTab(),
        body: _screenContainer[selectedPosition],
      ),
    );
  }

  _buildBottomTab() {
    return Container(
      child: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 59,
          padding: const EdgeInsets.fromLTRB(27, 0, 27, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: SvgPicture.asset(
                    'images/home.svg',
                  width: 23,
                  height: 23,
                ),
                onPressed: (){
                  setState(() {
                    selectedPosition = 1;
                  });
                },
                splashRadius: 25,
              ),
              IconButton(
                icon: SvgPicture.asset('images/calendar.svg',
                  width: 23,
                  height: 23,),
                onPressed: (){
                  setState(() {
                    selectedPosition = 2;
                  });
                },
                splashRadius: 25,
              ),
              SizedBox(width: 48,),
              IconButton(
                icon: SvgPicture.asset('images/bell.svg',
                  width: 25,
                  height: 25,
                ),
                onPressed: (){
                  setState(() {
                    selectedPosition = 3;
                  });
                },
                splashRadius: 25,
              ),
              IconButton(
                icon: SvgPicture.asset('images/chat.svg',
                  width: 23,
                  height: 23,),
                onPressed: (){
                  setState(() {
                    selectedPosition = 0;
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