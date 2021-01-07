import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 21),
              child: Text('Categories',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )
          ),
          Expanded(child: Row(
            children: [
              CardWidget(path: 'images/home_cards/flight-time.png', title:'Flight Hours'),
              SizedBox(width: 23,),
              CardWidget(path: 'images/home_cards/document.png', title:'Reports')
            ],
          )),
          SizedBox(height: 23),
          Expanded(child: Row(
            children: [
              CardWidget(path: 'images/home_cards/money-bill.png', title:'Financial'),
              SizedBox(width: 23,),
              CardWidget(path: 'images/home_cards/Path.png', title:'Maintenance')
            ],
          )),
          SizedBox(height: 23),
          Expanded(child: Row(
            children: [
              CardWidget(path: 'images/home_cards/plane.png', title:'Aircraft'),
              SizedBox(width: 23,),
              CardWidget(path: 'images/home_cards/headphone.png', title:'Lorem Ipsum')
            ],
          )),
          SizedBox(height: 90,)
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  CardWidget({@required this.path, this.title});
  String path;
  String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      height: 146,
      width: 146,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            'images/bottomBar/home.svg',
            width: 23,
            height: 23,
            color: Colors.grey[600],
          ),
          Text(title,
            style: TextStyle(
              fontFamily: 'OpenSans-Semibold',
              fontSize: 15.0,
            ),
          )
        ],
      ),
    ));
  }
}

