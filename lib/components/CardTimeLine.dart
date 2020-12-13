import 'package:claidflutter/components/Chips.dart';
import 'package:claidflutter/models/ClassModel.dart';
import 'package:claidflutter/models/ProgramPlanDateModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DescriptionChips.dart';

class CardTimeLine extends StatefulWidget {
  CardTimeLine(this.programPlanDateModel);

  final ProgramPlanDateModel programPlanDateModel;

  @override
  _CardTimeLineState createState() => _CardTimeLineState();
}

class _CardTimeLineState extends State<CardTimeLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.clamp),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 7.0,
                offset: Offset(4, 4)),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage(widget.programPlanDateModel.Lesson.Image),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.programPlanDateModel.Lesson.Title,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.programPlanDateModel.LessonSection,
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.black54)),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    for (int i = 0; i < widget.programPlanDateModel.Tags.length; i++)
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: FlutterDescriptionChips(
                                widget.programPlanDateModel.Tags[i],
                                10,
                                Colors.grey[200]),
                          ),
                        ],
                      ),
                  ],
                )
              ],
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      children: <Widget>[
                        if (widget.programPlanDateModel.Status == 3)
                          FlutterChips(
                              "اتمام کلاس", Colors.green, Icons.done_all),
                        if (widget.programPlanDateModel.Status == 2)
                          FlutterChips(
                              "شروع شده", Colors.blue, Icons.play_arrow),
                        if (widget.programPlanDateModel.Status == 1)
                          FlutterChips(
                              "شروع نشده", Colors.grey, Icons.access_time)
                      ],
                    )))
          ],
        ),
      ),
    );

    // return Container(
    //   height: 120.0,
    //   margin:EdgeInsets.all(10.0),
    //   decoration:BoxDecoration(borderRadius:   BorderRadius.all(Radius.circular(8.0)),
    //       gradient:   LinearGradient(colors:[Colors.white,Colors.white],
    //           begin: Alignment.centerLeft, end: Alignment.centerRight, tileMode: TileMode.clamp), boxShadow: [BoxShadow(
    //         color: Colors.grey.withOpacity(0.4),
    //         blurRadius: 7.0,
    //       ),]),
    //   child:Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //         Padding(padding:   EdgeInsets.only(left: 10.0, right: 10.0),
    //           child:   CircleAvatar(radius: 35.0, backgroundImage: NetworkImage(widget.classModel.url),)
    //       ),
    //         Expanded(
    //             child:Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //
    //             Text(widget.classModel.bookName, style:TextStyle(fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.bold),),
    //             SizedBox(height: 8.0,),
    //             Column(children: <Widget>[
    //
    //
    //                 Text(widget.classModel.section, style: TextStyle(fontSize: 10.0, color: Colors.black54)),
    //
    //
    //                  Positioned(bottom: 0,left: 0,
    //                    child: Row(
    //                      children: [
    //                      for(int i = 0 ;i<widget.classModel.tags.length;i++)
    //                        FlutterDescriptionChips(widget.classModel.tags[i]),
    //                    ],
    //                  ),)
    //
    //
    //
    //           ],)
    //         ],)),
    //         Padding(padding:EdgeInsets.only(left: 8.0, right: 8.0),
    //           child:Column(
    //
    //             children: <Widget>[
    //               if (widget.classModel.status == 3)
    //               FlutterChips(3,"اتمام کلاس",Colors.green),
    //                if(widget.classModel.status == 2)
    //                 FlutterChips(2,"شروع شده",Colors.blue),
    //               if(widget.classModel.status == 1)
    //                 FlutterChips(1,"شروع نشده",Colors.grey)
    //
    //                 ],))
    //
    //     ],),
    // );
  }
}
