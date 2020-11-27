


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AimLesson extends StatefulWidget {

  AimLesson(this.typeAim,this.description,this.background);

  String typeAim;
  String description;
  Color background;

  @override
  _AimLessonState createState() => _AimLessonState();
}

class _AimLessonState extends State<AimLesson> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [

        Container(
          width: size.width,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)
              ),
              color: widget.background,
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(
                  8.0),
              child:

              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  widget.typeAim,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )),

        Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            height: 0.5,
            width: size.width,
            color: Colors.black54,
          ),
        ),

        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.description))
      ],
    );
  }
}