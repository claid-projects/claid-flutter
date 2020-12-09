
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SquareButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Icon icon;
  final Color color1;
  final double opacity;
  final double offsetDX;
  final double offsetDY;
  SquareButton({
    @required this.onPressed,
    @required this.label,
    @required this.icon,
    @required this.color1,
    @required this.opacity,
    @required this.offsetDX,
    @required this.offsetDY,
  }):
        assert(label != null),
        assert(icon != null),
        assert(color1 != null),
        assert(opacity != null),
        assert(offsetDX != null),
        assert(offsetDY != null)
  ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 60.0,
          height: 60.0,
          child:Container(
            decoration: new BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black26.withOpacity(opacity),
                  offset: Offset(offsetDX, offsetDY),
                  spreadRadius: 1,
                  blurRadius: 30.0,

                ),]),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(20.0),
              onPressed: onPressed,
              color: Color(0xFFFFFFFF),
              child: Icon(icon.icon,color:color1, size: 26.0,),
            ),
          )
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          width: 60.0,
          height: 20.0,
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black,fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }


}
