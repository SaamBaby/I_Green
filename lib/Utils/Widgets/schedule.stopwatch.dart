import 'package:flutter/material.dart';

class StopWatch extends StatelessWidget{

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }

   var stopWatch;
  StopWatch({this.stopWatch});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        height: 60,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  formatTime(stopWatch.elapsedMilliseconds),
                  style: TextStyle(
                      fontFamily: 'Futura Heavy',
                      color: Colors.black,
                      fontSize: 45,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900),
                ),
              ),
            )
          ],
        ),
      );
    }
  }


