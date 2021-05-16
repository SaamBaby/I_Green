import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'dart:math';
import  'package:circular_countdown/circular_countdown.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animations/animation.stopwatch.dart';

class StopWatch extends StatefulWidget{

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> with TickerProviderStateMixin {
  AnimationController _controller;

  String get timerString{
    Duration _duration = _controller.duration*_controller.value;
    return '${(_duration.inHours).toString().padLeft(2,'0')}:${(_duration.inMinutes).toString().padLeft(2,'0')}:${(_duration.inSeconds).toString().padLeft(2,'0')}';
  }


  @override
  void initState() {
    super.initState();
    _controller=AnimationController(
      vsync: this,
      duration: Duration(seconds: 20)
    );
  }
  @override
  Widget build(BuildContext context) {

    var _size = MediaQuery.of(context).size;
    return new  AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        children: [
          Center(
            child: Container(
              width:_size.width*.8,
              height: _size.width*.8,
              padding: const EdgeInsets.all(10.0),
              child:new CustomPaint(
                painter: new ClockDialPainter(clockText: ClockText.values),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return CustomPaint(
                painter: StopWatchAnimation(
                  animation: _controller,
                  color: Colors.lightGreen,
                ),
              );
            },

          ),

           Center(
            child: Icon(Icons.play_arrow, color:Theme.of(context)
                .primaryColor ,size: _size.width*.25,)
          ),

        ],
      ),
    );
  }
}
class ClockDialPainter extends CustomPainter{
  final clockText;

  final hourTickMarkLength= 10.0;
  final quarterTickMarkLength= 20.0;
  final minuteTickMarkLength = 10.0;

  final hourTickMarkWidth= 2.0;
  final quarterTickMarkWidth= 3.0;
  final minuteTickMarkWidth = .5;

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  final romanNumeralList= [ 'XII','I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI'];

  ClockDialPainter({this.clockText= ClockText.roman})
      :tickPaint= new Paint(),
        textPainter= new TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle=  GoogleFonts.nunito(
          color: Color.fromRGBO(52, 43, 37, 1),
          fontSize: ScreenUtil().setSp(15),
          fontWeight: FontWeight.w900,
        )
  {
    tickPaint.color= Colors.blueGrey;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength;
    final angle= 2* pi/ 60;
    final radius= size.width/2;
    canvas.save();

    // drawing
    canvas.translate(radius, radius);
    for (var i = 0; i< 60; i++ ) {


      if (i%15==0){
        canvas.save();
        canvas.translate(0.0, -radius-20.0);

        textPainter.text= new TextSpan(
          text: '$i',
          style: textStyle,
        );
        //helps make the text painted vertically
        canvas.rotate(-angle*i);

        textPainter.layout();


        textPainter.paint(canvas, new Offset(-(textPainter.width/2), -(textPainter.height/2)));

        canvas.restore();

      }
      if (i%5==0&& i%15!=0){
        canvas.save();
        canvas.translate(0.0, -radius-20.0);

        textPainter.text= new TextSpan(
          text: '${i == 0 ? 12 : i}'
          ,
          style: GoogleFonts.varelaRound(
            fontSize: ScreenUtil().setSp(8),
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        );
        //helps make the text painted vertically
        canvas.rotate(-angle*i);

        textPainter.layout();


        textPainter.paint(canvas, new Offset(-(textPainter.width/2), -(textPainter.height/2)));

        canvas.restore();

      }
      //make the length and stroke of the tick marker longer and thicker depending
      tickMarkLength = i % 15 == 0 ? quarterTickMarkLength:i % 5 == 0 ? hourTickMarkLength:minuteTickMarkLength;
      tickPaint.strokeWidth= i % 15 == 0 ? quarterTickMarkWidth :i % 5 == 0 ? hourTickMarkWidth:minuteTickMarkWidth;
      tickPaint.color=Color(0xFF54E597);
      canvas.drawLine(new Offset(0.0, -radius), new Offset(0.0, -radius+tickMarkLength), tickPaint);


      //draw the text


      canvas.rotate(angle);
    }

    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

enum ClockText{
  roman,
  arabic
}