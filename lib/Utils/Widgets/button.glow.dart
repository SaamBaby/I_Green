import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';


class GlowButton extends StatelessWidget {
  final String imgUrl;

  const GlowButton({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: Duration(milliseconds: 1000),
      glowColor: Colors.lightGreen,
      endRadius: 50.0,
      duration: Duration(milliseconds: 1000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 10),
      child: MaterialButton(
        onPressed: () {
          print("GO");

        },
        elevation: 20.0,
        shape: CircleBorder(),
        child: Container(
          width: 50.0,
          height: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(160.0)),
          child: Image.asset(imgUrl, width: MediaQuery.of(context).size.width*.1, height: MediaQuery.of(context).size.height*.1,),
        ),
      ),
    );
  }
}