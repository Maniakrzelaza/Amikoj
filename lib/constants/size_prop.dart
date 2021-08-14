import 'package:flutter/cupertino.dart';

class SizeProp {
  static double _width;
  static double _height;
  static double _widthUnit;
  static double _heightUnit;

  static init(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _widthUnit = _width / 1000;
    _heightUnit = _height / 1000;
    print("wwwwwwwwwwww");
    print(_width);
    print(_height);
    print(_widthUnit);
    print(_heightUnit);
  }

  static int getWidthUnit(int width) {
    return (_widthUnit * width).toInt();
  }

  static int getHeightUnit(int height) {
    return (_heightUnit * height).toInt();
  }
}
