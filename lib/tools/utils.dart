import 'package:flutter/material.dart';


class Utils {

  static const _widgetAspectRatio = 1.5;

  static double _widgetHeight = 500;
  static double _widgetWidth = 375;

  static double get widgetWidth => _widgetWidth;
  static double get widgetHeight => _widgetHeight;

  static void setSize(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    if (width > height) {
      Utils._widgetHeight =  height;
      Utils._widgetWidth = height / _widgetAspectRatio;
    }
    else {
      Utils._widgetHeight = width * _widgetAspectRatio;
      Utils._widgetWidth = width;
    }
  }

  static double getHeight(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    if (width > height) {
      return height;
    }
    else {
      return width * _widgetAspectRatio;
    }
  }

  static double getWidth(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    if (width > height) {
      return height / _widgetAspectRatio;
    }
    else {
      return width;
    }
  }
}