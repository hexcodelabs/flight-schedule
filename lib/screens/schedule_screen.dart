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

      width: double.infinity,
      height: 800.0,
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

class DayPickerBar extends StatefulWidget {
  DayPickerBar({ this.selectedDate, this.onChanged });

  final DateTime selectedDate;

  final ValueChanged<DateTime> onChanged;

  DayPickerBarState createState() => new DayPickerBarState();
}

class DayPickerBarState extends State<DayPickerBar> {
  DateTime _displayedMonth = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomPadding: false;
    return  Container(
      color:Colors.white,
      height: 300.0,

      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _displayedMonth = new DateTime(
                  _displayedMonth.year,
                  _displayedMonth.month - 1,
                );
              });
            },
          ),
          new Expanded(
            child: new DayPicker(
              selectedDate: widget.selectedDate,
              currentDate: new DateTime.now(),
              displayedMonth: _displayedMonth,
              firstDate: new DateTime.now().subtract(new Duration(days: 1)),
              lastDate: new DateTime.now().add(new Duration(days: 30)),
              onChanged: widget.onChanged,
            ),
          ),
          new IconButton(
            icon: new Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _displayedMonth = new DateTime(
                  _displayedMonth.year,
                  _displayedMonth.month + 1,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}


class ScheduleScreen extends StatefulWidget {

  static String id = 'shedule_screen';
  ScheduleScreen({Key key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}
int flag=0;
class _ScheduleScreenState extends State<ScheduleScreen> {
  bool _isExpanded = false;

  DateTime _selectedDate = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new CustomScrollView(
        slivers: <Widget>[

          new SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 0.0,
            floating: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(

            ),
          ),
          SliverPersistentHeader(

            // shape: ContinuousRectangleBorder(
            //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
            pinned: true,

            delegate: PersistentHeader(
              widget: Column(

                // Format this to meet your need
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child:Container(
                      margin: const EdgeInsets.only(left: 0.0, right: 0.0,bottom: 30),
                      child: new DayPickerBar(
                        onChanged: (DateTime value) {
                          setState(() {
                            _selectedDate = value;
                          });
                        },
                        selectedDate: _selectedDate,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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
                      // Padding(
                      //   padding: EdgeInsets.only(left:15,top:15,right:15 ,bottom:2 ),
                      //   child:new Text(
                      //    // data['time'],
                      //     style: TextStyle(
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                    ],
                  ),

                ),
                containerMaker('Instructor Name', 'CESSNA 152','Student Name'),
                containerMaker('Instructor Name', 'CESSNA 152','Student Name'),
                containerMaker('Instructor Name', 'CESSNA 152','Student Name'),
                containerMaker('Instructor Name', 'CESSNA 152','Student Name'),


              ],
            ),

          )
        ],
      ),
    );
  }
}
Widget containerMaker( String str1, String str2, String str3){
  return Container(
      margin: const EdgeInsets.only(left: 74, right: 30,bottom: 50),
      height: 101,
      width: 197,

      decoration: BoxDecoration(
        color: _backGround(),
        borderRadius: BorderRadius.circular(10),
      ),

      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:15,top:15,right:15 ,bottom:2 ),
            child:new Text(
              str1,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:14,top:0,right:189 ,bottom:10 ),
            child:new Text(
              str2,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:14,top:0,right:0 ,bottom:10 ),
            child:new Text(
              str3,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
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
