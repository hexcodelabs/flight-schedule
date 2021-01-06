import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/chat_screen.dart';
import 'tab_item.dart';

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
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _buildBottomTab(),
        body: _screenContainer[selectedPosition],
      ),
    );
  }

  _buildBottomTab() {
    return BottomAppBar(
      color: Colors.deepPurple,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 59,
        padding: const EdgeInsets.fromLTRB(27, 0, 27, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TabItem(icon: Icons.home, isSelected: selectedPosition == 0, onTap: () {
              setState(() {
                selectedPosition = 0;
              });
            },),
            TabItem(icon: Icons.person, isSelected: selectedPosition == 1, onTap: () {
              setState(() {
                selectedPosition = 1;
              });
            },),
            SizedBox(width: 48,),
            TabItem(icon: Icons.help, isSelected: selectedPosition == 2, onTap: () {
              setState(() {
                selectedPosition = 2;
              });
            },),
            TabItem(icon: Icons.settings, isSelected: selectedPosition == 3, onTap: () {
              setState(() {
                selectedPosition = 3;
              });
            },),
          ],
        ),
      ),
    );
  }
}