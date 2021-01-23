import 'package:air_club/authentication/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:air_club/screen_selector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  static String id = 'signin';

  @override
  Widget build(BuildContext context) {
    return Material(

      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.blue[900], Colors.blue[400]]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              // height: 30.h,
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.03, horizontal: MediaQuery.of(context).size.width * 0.053),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.432,
                      height: MediaQuery.of(context).size.height * 0.142,
                      image: AssetImage('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.001,
                  ),
                ],
              ),
            ),
            SizedBox(
              // height: 20.h,
              height: MediaQuery.of(context).size.height * 0.03,
            ),//0.3
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.64,
                // color: Colors.blue,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08),
                        topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.036, horizontal: MediaQuery.of(context).size.width * 0.05,),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30.sp,
                            fontFamily: 'Open Sans'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.53,
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.008, horizontal: MediaQuery.of(context).size.width * 0.008,),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.013),
                        ),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Text(
                                      "Username",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(

                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                                // boxShadow: [
                                //   BoxShadow(
                                //       color:
                                //           Color.fromRGBO(170, 175, 174, .3),
                                //       blurRadius: 20,
                                //       offset: Offset(0, 10))
                                // ],
                                color: Colors.white,
                              ),

                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.0024, horizontal: MediaQuery.of(context).size.width * 0.0053,),
                                child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.account_circle, color: Colors.blue.shade400,),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: "Lorem Imphesm",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.012,
                            ),
                            Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Text(
                                      "Password",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                                color: Colors.white,
                              ),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.blue.shade400,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'OpenSans-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  hintText: "****",
                                  contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.012, horizontal: MediaQuery.of(context).size.width * 0.026,),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Text(
                                      "Froget Password?",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.036,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, ScreenSelector.id);
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.061,
                                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.134,),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.050,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SignUp.id);
                              },
                              child: Text(
                                "Don't have account ? Sign Up",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}