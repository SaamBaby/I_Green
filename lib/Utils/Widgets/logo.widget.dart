import 'package:flutter/material.dart';

class Logo {
  static Widget logo({double height = 30}) {
    return Container(
      child: Image.asset(
        'assets/images/logo.png',
        height: height,
      ),
    );
  }
}