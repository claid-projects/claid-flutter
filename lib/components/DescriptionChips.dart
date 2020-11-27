


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterDescriptionChips extends StatefulWidget {

  FlutterDescriptionChips(this.label,this.fontSize,this.backgroundColor);

  String label;
  double fontSize;
  Color backgroundColor;

  @override
  _FlutterDescriptionChipsState createState() => _FlutterDescriptionChipsState();
}

class _FlutterDescriptionChipsState extends State<FlutterDescriptionChips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

          Chip(
            labelPadding: EdgeInsets.only(left:10.0,right: 10.0),

            label: Text(
              widget.label,
              style: TextStyle(
                  color: Colors.black,fontSize: widget.fontSize
              ),
            ),
            backgroundColor: widget.backgroundColor,


            padding: EdgeInsets.all(2.0),
          ),


      ],
    );



  }
}