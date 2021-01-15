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
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
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
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image(
                      width: 162.w,
                      height: 114.h,
                      image: AssetImage('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.w),
                        topRight: Radius.circular(30.w))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
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
                        height: 40.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.w),
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
                                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
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
                              height: 10.h,
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
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
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
                              height: 30.h,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, ScreenSelector.id);
                              },
                              child: Container(
                                height: 50.h,
                                margin: EdgeInsets.symmetric(horizontal: 50.w),
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
                              height: 50.h,
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
            )
          ],
        ),
      ),
    );
  }
}
