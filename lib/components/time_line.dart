


import 'package:claidflutter/components/CardTimeLine.dart';
import 'package:claidflutter/models/ClassModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';



class TimeLine extends StatefulWidget {

    TimeLine(this.classModel);
    final ClassModel classModel ;

  @override
  _TimeLineState createState() => _TimeLineState();

}

class _TimeLineState extends State<TimeLine> {


  @override
  Widget build(BuildContext context) {
    return Container
      (
        child:TimelineTile(
        alignment: TimelineAlign.manual,
        //  isFirst: true,
          indicatorStyle:  IndicatorStyle(
            width: 20,
            color: widget.classModel.color,
          ),
          beforeLineStyle:  LineStyle(
            color: Colors.grey[300],
            thickness: 5,
          ),
        lineXY: 0.2,
         endChild: Container(
          constraints:  BoxConstraints(
            minHeight: MediaQuery.of(context).size.height*0.2,
          ),
            child: CardTimeLine(widget.classModel),
        ),
          startChild: Container(
            margin: EdgeInsets.only(left: 20,top: 65),
            child: Column(children: <Widget>[
              Text(widget.classModel.start),
              Text(widget.classModel.end,style: TextStyle( color: Colors.black45),)
            ],),
        ),
        )
      );
}
}
