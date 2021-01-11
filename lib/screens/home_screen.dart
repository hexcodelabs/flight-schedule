import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double horizontalPadding = 30.w;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      // height: 525.h,
      // width: 315.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 21),
              child: Text('Categories',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              )
          ),
          Row(
            children: [
              CardWidget(path: 'images/home_cards/flight-time.png', title:'Flight Hours'),
              SizedBox(width: 23.w,),
              CardWidget(path: 'images/home_cards/document.png', title:'Reports')
            ],
          ),
          SizedBox(height: 23.h),
          Row(
            children: [
              CardWidget(path: 'images/home_cards/money-bill.png', title:'Financial'),
              SizedBox(width: 23.w,),
              CardWidget(path: 'images/home_cards/Path.png', title:'Maintenance')
            ],
          ),
          SizedBox(height: 23.h),
          Row(
            children: [
              CardWidget(path: 'images/home_cards/plane.png', title:'Aircraft'),
              SizedBox(width: 23.w,),
              CardWidget(path: 'images/home_cards/headphone.png', title:'Lorem Ipsum')
            ],
          ),
          SizedBox(height: 90.h,)
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
      height: 146.h,
      width: 146.w,
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
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            // TODO: Navigate to specific screen
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                width: 43.w,
                height: 43.h,
                image: AssetImage(path),
              ),
              Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

