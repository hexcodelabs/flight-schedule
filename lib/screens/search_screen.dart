import 'package:air_club/screens/home_screen.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.only(left: 29),
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
                margin: EdgeInsets.only(right:30,left: 30, top: 10),
                padding: EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(fontSize: 20.0),
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
                padding: EdgeInsets.only(left: 33, top: 40),
                alignment: Alignment.topLeft,
                child: Text("Search Result", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold ),),
              ),
              Container(
                padding: EdgeInsets.only(left: 33, top: 20),
                alignment: Alignment.topLeft,
                child: Text("${this.text}", style: TextStyle(fontSize: 20.0, color: Colors.grey),),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, top: 50),
                alignment: Alignment.topLeft,
                child: Text("Fri 27", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold ),),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, top: 50),
                alignment: Alignment.topLeft,
                child: Text("09AM", style: TextStyle(fontSize: 15.0, color: Colors.grey),),
              ),
              Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Divider(thickness: 2,)
              ),
              Container(
                height: 150.0,
                margin: EdgeInsets.only(left:74.0, right: 30.0),
                padding: EdgeInsets.only(left: 40.0, right: 10.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[50]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
//                    Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                        child: CircleAvatar(radius: 35.0, backgroundImage: NetworkImage('https://wallpapercave.com/wp/wp2365076.jpg'),)
//                    ),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Actor Name', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        SizedBox(height: 8.0,),
                        Text('CESSNA 152', style: TextStyle(fontSize: 12.0, color: Colors.grey),),
                        SizedBox(height: 10.0,),
                        Text('Student Name', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ],)),
                    Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                child: CircleAvatar(radius: 35.0, backgroundImage: NetworkImage('https://wallpapercave.com/wp/wp2365076.jpg'),)
                            ),
                          ],))

                  ],),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.topLeft,
                child: Text("10AM", style: TextStyle(fontSize: 15.0, color: Colors.grey),),
              ),
              Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Divider(thickness: 2,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

