import 'package:Quete/Utils/Widgets/button.glow.dart';
import 'package:flutter/material.dart';

class NotConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .4,
            ),
            glowButton(imgUrl: 'assets/images/introduction/Logo.png'),
            Text(
              "Can't connect to Greenline",
              style: new TextStyle(
                  fontFamily: 'Futura Heavy',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please check your internet connection.",
              style: new TextStyle(
                  fontFamily: 'Futura Book',
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 16),
            ),
          ]),
        ),
      ),
    );
  }
}
