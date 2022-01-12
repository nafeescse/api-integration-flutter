import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQuerData = new MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;
  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;

  void init(BuildContext context) {
    _mediaQuerData = MediaQuery.of(context);
    screenWidth = _mediaQuerData.size.width;
    screenHeight = _mediaQuerData.size.height;
    print(screenHeight.toString() + "&" + screenWidth.toString());
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal = _mediaQuerData.padding.left + _mediaQuerData.padding.right;
    _safeAreaVertical = _mediaQuerData.padding.top + _mediaQuerData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

  }

}