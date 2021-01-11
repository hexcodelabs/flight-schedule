import 'package:air_club/authentication/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:air_club/screen_selector.dart';

class SignIn extends StatelessWidget {
  static String id = 'signin';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.blue[900], Colors.blue[400]]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'OpenSans-Bold'),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
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
                                padding: const EdgeInsets.all(2.0),
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
                              height: 10,
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
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
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
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, ScreenSelector.id);
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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


//
// // void main() {
// //   runApp(MyApp());
// // }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white10,
//         body: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 colors: [Colors.blue[900], Colors.blue[400]]),
//           ),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 80,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       child: Image(
//                         image: AssetImage('images/logo.png'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(60),
//                           topRight: Radius.circular(60))),
//                   child: Padding(
//                     padding: EdgeInsets.all(30),
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           "Sign In",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 30,
//                               fontFamily: 'OpenSans-Bold'),
//                         ),
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Column(
//                             children: <Widget>[
//                               Column(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Container(
//                                       child: Text(
//                                         "Username",
//                                         style: TextStyle(color: Colors.grey),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//
//                                 decoration: BoxDecoration(
//                                   border: Border(
//                                       bottom: BorderSide(color: Colors.grey)),
//                                   // boxShadow: [
//                                   //   BoxShadow(
//                                   //       color:
//                                   //           Color.fromRGBO(170, 175, 174, .3),
//                                   //       blurRadius: 20,
//                                   //       offset: Offset(0, 10))
//                                   // ],
//                                   color: Colors.white,
//                                 ),
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: TextField(
//                                     decoration: InputDecoration(
//                                       suffixIcon: Icon(Icons.account_circle, color: Colors.blue.shade400,),
//                                       border: InputBorder.none,
//                                       focusedBorder: InputBorder.none,
//                                       enabledBorder: InputBorder.none,
//                                       errorBorder: InputBorder.none,
//                                       disabledBorder: InputBorder.none,
//                                       hintStyle: TextStyle(
//                                         fontFamily: 'OpenSans-Bold',
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                       hintText: "Lorem Imphesm",
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Column(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Container(
//                                       child: Text(
//                                         "Password",
//                                         style: TextStyle(color: Colors.grey),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   border: Border(
//                                       bottom: BorderSide(color: Colors.grey)),
//                                   color: Colors.white,
//                                 ),
//                                 child: TextField(
//                                   obscureText: true,
//                                   decoration: InputDecoration(
//                                     suffixIcon: Icon(
//                                       Icons.lock,
//                                       color: Colors.blue.shade400,
//                                     ),
//                                     border: InputBorder.none,
//                                     focusedBorder: InputBorder.none,
//                                     enabledBorder: InputBorder.none,
//                                     errorBorder: InputBorder.none,
//                                     disabledBorder: InputBorder.none,
//                                     hintStyle: TextStyle(
//                                       fontFamily: 'OpenSans-Bold',
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     hintText: "****",
//                                     contentPadding: EdgeInsets.all(10.0),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 40,
//                               ),
//                               Column(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.centerRight,
//                                     child: Container(
//                                       child: Text(
//                                         "Froget Password?",
//                                         style: TextStyle(color: Colors.blue),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               GestureDetector(
//                                 onTap: ,
//                                 child: Container(
//                                   height: 50,
//                                   margin: EdgeInsets.symmetric(horizontal: 50),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     color: Colors.blue,
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "SIGN IN",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 16),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 100,
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   "Don't have account ? Sign Up",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }