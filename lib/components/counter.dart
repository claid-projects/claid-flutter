import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';



class TimeCounter extends StatefulWidget {
int secend;

TimeCounter(this.secend);

  @override
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  CountDownController _controller = CountDownController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height*0.08,

        child: Center(
            child: CircularCountDownTimer(
              // Countdown duration in Seconds
              duration: widget.secend,

              // Controller to control (i.e Pause, Resume, Restart) the Countdown
              controller: _controller,

              // Width of the Countdown Widget
              width: size.width / 5,

              // Height of the Countdown Widget
              height: size.height / 5,

              // Default Color for Countdown Timer
              color: Colors.grey,

              // Filling Color for Countdown Timer
              fillColor: Colors.lightGreen,

              // Background Color for Countdown Widget
              backgroundColor: null,

              // Border Thickness of the Countdown Circle
              strokeWidth: 4.0,

              // Text Style for Countdown Text
              textStyle: TextStyle(
                  fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold),

              // true for reverse countdown (max to 0), false for forward countdown (0 to max)
              isReverse: false,

              // true for reverse animation, false for forward animation
              isReverseAnimation: true,

              // Optional [bool] to hide the [Text] in this widget.
              isTimerTextShown: true,

              // Function which will execute when the Countdown Ends

            ),

    ),
      );
  }
}