import 'package:claidflutter/components/CardTimeLine.dart';
import 'package:claidflutter/components/InnerShadow.dart';
import 'package:claidflutter/components/square_button.dart';
import 'package:claidflutter/components/time_line.dart';
import 'package:claidflutter/models/ClassModel.dart';
import 'package:claidflutter/models/DetailModel.dart';
import 'package:claidflutter/models/LessonDetailModel.dart';
import 'package:claidflutter/models/LessonModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'detail_selection.dart';

class TopicSelection extends StatefulWidget {
  LessonModel item;

  TopicSelection(this.item);

  @override
  _TopicSelectionState createState() => _TopicSelectionState();
}

class _TopicSelectionState extends State<TopicSelection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  expandedHeight: size.height*0.35,
                  floating: false,
                  elevation: 0,
                  pinned: true,
                  shadowColor: Colors.grey[400],
                  backgroundColor: Colors.white60,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(widget.item.Title,
                          style: TextStyle(
                              color: kPrimaryLightColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    background: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0)),
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black54])
                              .createShader(bounds);
                        },
                        blendMode: BlendMode.darken,
                        child: Container(
                            decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 7.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(widget.item.Image),
                            fit: BoxFit.cover,
                          ),
                        )),
                      ),
                    ),
                  ),
                )
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: lessonDetailList.length,
                          itemBuilder: (context, i) {
                            return new ExpansionTile(
                              title: new Text(
                                lessonDetailList[i].title,
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              children: <Widget>[
                                new Column(
                                  children: _buildExpandableContent(
                                      lessonDetailList[i], widget.item),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildExpandableContent(LessonDetailModel lessonDetail, LessonModel item) {
    List<Widget> columnContent = [];

    for (DetailModel detail in lessonDetail.DetailList)
      columnContent.add(
        new ListTile(
          title: Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      radius: (30),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(detail.Url),
                      )),
                ),
                Text(
                  detail.Title,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (detail.State == 3)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      detail.Icon,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                if (detail.State == 2)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      detail.Icon,
                      color: Colors.blue,
                      size: 35,
                    ),
                  ),
                if (detail.State == 1)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      detail.Icon,
                      color: Colors.black26,
                      size: 30,
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FlatButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.green[900],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailSelection(item, detail)),
                          );
                        },
                        child: Text(
                          "جزئیات",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    return columnContent;
  }
}

final titles = ['بخش اول', 'بخش دوم', 'بخش سوم'];

List<LessonDetailModel> lessonDetailList = [
  new LessonDetailModel('بخش اول', [
    DetailModel(
        "assets/books/motaleatDetail/1.jpg", "درس اول", Icons.done_all, 3),
    DetailModel(
        "assets/books/motaleatDetail/2.jpg", "درس دوم", Icons.done_all, 3)
  ]),
  new LessonDetailModel('بخش دوم', [
    DetailModel(
        "assets/books/motaleatDetail/3.jpg", "درس سه", Icons.done_all, 3),
    DetailModel(
        "assets/books/motaleatDetail/4.jpg", "درس چهار", Icons.play_arrow, 2),
    DetailModel(
        "assets/books/motaleatDetail/5.jpg", "درس پنج", Icons.watch_later, 1),
    DetailModel(
        "assets/books/motaleatDetail/6.jpg", "درس شش", Icons.watch_later, 1)
  ]),
  new LessonDetailModel('بخش سوم', [
    DetailModel(
        "assets/books/motaleatDetail/7.jpg", "درس هفت", Icons.watch_later, 1)
  ])
];
