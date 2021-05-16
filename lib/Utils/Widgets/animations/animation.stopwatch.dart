import 'dart:math';
import 'package:flutter/material.dart';

class StopWatchAnimation extends CustomPainter{
  final Animation<double> animation;
  final Color color;
  StopWatchAnimation({
    this.color,
    this.animation,
}):super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
   Paint paint =Paint()
     ..color= Colors.white
     ..strokeCap=StrokeCap.round
     ..strokeWidth=5.0
     ..style=PaintingStyle.stroke;


   canvas.drawCircle(size.center(Offset.zero), size.width/2, paint);

   // setting the color of the animation circle
   paint.color=color;
    // this will convert the progress into radians
   double progress= (1.0-animation.value)*2* pi;

   // Offset.zero& size : this will form a rectangle
   canvas.drawArc(Offset.zero& size, pi*1.5, -progress, false, paint);


  }

  @override
  bool shouldRepaint( StopWatchAnimation old) {
    return animation.value!= old.animation.value||color!=old.color;
  }
}