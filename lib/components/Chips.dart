


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterChips extends StatelessWidget {
int status;
String label;
Color color;


FlutterChips(this.status,this.label,this.color);


  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor:color,
        child: Icon(Icons.hourglass_empty,size: 20,),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,fontSize: 10
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(6.0),
    );
  }
}