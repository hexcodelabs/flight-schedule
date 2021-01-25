import 'package:air_club/authentication/signin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../screenselectorStudent.dart';

class SignUp extends StatefulWidget {
  static String id = 'signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  var usernameIsEmpty = false;
  var emailIsEmpty = false;
  var passwordIsEmpty = false;
  var confirmpasswordIsEmpty = false;

  var signedUpSuccessful = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _firebaseRef = FirebaseDatabase().reference();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  var userID;
  var token;

  _getToken() {
    _firebaseMessaging.getToken().then((value) {
      print(value);
      token = value;
    });
  }

  onClickSignUp() async {
    await _getToken();

    final Username = username.text;
    final Email = email.text;
    final Password = password.text;
    final Confirmpassword = confirmpassword.text;

    setState(() {
      usernameIsEmpty = Username.isEmpty ? true : false;
      emailIsEmpty = Email.isEmpty ? true : false;
      passwordIsEmpty = Password.isEmpty ? true : false;
      confirmpasswordIsEmpty = Confirmpassword.isEmpty ? true : false;
    });

    if (!usernameIsEmpty &&
        !emailIsEmpty &&
        !passwordIsEmpty &&
        !confirmpasswordIsEmpty) {
      if (Password != Confirmpassword) {
        _showDialogError("Password Does not match");
      } else {
        try {
          final newUser = await _auth.createUserWithEmailAndPassword(
              email: Email, password: Password);

          if (newUser != null) {
            final FirebaseUser user = await _auth.currentUser();

            _firebaseRef.child("Students").child(user.uid).set({
              'email': Email,
              'username': Username,
              'Password': Password,
              'token': token
            });
            _showDialog(user.uid);
          }
        } catch (e) {
          if (e.code == 'weak-password') {
            _showDialogError('The password provided is too weak.');
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            _showDialogError('The account already exists for that email.');
            print('The account already exists for that email.');
          }
        } catch (e) {
          _showDialogError('Error');
        }
      }
    }
  }

  void _showDialog(userid) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("SignedUp Successfull"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Continue"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScreenSelectorStudent()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogError(error) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(error),
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white10,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.blue[900], Colors.blue[400]]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.h,
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
              height: 10.h,
            ),
            Expanded(
              child: Container(
                height: 680.h,
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
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans'),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 6.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.h, horizontal: 2.w),
                                  child: TextField(
                                    controller: username,
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
                                      hintText: "username",
                                      errorText: usernameIsEmpty
                                          ? "Username can't be empty"
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.h, horizontal: 2.w),
                                  child: TextField(
                                    controller: email,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.email,
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
                                      hintText: "lorem@mail.com",
                                      errorText: emailIsEmpty
                                          ? "Email can't be empty"
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
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
                                    errorText: passwordIsEmpty
                                        ? "Password can't be empty"
                                        : null,
                                    hintStyle: TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: "******",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
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
                                  controller: confirmpassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.blue.shade400,
                                    ),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: "****",
                                    errorText: confirmpasswordIsEmpty
                                        ? "Confirm Password can't be empty"
                                        : null,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  onClickSignUp();
                                },
                                child: Container(
                                  height: 50.h,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 50.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.w),
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
                              ),
                              SizedBox(
                                height: 3.h,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
