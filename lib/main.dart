import 'package:flutter/material.dart';
import 'screen_selector.dart';

void main() => runApp(AirClub());

class AirClub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ScreenSelector(),
    );
  }
}
