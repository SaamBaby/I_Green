import 'package:Quete/Utils/Widgets/animations/animation.stopwatch.dart';
import 'package:Quete/Utils/Widgets/stopwatch.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleStopWatch extends StatefulWidget {
  final String activityId;

  const ScheduleStopWatch({Key key, this.activityId}) : super(key: key);

  @override
  _ScheduleStopWatchState createState() => _ScheduleStopWatchState();
}

class _ScheduleStopWatchState extends State<ScheduleStopWatch>
    with SingleTickerProviderStateMixin {
  bool isPressed = false;
  String startTime;
  AnimationController _stopWatchController;
  Animation<double> _stopWatchAnimation;
  Stopwatch _stopwatch;
  var _activityService=ActivityService();
  @override
  void initState() {

    _stopwatch = Stopwatch();
    super.initState();
    _stopWatchController =
        AnimationController(vsync: this, duration: Duration(seconds: 60));
    _stopWatchAnimation =
        Tween<double>(begin: 0.0, end: 100.0).animate(_stopWatchController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    // for the send to background [art
    //_androidAppRetain.invokeMethod("sendToBackground");
    return WillPopScope(
      onWillPop: () async {
        if (isPressed) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actionsPadding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 20),

                title: Text(
                  "Do you want to end the Shift? ",

                  style:  TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: .8,
                      fontSize: ScreenUtil().setSp(13),
                      color: Colors.black.withOpacity(.8),
                      height: 1.3,
                     ),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Futura Book",
                        letterSpacing: .8,
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.black.withOpacity(.4),
                        height: 1.3,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                      _stopWatchController.stop();
                      _stopWatchController.reset();
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).primaryColor,
                    child:
                    Text("OK", style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: .8,
                      fontSize: ScreenUtil().setSp(13),
                      color: Colors.white,
                      height: 1.3,
                    )),
                  ),
                ],
              ));
          return false;
        } else

        return true;
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(70),
            horizontal: ScreenUtil().setWidth(20)),
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text("Stop Watch",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Futura Heavy",
                        letterSpacing: .8,
                        fontSize: ScreenUtil().setSp(16),
                        color: Colors.black.withOpacity(.8),
                        height: 1.3,
                      )),
                  Spacer(),
                  Container(
                    child: FaIcon(FontAwesomeIcons.user,
                        color: Colors.white, size: 18),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: StopWatchTimer(
                  stopWatch: _stopwatch,
                )),
            Container(
              width: _size.width * .8,
              height: _size.width * .8,
              padding: const EdgeInsets.all(10.0),
              child: new CustomPaint(
                painter: StopWatchDial(),
              ),
            ),
            CustomPaint(
              foregroundPainter: ProgressDial(_stopWatchAnimation.value),
              child: Container(
                height: 100,
                width: 300,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                isPressed ? Icons.stop : Icons.play_arrow,
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
    if (_stopWatchController.status == AnimationStatus.dismissed && isPressed == false) {

     startTime= DateTime.now()
         .toString();
      _activityService.updateActivity(widget.activityId,startTime, "",_stopwatch.elapsed
          .inSeconds, false).then((value) {
            if(!value){
              _stopwatch.start();
              _stopWatchController.forward();
              _stopWatchController.repeat();
              setState(() {
                isPressed = !isPressed;
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
              Text('You successfully started the shift',style: GoogleFonts
                  .varelaRound(
                fontSize: ScreenUtil().setSp(13),
                color: Colors.black.withOpacity(.8),
                height: 1.3,
                fontWeight: FontWeight.w700,
              ),)));
            }else{
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actionsPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),

                    title: Text(
                      "There was an error in using this service. Please "
                          "contact your shift in charge",
                      style: GoogleFonts.varelaRound(
                        fontSize: ScreenUtil().setSp(13),
                        color: Colors.black.withOpacity(.8),
                        height: 1.3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    actions: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        color: Theme.of(context).primaryColor,
                        child:
                        Text("OK", style: Theme.of(context).textTheme.button),
                      ),
                    ],
                  ));
            }
      });

    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actionsPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),

                title: Text(
                  "Do you want to end the Shift? ",
                  style: GoogleFonts.varelaRound(
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black.withOpacity(.8),
                    height: 1.3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activityService.updateActivity(widget.activityId, startTime,
                          DateTime.now().toString(),_stopwatch.elapsed
                          .inSeconds, true).then((value) {
                        if (!value) {

                          setState(() {
                            isPressed = !isPressed;
                          });
                          _stopwatch.stop();
                          _stopwatch.reset();
                          print( _stopwatch.elapsed.inSeconds);
                          _stopWatchController.stop();
                          _stopWatchController.reset();
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertDialog(
                                    actionsPadding:
                                    EdgeInsets.symmetric(vertical: 15,
                                        horizontal: 20),

                                    title:Text('You successfully completed your shift',
                                      style: GoogleFonts
                                          .varelaRound(
                                        fontSize: ScreenUtil().setSp(13),
                                        color: Colors.black.withOpacity(.8),
                                        height: 1.3,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                    actions: <Widget>[
                                      RaisedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Theme
                                            .of(context)
                                            .primaryColor,
                                        child:
                                        Text("OK", style: Theme
                                            .of(context)
                                            .textTheme
                                            .button),
                                      ),
                                    ],
                                  ));

                        }
                        else {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertDialog(
                                    actionsPadding:
                                    EdgeInsets.symmetric(vertical: 15,
                                        horizontal: 20),

                                    title: Text(
                                      "There was an error in completing this "
                                          "shift. Please "
                                          "check your internet connection ",
                                      style: GoogleFonts.varelaRound(
                                        fontSize: ScreenUtil().setSp(13),
                                        color: Colors.black.withOpacity(.8),
                                        height: 1.3,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      RaisedButton(
                                        onPressed: () {
                                           Navigator.pop(context);
                                        },
                                        color: Theme
                                            .of(context)
                                            .primaryColor,
                                        child:
                                        Text("OK", style: Theme
                                            .of(context)
                                            .textTheme
                                            .button),
                                      ),
                                    ],
                                  ));

                        }
                      });

                    },
                    color: Theme.of(context).primaryColor,
                    child:
                        Text("OK", style: Theme.of(context).textTheme.button),
                  ),
                ],
              ));
    }
  }
}
