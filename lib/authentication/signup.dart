import 'package:air_club/authentication/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  static String id = 'signup';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
        // backgroundColor: Colors.white10,
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
                      // height: 5.h,
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.64,
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
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
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
                                height: MediaQuery.of(context).size.height * 0.007,
                              ),
                              Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(
                                        "Email",
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.0024, horizontal: MediaQuery.of(context).size.width * 0.0053,),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email, color: Colors.blue.shade400,),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'OpenSans-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintText: "Lorem@mail.com",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.007,
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
                                height: MediaQuery.of(context).size.height * 0.007,
                              ),
                              Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(
                                        "Confirm Password",
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
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.061,
                                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.134),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.061),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.007,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, SignIn.id);
                                },
                                child: Text(
                                  "Already have an account ? Sign In",
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