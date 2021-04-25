import 'package:flutter/material.dart';


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
  return (inputWidth / 375.0) * screenWidth;

}