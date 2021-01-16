import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void popBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25),
      )
      ),
      context: context, builder:(BuildContext bc){
    return Container(

      height: MediaQuery.of(context).size.height*.85,
      child:  form(context) ,
    );
  });
}

Widget form(BuildContext context) {
  return Container(
    margin:EdgeInsets.only(left: 30.w,right: 30.w),
    padding: EdgeInsets.zero,
    child:ListView(
        children:<Widget> [
          Column(
            children: <Widget>[
              Container(
                // color: Colors.blueGrey,
                  child: AddNewEvent(context)),
              Container(
                // color: Colors.blueGrey,
                  margin: EdgeInsets.only(top:35.h,bottom:0),
                  height:60.h,
                  child: fillBox("Flight Instructor")),
              Container(

                  margin: EdgeInsets.only(top:35.h,bottom:0),
                  height:60.h,
                  child:fillBoxInsert("Student")),
              Container(
                  margin: EdgeInsets.only(top:35.h,bottom:0),
                  height:60.h,
                  child: fillBox("Aircraft")),
              Container(
                  margin: EdgeInsets.only(top:35.h,bottom:0),
                  height:60.h,
                  child: fillBoxDate("Date",context)),
              Container(
                margin: EdgeInsets.only(top:35.h,bottom:0),
                height:60.h,

                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: fillBoxInsert("Start Time")),

                    Flexible(
                        flex: 1,
                        child: fillBoxInsert("End")),
                  ],
                ),
              ),
              Container(
                child: button("Add"),
              )
            ],
          ),
        ]
    ),
  ) ;
}

Widget button(String text) {
  return Container(
    margin: EdgeInsets.only(top:50.h,bottom:0.h),
    width: 207.w,
    height:47.w,
    child:
    RaisedButton(
      onPressed: (){},
      child: Text(text,style: TextStyle(fontSize: 16.sp,fontFamily:'OpenSans-Bold',color: Colors.white),),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),

  );
}

Widget fillBoxDate(String text,BuildContext context) {
  return  Column(
    children: [

      Container(

          padding: EdgeInsets.zero,
          margin: EdgeInsets.all(0),
          // color: Colors.black87,
          child:
          Align(
            alignment: Alignment.centerLeft,
            child: Text(text,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,fontFamily:'OpenSans',),),
          )
      ),
      Container(
        // color: Colors.blue,
        margin: EdgeInsets.only(top:0),

        // color: Colors.blue,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height:40.h,
            child: DropdownButton(

              icon: Container(
                  alignment: Alignment.centerRight,
                  // color: Colors.blueGrey,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(left: 225.w),
                  child: IconButton(
                    icon:Icon(Icons.arrow_drop_down,size:25.w,),
                    color: Colors.black87,
                    padding: EdgeInsets.all(0),
                    constraints: BoxConstraints(),

                    onPressed: (){
                      print("Hello");
                      showDatePicker(
                        context:context ,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2200),
                      );
                    },
                  )),
              hint:Container(

                  child: Text("Select Date",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color:Colors.black87,fontFamily:'OpenSans'),)),

            ),
          ),
        ),
      )
    ],
  );
}

Widget fillBoxInsert(String text) {
  return  Column(
    children: [

      Container(

          padding: EdgeInsets.zero,
          margin: EdgeInsets.all(0),
          // color: Colors.black87,
          child:
          Align(
            alignment: Alignment.centerLeft,
            child: Text(text,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,fontFamily:'OpenSans',),),
          )
      ),
      Container(
        margin: EdgeInsets.only(top:0),
        // color: Colors.blue,
        child: Container(
          height:40.h,
          child: TextField(
            decoration: InputDecoration(
                hintStyle: TextStyle(fontSize:13.5.sp,fontWeight:FontWeight.bold,color:Colors.black87),
                hintText: "Leorm Ipsum"
            ),
          ),
        ),
      )
    ],
  );
}

Widget fillBox(String text) {
  return  Column(
    children: [

      Container(

          padding: EdgeInsets.zero,
          margin: EdgeInsets.all(0),
          // color: Colors.black87,
          child:
          Align(
            alignment: Alignment.centerLeft,
            child: Text(text,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,fontFamily:'OpenSans'),),
          )
      ),
      Container(
        margin: EdgeInsets.only(top:0),
        // color: Colors.blue,
        child: Container(
          height:42.h,
          child: DropdownButtonFormField(
            isExpanded: true,
            hint:Text("Leorm Ipsum",style: TextStyle(fontSize: 14.sp,fontWeight:FontWeight.bold,color:Colors.black87,fontFamily:'OpenSans-Bold'),
              textAlign:TextAlign.start ,) ,
            items: <String>['Leorm Ipsum', 'Leorm', 'Leorm 1 Ipsum', 'Leorm 2Ipsum'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: Text(value,style:TextStyle(fontSize: 14.0.sp,fontWeight:FontWeight.bold,color:Colors.black87,fontFamily:'OpenSans-Bold'),

                ),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      )
    ],
  );
}

Widget AddNewEvent(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      (
          Container(
            margin:EdgeInsets.only(top:30.h),
            height:25.h,
            width: 154.w,
            // color: Colors.blue,
            child: Align(
              alignment: Alignment.centerLeft,
              child:Text("Add New Event",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 22.sp,fontFamily: 'OpenSans-Bold'),),
            ),
          )
      ),
      Container(
        margin:EdgeInsets.only(top:30.h),
        // color: Colors.blueGrey,
        child:IconButton(
          splashRadius: 20.w,
          iconSize: 15.w,
          icon: Icon(
            Icons.clear,color: Colors.black,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(
            maxWidth: 15.w,
            minHeight: 15.h,
          ),  onPressed: () => Navigator.pop(context, true),
        ),
      ),
    ],
  );
}