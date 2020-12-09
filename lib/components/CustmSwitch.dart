import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class CustmSwitch extends StatelessWidget {
  final List<String> itemSwitch ;
  final  Color selectItem;
  final Color unSelectItem;
  final Function onPressed;
  CustmSwitch({
    @required this.itemSwitch,
    @required this.selectItem,
    @required this.unSelectItem,
    @required this.onPressed, }):
        assert(itemSwitch != null),
        assert(selectItem != null),
        assert(unSelectItem != null),
        assert(onPressed != null);

int type;
  @override
  Widget build(BuildContext context) {
    return
      Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20,
                  activeBgColor: selectItem,
                  inactiveBgColor: unSelectItem,
                  labels: itemSwitch,
                  onToggle: (index) {

                      onPressed;

                  }),

            ),
          ),
      );
  }


}