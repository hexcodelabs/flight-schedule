import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: (){}),
        ],
      ),
      drawer: Drawer(),
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
      body: SafeArea(child: _screenContainer[_selectedPosition]),
    );
  }

  _buildBottomTab() {
    return Container(
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 59,
          padding: const EdgeInsets.fromLTRB(27, 0, 27, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: _selectedPosition==0?SvgPicture.asset(
                    'images/bottomBar/home.svg',
                  width: 23,
                  height: 23,
                  color: Colors.black,
                ):SvgPicture.asset(
                  'images/bottomBar/home.svg',
                  width: 23,
                  height: 23,
                  color: Colors.grey[600],
                ),
                onPressed: (){
                  setState(() {
                    _selectedPosition = 0;
                  });
                },
                splashRadius: 25,
              ),
              IconButton(
                icon: _selectedPosition==1?SvgPicture.asset('images/bottomBar/calendar.svg',
                  width: 23,
                  height: 23,
                  color: Colors.black,):SvgPicture.asset('images/bottomBar/calendar.svg',
                  width: 23,
                  height: 23,
                  color: Colors.grey[600],),
                onPressed: (){
                  setState(() {
                    _selectedPosition = 1;
                  });
                },
                splashRadius: 25,
              ),
              SizedBox(width: 48,),
              IconButton(
                icon: _selectedPosition==2?SvgPicture.asset('images/bottomBar/bell.svg',
                  width: 25,
                  height: 25,
                  color: Colors.black,
                ):SvgPicture.asset('images/bottomBar/bell.svg',
                  width: 25,
                  height: 25,
                  color: Colors.grey[600],
                ),
                onPressed: (){
                  setState(() {
                    _selectedPosition = 2;
                  });
                },
                splashRadius: 25,
              ),
              IconButton(
                icon: _selectedPosition==3?SvgPicture.asset('images/bottomBar/chat.svg',
                  width: 23,
                  height: 23,
                  color: Colors.black,):SvgPicture.asset('images/bottomBar/chat.svg',
                  width: 23,
                  height: 23,
                  color: Colors.grey[600],),
                onPressed: (){
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