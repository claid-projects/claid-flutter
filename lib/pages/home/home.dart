import 'package:flutter/material.dart';

import '../main/main_const.dart';

final List<MaterialColor> _parentColors = [
  Colors.deepOrange,
  Colors.green,
  Colors.brown,
  Colors.indigo,
  Colors.purple,
];

class Home extends StatefulWidget {
  Home({Key key, this.onClick}) : super(key: key);
  final VoidCallback onClick;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var parentCount = 2;
  var childCount = 10;
  var _direction = Axis.vertical;

  Widget _buildParent() {
    var _height = 100.0;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          constraints: _direction == Axis.vertical
              ? BoxConstraints.tightForFinite(height: _height)
              : BoxConstraints.tightForFinite(width: _height),
          alignment: AlignmentDirectional.centerStart,
          child: _buildChild(index, _height),
        );
      },
      itemCount: parentCount,
      scrollDirection: _direction,
    );
  }

  Widget _buildChild(parentIndex, height) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var i = index % 5 + 4;
        i *= 100;
        return SizedBox(
          width: height,
          height: height,
          child: Container(
            color: _parentColors[parentIndex % 5][i],
            margin: EdgeInsets.all(1.0),
            alignment: AlignmentDirectional.center,
            child: Text(
              "$index",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
      itemCount: childCount,
      scrollDirection:
          _direction == Axis.vertical ? Axis.horizontal : Axis.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopAppBar(
      //   itemType: ItemType.home,
      //   onClick: widget.onClick,
      //   bottomView: PreferredSize(
      //     // child: NestSelector(
      //     //   mainColor: Colors.white,
      //     //   clickChild: (count) {
      //     //     setState(() {
      //     //       childCount = count;
      //     //     });
      //     //   },
      //     //   clickParent: (count) {
      //     //     setState(() {
      //     //       parentCount = count;
      //     //     });
      //     //   },
      //     //   clickDirection: (direction) {
      //     //     setState(() {
      //     //       _direction = direction;
      //     //     });
      //     //   },
      //     // ),
      //     preferredSize: Size(0.0, 150.0),
      //   ),
      // ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: _buildParent(),
      ),
    );
  }
}
