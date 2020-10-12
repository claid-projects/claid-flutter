///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import '../pages/main/main_const.dart';

const BAR_FONT_SIZE = 21.0;
const BAR_TITLE_COLOR = Colors.white;

class TopAppBar extends AppBar {
  TopAppBar(
      {ItemType itemType,
      PreferredSize bottomView,
      VoidCallback onClick,
      Widget right})
      : super(
            bottom: bottomView,
            backgroundColor: BAR_BACK_COLORS[1],
            elevation: 0.0,
            actions: right == null ? null : [right]);
}

class SliverBar extends SliverAppBar {
  SliverBar({
    ItemType itemType,
    PreferredSize bottomView,
    VoidCallback onClick,
  }) : super(
          pinned: true,
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.none,
          ),
          leading: IconButton(
            icon: Icon(
              BAR_ICONS[1],
              color: BAR_TITLE_COLOR,
            ),
            onPressed: onClick,
          ),
          bottom: bottomView,
          backgroundColor: BAR_BACK_COLORS[1],
        );
}

class MainAppBar extends AppBar {
  MainAppBar({
    Key key,
    this.titleText,
    this.titleColor = Colors.white,
    this.rightWidget,
    this.bottomWidget,
    this.bottomHeight = 0,
  }) : super(
            key: key,
            title: Text(
              titleText,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            bottom: bottomWidget == null
                ? null
                : PreferredSize(
                    child: bottomWidget,
                    preferredSize: Size(0.0, bottomHeight),
                  ),
            actions: rightWidget == null ? null : [rightWidget],
            elevation: 1.0);

  final String titleText;
  final Color titleColor;
  final Widget rightWidget;
  final Widget bottomWidget;
  final double bottomHeight;
}
