import 'package:air_club/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String text="";

  void func(text) {
    setState(() {
      this.text = "\"" +text +"\"";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 29.w),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context, HomeScreen());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right:30.w,left: 30.w, top: 10.h),
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(fontSize: 20.0.sp),
                  onChanged: func,
                ),
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2,3.5), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
//                color: Colors.grey,
                margin: EdgeInsets.only(left: 33.w, top: 20.h),
                alignment: Alignment.topLeft,
                child: Text("Search Result", style: TextStyle(fontSize: 40.0.sp, fontWeight: FontWeight.bold ),),
              ),
              Container(
                padding: EdgeInsets.only(left: 33.w, top: 20.h),
                alignment: Alignment.topLeft,
                child: Text("${this.text}", style: TextStyle(fontSize: 20.0.sp, color: Colors.grey),),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.w, top: 50.h),
                alignment: Alignment.topLeft,
                child: Text("Fri 27", style: TextStyle(fontSize: 15.0.sp, fontWeight: FontWeight.bold ),),
              ),
             Container (
               margin: EdgeInsets.only(left: 10.0.w),
               height:  MediaQuery.of(context).size.height*.80,
//                  color: Colors.grey,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Row(
                          children: <Widget>[
                            Text("09AM"),
                            Expanded(
                                child: Divider(thickness: 3.0,)
                            ),
                          ]
                      ),
                      ListTile(
                        title: Container(
//                            color:Colors.lightBlueAccent,
                            child: Column(
                              children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue[50],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
//                                    color: Colors.blue[50],
                                    child: Row(
                                      children: [
                                        Container(
                                            width:MediaQuery.of(context).size.width*0.75,
                                            height: 100.h,
                                            padding: EdgeInsets.only(left: 5.0, top: 10.0),
//                                            color: Colors.amberAccent,
                                            child: Column(
                                              children: [
                                                Text('Actor Name', style: TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                                                SizedBox(height: 4.0,width: 2.0,),
                                                Text('CESSNA 152', style: TextStyle(fontSize: 12.0.sp, color: Colors.grey),textAlign: TextAlign.left),
                                                SizedBox(height: 6.0,),
                                                Text('Student Name', style: TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                              Icons.account_circle,size: 60.w,
                                            )
                                      ],
                                    ),
                                  )

                              ],
                            )),

                      ),
                      Row(
                          children: <Widget>[
                            Text("10AM"),
                            Expanded(
                                child: Divider(thickness: 3.0,)
                            ),
                          ]
                      ),
                      ListTile(
                        title: Container(
//                            color:Colors.lightBlueAccent,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width*0.75,
                                        height: 100,
                                        padding: EdgeInsets.only(left: 5.0, top: 10.0),
//                                            color: Colors.amberAccent,
                                        child: Column(
                                          children: [
                                            Text('Actor Name', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
                                            SizedBox(height: 4.0,),
                                            Text('CESSNA 152', style: TextStyle(fontSize: 12.0, color: Colors.grey),textAlign: TextAlign.left),
                                            SizedBox(height: 6.0,),
                                            Text('Student Name', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.account_circle,size: 60,
                                      )
                                    ],
                                  ),
                                )

                              ],
                            )),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

