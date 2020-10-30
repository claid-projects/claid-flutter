
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SquareButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Color color1;
  SquareButton({
    @required this.label,
    @required this.icon,
    @required this.color1,
  })  : assert(label != null),
        assert(icon != null),
        assert(color1 != null)
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
                  color: Colors.black26.withOpacity(0.4),
                  offset: Offset(0, 3),
                  spreadRadius: 1,
                  blurRadius: 30.0,

                ),]),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(20.0),
              onPressed: () {},
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
