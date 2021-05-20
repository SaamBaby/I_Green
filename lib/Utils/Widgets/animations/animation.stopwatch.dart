import 'dart:math';
import 'package:flutter/material.dart';



class  ProgressDial  extends CustomPainter {
  final strokeCircle= 20.0;
  final  double currentProgress;
  ProgressDial(this.currentProgress);
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle =Paint()
      ..strokeWidth=strokeCircle
      ..color=Color(0xFF000000).withOpacity(.1)
      ..style=PaintingStyle.stroke;
    Offset center=Offset(size.width/2, size.height/2);
    double radius=size.width/3;
    canvas.drawCircle(center, radius, circle);

    Paint progressCircle= Paint()
      ..strokeWidth= strokeCircle
      ..color=Colors.black
      ..style=PaintingStyle.stroke
      ..strokeCap=StrokeCap.round;

    double angle=2*pi*(currentProgress/100);
    canvas.drawArc(Rect.fromCircle(center: center,radius: radius),1.5* pi, angle,
        false,progressCircle);
  }// arcCircle animation


  @override

  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;

  }
}


class  StopWatchDial extends CustomPainter {
  final hourTickMarkLength = 10.0;
  final quarterTickMarkLength = 20.0;
  final minuteTickMarkLength = 10.0;

  final hourTickMarkWidth = 2.0;
  final quarterTickMarkWidth = 3.0;
  final minuteTickMarkWidth = .5;

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  StopWatchDial()
      : tickPaint = new Paint(),
        textPainter = new TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle = TextStyle(
          color: Color.fromRGBO(52, 43, 37, 1),
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ) {
    tickPaint.color = Colors.blueGrey;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength;
    final angle = 2 * pi / 60;
    final radius = size.width / 2;
    canvas.save();

    // drawing
    canvas.translate(radius, radius);
    for (var i = 0; i < 60; i++) {
      if (i % 15 == 0) {
        canvas.save();
        canvas.translate(0.0, -radius - 20.0);

        textPainter.text = new TextSpan(
          text: '$i',
          style: textStyle,
        );
        //helps make the text painted vertically
        canvas.rotate(-angle * i);

        textPainter.layout();

        textPainter.paint(canvas,
            new Offset(-(textPainter.width / 2), -(textPainter.height / 2)));

        canvas.restore();
      }
      if (i % 5 == 0 && i % 15 != 0) {
        canvas.save();
        canvas.translate(0.0, -radius - 20.0);

        textPainter.text = new TextSpan(
          text: '${i == 0 ? 12 : i}',
          style: TextStyle(
            fontSize: 8,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        );
        //helps make the text painted vertically
        canvas.rotate(-angle * i);

        textPainter.layout();

        textPainter.paint(canvas, new Offset(-(textPainter.width / 2), -(textPainter.height / 2)));

        canvas.restore();
      }
      //make the length and stroke of the tick marker longer and thicker depending
      tickMarkLength = i % 15 == 0
          ? quarterTickMarkLength
          : i % 5 == 0
          ? hourTickMarkLength
          : minuteTickMarkLength;
      tickPaint.strokeWidth = i % 15 == 0
          ? quarterTickMarkWidth
          : i % 5 == 0
          ? hourTickMarkWidth
          : minuteTickMarkWidth;
      // tickPaint.color=Color(0xFF54E597);
      tickPaint.color = Colors.black;
      canvas.drawLine(new Offset(0.0, -radius), new Offset(0.0, -radius + tickMarkLength), tickPaint);

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