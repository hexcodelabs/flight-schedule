import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  static String id = 'student_screen';
  StudentScreen({Key key}) : super(key: key);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
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
            leading: Container(),
          ),
          new SliverFixedExtentList(
            itemExtent: 350,
            delegate: SliverChildListDelegate(
              [
                containerMaker(context, 'Card 1'),
                containerMaker(context, 'Card 2'),
                containerMaker(context, 'Card 3'),
                containerMaker(context, 'Card 4'),
                containerMaker(context, 'Card 5'),
                containerMaker(context, 'Card 6'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

containerMaker(BuildContext context, String str1) {
  return Container(
      child: Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(str1,
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            MaterialButton(
                elevation: 5.0,
                child: Text('Request to cancel',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    )),
                onPressed: () {
                  // Navigator.of(context).pop();
                })
          ],
        ),
      ),
    ],
  ));
}
