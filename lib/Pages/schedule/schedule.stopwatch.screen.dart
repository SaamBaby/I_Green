import 'package:Quete/Utils/Widgets/animations/animation.stopwatch.dart';
import 'package:Quete/Utils/Widgets/stopwatch.dart';
import 'package:flutter/material.dart';


class ScheduleStopWatch extends StatefulWidget {
  @override
  _ScheduleStopWatchState createState() => _ScheduleStopWatchState();
}

class _ScheduleStopWatchState extends State<ScheduleStopWatch> with SingleTickerProviderStateMixin {

  bool isPressed = false;
  AnimationController _stopWatchController;
  Animation<double> _stopWatchAnimation;
  Stopwatch _stopwatch;

  @override
  void initState() {
    _stopwatch=Stopwatch();
    super.initState();
    _stopWatchController =
        AnimationController(vsync: this, duration: Duration(seconds: 60));
    _stopWatchAnimation = Tween<double>(begin: 0.0, end: 100.0).animate
      (_stopWatchController)..addListener(() {
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    // for the send to background [art
    //_androidAppRetain.invokeMethod("sendToBackground");
    return WillPopScope(
      onWillPop: () async {
        if(isPressed){
          print("Dont  pop");
          return false;
        }else
          print("pop");
        return true;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: StopWatchTimer(stopWatch: _stopwatch,)),
            Container(
              width: _size.width * .8,
              height: _size.width * .8,
              padding: const EdgeInsets.all(10.0),
              child: new CustomPaint(
                painter: StopWatchDial(),
              ),
            ),
            CustomPaint(
              foregroundPainter: ProgressDial( _stopWatchAnimation.value),
              child: Container(
                height: 100,
                width: 300,
              ),
            ),

            GestureDetector(
              onTap: onTap,
              child: Icon(
                isPressed?Icons.stop:Icons.play_arrow,
                color: Color(0xFF0000000),
                size: _size.width * .25,
              ),
            ),

          ],
        ),

      ),
    );
  }

  void onTap() {

    if(_stopWatchController.status==AnimationStatus.dismissed&&isPressed==false){
      _stopwatch.start();
      _stopWatchController.forward();
      _stopWatchController.repeat();
      setState(() {
        isPressed= !isPressed;
      });

    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actionsPadding: EdgeInsets.symmetric(vertical: 15,horizontal:20),
            title: Text( "Are your sure you want to end your shift? " ,),
            actions: <Widget>[

              FlatButton(
                onPressed:(){
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                ),
              ),
              RaisedButton(

                onPressed:(){
                  setState(() {
                    isPressed= !isPressed;
                  });
                  _stopWatchController.stop();
                  _stopWatchController.reset();
                  Navigator.pop(context);

                },
                color:Theme.of(context).primaryColor,
                child: Text(
                    "OK",
                    style: Theme.of(context).textTheme.button
                ),
              ),
            ],
          ));



    }

  }
}