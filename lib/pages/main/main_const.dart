///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import 'package:flutter/material.dart';

const BOTTOM_TITLES = ['خانه', 'گزارشات', 'برنامه کلاسی', 'تنظیمات'];
const BOTTOM_ICONS = [
  IconData(59322),
  IconData(58808),
  IconData(58915),
  IconData(59846),
];
const BAR_ICONS = [
  Icons.filter_1,
  Icons.filter_2,
];
const BAR_BACK_COLORS = [
  Colors.green,
  Colors.blueAccent,
];

enum ItemType {
  home,
  reports,
  programmingPlan,
  settings
}
const GRID_VIEW_NAME = "GridView";

ItemType convertItemType(index) {
  switch (index) {
    case 0:
      return ItemType.home;
    case 1:
      return ItemType.reports;
    case 2:
      return ItemType.programmingPlan;
    case 3:
      return ItemType.settings;
    default:
      return ItemType.home;
  }
}
