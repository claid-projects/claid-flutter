///
/// Created by NieBin on 18-12-5
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import 'view_selector.dart';

const _CHILD_TITLE = "Clild List Count";
const _CHILD_VALUES = [
  "زنگ اول",
  "زنگ دوم",
  "زنگ سوم",
  "زنگ چهارم",
  "زنگ پنجم"
];

class NestSelector extends StatefulWidget {
  NestSelector(
      {Key key,
      this.clickParent,
      this.clickChild,
      this.clickDirection,
      this.mainColor = Colors.white})
      : super(key: key);
  final ValueChanged<int> clickParent;
  final ValueChanged<int> clickChild;
  final ValueChanged<Axis> clickDirection;
  final Color mainColor;

  @override
  _NestState createState() => _NestState();
}

class _NestState extends State<NestSelector> {
  void _clickParent(pos) {
    widget.clickParent(pos + 1);
  }

  void _clickChild(pos) {
    widget.clickChild(pos + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ViewSelector(
                title: _CHILD_TITLE,
                values: _CHILD_VALUES,
                mainColor: widget.mainColor,
                onClick: _clickChild,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
