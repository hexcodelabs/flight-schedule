import 'package:air_club/authentication/signin.dart';
import 'package:air_club/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen_selector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashscreen/splashscreen.dart';

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
        // initialRoute: SignIn.id,
        routes: {
          SignIn.id : (context) => SignIn(),
          SignUp.id : (context) => SignUp(),
          ScreenSelector.id : (context) => ScreenSelector(),
        },



        home: new MyApp(),

      ),
    );

  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 15,
        navigateAfterSeconds: new AfterSplash(),
        image: Image.asset('images/logo.png'),
        backgroundColor: Colors.blue[900],
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 150.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.blue[900]);
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SignIn(),

    );
  }
}
