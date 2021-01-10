import 'package:air_club/authentication/signin.dart';
import 'package:air_club/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer_util.dart';
import 'screen_selector.dart';

void main() => runApp(AirClub());

class AirClub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.white,
                scaffoldBackgroundColor: Colors.white,
                fontFamily: 'Open Sans'
            ),

            initialRoute: SignIn.id,
            routes: {
              SignIn.id : (context) => SignIn(),
              SignUp.id : (context) => SignUp(),
              ScreenSelector.id : (context) => ScreenSelector(),
            },

            // home: ScreenSelector(),
          );
        },
      );
    });

  }
}
