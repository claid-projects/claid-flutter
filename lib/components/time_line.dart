


import 'package:claidflutter/components/CardTimeLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';



class TimeLine extends StatelessWidget {
  String startTime;
  String endTime;
  int state ;
  String url ;
  TimeLine(this.startTime,this.endTime,this.state,this.url);
  @override
  Widget build(BuildContext context) {
    return Container
      (
        child:TimelineTile(
        alignment: TimelineAlign.manual,
        //  isFirst: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Colors.purple,
          ),
          beforeLineStyle: const LineStyle(
            color: Colors.purple,
            thickness: 6,
          ),
        lineXY: 0.2,
         endChild: Container(
          constraints: const BoxConstraints(
            minHeight: 161.5,
          ),
            child: CardTimeLine(state,url),
        ),
          startChild: Container(
            margin: EdgeInsets.only(left: 20,top: 65),
            child: Column(children: <Widget>[
              Text(startTime),
              Text(endTime,style: TextStyle( color: Colors.black45),)


            ],),
        ),
        )
      );
}


}
