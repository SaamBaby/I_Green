import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print(_screenWidth);
  }
}

double getProportionateScreenSize(double inputWidth, var mediaQuery) {
  double defaultSize;
  double screenWidth = mediaQuery.size.width;
  if(screenWidth > 600){
    defaultSize =  750.0;
  }else {
    defaultSize =  375.0;
  }
  return ((screenWidth*inputWidth)/defaultSize);
  // 375 is the layout width that designer use


}
// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight,var  mediaQuery) {
  double screenHeight = mediaQuery.size.height;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth, var mediaQuery) {
  double screenWidth = mediaQuery.size.width;
  // 375 is the layout width that designer use
  print("  pro ${(inputWidth / 375.0) * screenWidth}" );
  return (inputWidth / 375.0) * screenWidth;

}
