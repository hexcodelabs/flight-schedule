import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height:500,
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height*0.5,
      child: Card(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)
          ),
        ),
        margin: EdgeInsets.all(0),
        color: Colors.white,
        elevation: 5.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 350.0;

  @override
  double get minExtent => 150.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

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
          new SliverFixedExtentList(
            itemExtent: 150,

            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left:15,top:15,right:15 ,bottom:2 ),
                        child:new Text(
                          'Today,',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),

                ),


                containerMaker(context,'Card 1', 'CESSNA 152','Student Name','startTime','endTime'),
                //as example.....
                containerMaker(context,'Card 2', 'CESSNA 152','Student Name','startTime','endTime'),
                containerMaker(context,'Card 3', 'CESSNA 152','Student Name','startTime','endTime'),
                containerMaker(context,'Card 4', 'CESSNA 152','Student Name','startTime','endTime'),
                containerMaker(context,'Card 5', 'CESSNA 152','Student Name','startTime','endTime'),
                containerMaker(context,'Card 6', 'CESSNA 152','Student Name','startTime','endTime'),
              ],
            ),

          )
        ],
      ),
    );
  }
}
containerMaker(BuildContext context,String str1, String str2, String str3, String startTime, String endTime) {

  return Container(
      padding: EdgeInsets.only(left: 44.0),
//                            color:Colors.lightBlueAccent,
      child: Column(
        children: [
          //padding: EdgeInsets.only(left:30,top:5,right:0 ,bottom:5 ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(startTime,
                  style: TextStyle(
                      fontSize: 12
                  ),),
                Expanded(
                    child: Divider(thickness: 3.0,)
                ),
              ]
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: _backGround(),
              borderRadius: BorderRadius.circular(15.0),
            ),
//                                    color: Colors.blue[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(

                  // width:MediaQuery.of(context).size.width*0.75,
                  height: 100,
                  padding: EdgeInsets.only(left: 5.0, top: 10.0),
//                                            color: Colors.amberAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(str1, style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 4.0,
                        width: 2.0,),
                      Text(str2, style: TextStyle(
                          fontSize: 12.0, color: Colors.grey),
                          textAlign: TextAlign.left),
                      SizedBox(height: 6.0,),
                      Text(str3, style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                IconButton(
                  icon: new Icon(Icons.cancel),
                  onPressed: (){createAlert(context,str1);},
                ),
              ],
            ),
          ),
          Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(endTime,
                  style: TextStyle(
                      fontSize: 12
                  ),),
                Expanded(
                    child: Divider(thickness: 3.0,)
                ),
              ]
          ),

        ],
      )


  );
}
createAlert(context,str1){
  return showDialog(context: context,builder: (context){
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width*0.7,
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,),
              Text("Are you sure ", style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 4.0,),
              Text("request to delete ", style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20.0,),
              Text('"'+str1+'"?', style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center
              ),
              SizedBox(
                height: 50.0,),
              MaterialButton(
                  elevation: 5.0,
                  child: Text('request',style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  )),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }
              )
            ],

          ),
        ),
      ),
    );
  });
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
