import 'package:Quete/Utils/Widgets/stopwatch.dart';
import 'package:flutter/material.dart';


class ScheduleStopWatch extends StatefulWidget {
  @override
  _ScheduleStopWatchState createState() => _ScheduleStopWatchState();
}

class _ScheduleStopWatchState extends State<ScheduleStopWatch> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            StopWatch()

          ],
        ),
      ),
    );
  }
}
