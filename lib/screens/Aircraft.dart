import 'package:flutter/material.dart';

class Aircraft extends StatefulWidget {
  @override
  
  _Aircraft createState() => _Aircraft();

}

class _Aircraft extends State<Aircraft> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
          ),
          body:ListView(
              children: [
                     ClipPath(
                       clipper: MyClipper(),
                       child: Container(
                        height: MediaQuery.of(context).size.height*.25,
                        decoration: BoxDecoration(
                          color: Colors.blue
                        ),
                        child: Center(
                            child: Text("AirCraft",style:TextStyle(fontSize:60,color: Colors.white),)),
                    ),),
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10,top: 20),
                    child: Column(
                      children: [
                        listtitleshow("AirCraft-01"),
                        Divider(),
                        listtitleshow("AirCraft-02"),
                        Divider(),
                        listtitleshow("AirCraft-03"),
                        Divider(),
                        listtitleshow("AirCraft-04"),
                        Divider(),
                        listtitleshow("AirCraft-05"),
                        Divider(),
                        listtitleshow("AirCraft-06"),
                        Divider(),
                        listtitleshow("AirCraft-07"),
                        Divider(),

                      ],
                    ),
                )
              ],
          ),
    );
  }
}

Widget listtitleshow(String s) {
  return ListTile(
    onTap: (){},
    title: Text(s),
    subtitle: Text(s),
    // tileColor: Colors.grey,
    leading: Icon(Icons.account_circle_rounded,color: Colors.black87,),
    trailing: Icon(Icons.edit),
  );
}

class MyClipper  extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-70);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width,size.height);
    path.lineTo(size.width,0 );
    return path;
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

