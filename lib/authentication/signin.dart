import 'package:air_club/authentication/signup.dart';
import 'package:air_club/helper/instructors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:air_club/screen_selectoInstructorr.dart';
import 'package:air_club/screenselectorStudent.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  static String id = 'signin';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  var emailIsEmpty = false;
  var passwordIsEmpty = false;

  var signedUpSuccessful = false;

  final _auth = FirebaseAuth.instance;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Authetication Failed"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Exit"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  onClickSignIn() async {
    final Email = email.text;
    final Password = password.text;
    var isInstructor = false;

    setState(() {
      emailIsEmpty = Email.isEmpty ? true : false;
      passwordIsEmpty = Password.isEmpty ? true : false;
    });

    if (!emailIsEmpty && !passwordIsEmpty && !isInstructor) {
      try {
        final newUser = await _auth.signInWithEmailAndPassword(
            email: Email, password: Password);
        if (newUser != null) {
          for (int i = 0; i < instructorList.length; i++) {
            if (Email == instructorList[i].email &&
                Password == instructorList[i].password) {
              isInstructor = true;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ScreenSelectorInstructor(instructorList[i])),
              );
            }
          }
          if (!isInstructor) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenSelectorStudent()),
            );
          }
        }
      } catch (e) {
        print(e);
        _showDialog();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
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
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                  child: SingleChildScrollView(
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
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 6.w),
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
                                        "E-mail",
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.h, horizontal: 2.w),
                                  child: TextField(
                                    controller: email,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.account_circle,
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
                                      hintText: "lorem@email.com",
                                      errorText: emailIsEmpty
                                          ? "Email can't be empty"
                                          : null,
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
                                  controller: password,
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
                                    errorText: passwordIsEmpty
                                        ? "Password can't be empty"
                                        : null,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              // Column(
                              //   children: <Widget>[
                              //     Align(
                              //       alignment: Alignment.centerRight,
                              //       child: Container(
                              //         child: Text(
                              //           "Froget Password?",
                              //           style: TextStyle(color: Colors.blue),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 30.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  onClickSignIn();
                                },
                                child: Container(
                                  height: 50.h,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 50.w),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
