import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

// ignore: must_be_immutable
class StopWatchTimer extends StatelessWidget{
  String formatSecond(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return seconds;
  }
  String formatMinute(int milliseconds) {
    var secs = milliseconds ~/ 1000;

    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    return minutes;
  }
  String formatHour(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    return hours;
  }

  var stopWatch;
  StopWatchTimer({this.stopWatch});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 80,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1, color: Colors.black.withOpacity(.1)),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    formatHour(stopWatch.elapsedMilliseconds),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Heavy",
                      letterSpacing: .8,
                      fontSize: ScreenUtil().setSp(26),
                      color: Colors.black,
                      height: 1.3,
                    )
                  ),
                ),
              ),
              Text(
                ":",
                style:
                TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFF54E597),
                    fontSize: 30, fontWeight: FontWeight.w900),

              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                    color: Color(0xFF54E597),
                    border: Border.all(
                        width: 1, color: Color(0xFF54E597)),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    formatMinute(stopWatch.elapsedMilliseconds),
                    style:
                    TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Heavy",
                      letterSpacing: .8,
                      fontSize: ScreenUtil().setSp(26),
                      color: Colors.white,
                      height: 1.3,
                    )

                  ),
                ),
              ),
              Text(
                ":",
                style:
                TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFF54E597),
                    fontSize: 30, fontWeight: FontWeight.w900),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1, color: Colors.black.withOpacity(.1)),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    formatSecond(stopWatch.elapsedMilliseconds),
                    style:TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Heavy",
                      letterSpacing: .8,
                      fontSize: ScreenUtil().setSp(26),
                      color: Colors.black,
                      height: 1.3,
                    )
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
