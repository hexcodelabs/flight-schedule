import 'package:air_club/authentication/signin.dart';
import 'package:air_club/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen_selector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((val) {
    runApp(AirClub());
  });
}

class AirClub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      allowFontScaling: false,
      child: MaterialApp(
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
      ),
    );

  }
}
