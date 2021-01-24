import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class StudentScreen extends StatefulWidget {

  static String id = 'student_screen';
  StudentScreen({Key key}) : super(key: key);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}
int flag=0;
class _StudentScreenState extends State<StudentScreen> {
  bool _isExpanded = false;

  DateTime _selectedDate = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 30.0,
            floating: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(

            ),
          ),
          new SliverFixedExtentList(
            itemExtent: 350,

            delegate: SliverChildListDelegate(
              [
                containerMaker(context,'Card 1' ),
                //as example.....
                containerMaker(context,'Card 2'),
                containerMaker(context,'Card 3'),
                containerMaker(context,'Card 4'),
                containerMaker(context,'Card 5'),
                containerMaker(context,'Card 6'),
              ],
            ),

          )
        ],
      ),
    );
  }
}
containerMaker(BuildContext context,String str1) {

  return Container(
    //  padding: EdgeInsets.only(left: 44.0),
//                            color:Colors.lightBlueAccent,
      padding: EdgeInsets.only(bottom:20 ),
      //height: MediaQuery.of(context).size.height*0.9,
      child: Column(
        children: [
          //padding: EdgeInsets.only(left:30,top:5,right:0 ,bottom:5 ),
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.4,

            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: _backGround(),
              borderRadius: BorderRadius.circular(10.0),
            ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(str1, style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      SizedBox(height: 200.0,),
                      MaterialButton(
                          elevation: 5.0,
                          child: Text('Request to delete',style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          )),
                          onPressed: (){
                           // Navigator.of(context).pop();
                          }
                      )
                    ],
                  ),

          ),
        ],
      )


  );
}


Color _backGround(){
  Color color;
  if(flag==0){
    flag = flag+1;
    color = Color.fromRGBO(250, 238, 255, 1);
  }
  else if(flag==1){
    flag = flag+1;
    color = Color.fromRGBO(254, 243, 232, 1);
  }
  else{
    flag = 0;
    color = Color.fromRGBO(235, 251, 242, 1);
  }

  return color;
}
