
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NewReg extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      child:Scaffold(
        floatingActionButton:FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            popBottomSheet(context);
          },
        ),floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

}

void popBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25),
      )
      ),
      context: context, builder:(BuildContext bc){
    return Container(

      height: MediaQuery.of(context).size.height*.86,
      child:  form(context) ,
    );
  });
}

Widget form(BuildContext context) {
  return Container(
    margin:EdgeInsets.only(left: 30,right: 30),
    padding: EdgeInsets.zero,
    child:ListView(
        children:<Widget> [
          Column(
            children: <Widget>[
              Container(
                // color: Colors.blueGrey,
                  child: AddNewEvent()),
              Container(
                // color: Colors.blueGrey,
                  margin: EdgeInsets.only(top:35,bottom:0),
                  height:60,
                  child: fillBox("Flight Instructor")),
              Container(

                  margin: EdgeInsets.only(top:35,bottom:0),
                  height:60,
                  child:fillBoxInsert("Student")),
              Container(
                  margin: EdgeInsets.only(top:35,bottom:0),
                  height:60,
                  child: fillBox("Aircraft")),
              Container(
                  margin: EdgeInsets.only(top:35,bottom:0),
                  height:60,
                  child: fillBoxDate("Date",context)),
              Container(
                margin: EdgeInsets.only(top:35,bottom:0),

                height:60,
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
                margin: EdgeInsets.only(bottom:50),
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
    margin: EdgeInsets.only(top:35,bottom:0),
    width: 207,
    height:47,
    child:
    RaisedButton(
      onPressed: (){},
      child: Text(text,style: TextStyle(fontSize: 16,fontFamily:'OpenSans-Bold',color: Colors.white),),
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
            child: Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily:'OpenSans',),),
          )
      ),
      Container(
        // color: Colors.blue,
        margin: EdgeInsets.only(top:0),

        // color: Colors.blue,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height:40,
            child: DropdownButton(

              icon: Container(
                  alignment: Alignment.centerRight,
                  // color: Colors.blueGrey,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(left: 204),
                  child: IconButton(
                    icon:Icon(Icons.arrow_drop_down,size:25,),
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

                  child: Text("Select Date",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:Colors.black87,fontFamily:'OpenSans'),)),

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
            child: Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily:'OpenSans',),),
          )
      ),
      Container(
        margin: EdgeInsets.only(top:0),
        // color: Colors.blue,
        child: Container(
          height:40,
          child: TextField(
            decoration: InputDecoration(
                hintStyle: TextStyle(fontSize:13.5,fontWeight:FontWeight.bold,color:Colors.black87),
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
            child: Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily:'OpenSans'),),
          )
      ),
      Container(
        margin: EdgeInsets.only(top:0),
        // color: Colors.blue,
        child: Container(
          height:40,
          child: DropdownButtonFormField(
            isExpanded: true,
            hint:Text("Leorm Ipsum",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,color:Colors.black87,fontFamily:'OpenSans-Bold'),
              textAlign:TextAlign.start ,) ,
            items: <String>['Leorm Ipsum', 'Leorm Ipsum', 'Leorm Ipsum', 'Leorm Ipsum'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: Text(value,style:TextStyle(fontSize: 14.0,fontWeight:FontWeight.bold,color:Colors.black87,fontFamily:'OpenSans-Bold'),

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

Widget AddNewEvent() {
  return Align(
    alignment: Alignment.center,
    child: Row(
      children: [
        (
            Container(
              margin:EdgeInsets.only(top:20),
              height:25,
              width: 154,
              // color: Colors.blue,
              child: Align(
                alignment: Alignment.centerLeft,
                child:Text("Add New Event",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 22,fontFamily: 'OpenSans-Bold'),),
              ),
            )
        ),
        Container(
          margin:EdgeInsets.only(left:120,top:20),
          height: 15,
          width: 15,
          child:IconButton(
            icon:Icon(Icons.clear,color: Colors.black,) ,
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(),
          ),
        ),
      ],
    ),
  );
}
