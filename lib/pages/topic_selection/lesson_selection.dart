import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/pages/topic_selection/topic_selection.dart';
import 'package:flutter/material.dart';

class LessonSelection extends StatefulWidget {
  @override
  _LessonSelectionState createState() => _LessonSelectionState();
}

class _LessonSelectionState extends State<LessonSelection> {
  List<LessonModel> lessons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLessons();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey[200], Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            children: List.generate(lessons.length, (int position) {
              return ListCard(context, lessons[position]);
            })),
      ),
    );
  }

  Card ListCard(BuildContext context, LessonModel item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 4,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TopicSelection(item)),
                    );
                  },
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(item.Image)),
                    ),
                  )),
            ),
            Text(item.Title),
            Text("item.Class"),
          ],
        ),
      ),
    );
  }

  void loadLessons() {
    lessons = [
      LessonModel(
          "قرآن",
          "https://www.roshd.ir/Portals/18/Images/jeld/ghoran3.jpg",
        ),
      LessonModel(
          "علوم",
          "https://www.roshd.ir/Portals/18/Images/jeld/oloom3.jpg",
       ),
      LessonModel(
          "نگارش",
          "https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg",
         ),
      LessonModel(
          "هدیه های آسمانی",
          "https://www.roshd.ir/Portals/18/Images/jeld/hedyehaye-aseman-03.jpg",
       ),
      LessonModel(
          "فارسی",
          "https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg",
        ),
      LessonModel(
          "ورزش",
          "https://www.roshd.ir/Portals/18/Images/jeld/03-tarbiatbadani-1.jpg",
        ),
      LessonModel(
          "مطالعات اجتماعی",
          "https://www.roshd.ir/Portals/18/Images/jeld/motaleate-ejtemaiee-03.jpg",
         ),
      LessonModel(
          "ریاضی",
          "https://www.roshd.ir/Portals/18/Images/jeld/riyazi3.jpg",
       )
    ];
  }
}
