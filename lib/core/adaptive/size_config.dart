import 'package:flutter/material.dart';

double adaptive(BuildContext context, double value) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  if (screenWidth < 640.0) {
    return (value / 360.0) * screenWidth;
  } else if (screenWidth < 1000.0) {
    return (value / 720.0) * screenHeight;
  } else {
    return (value / 640.0) * screenHeight;
  }
}

double adaptiveW(BuildContext context, double value) {
  double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 640.0) {
    return value;
  } else if (screenWidth < 1000.0) {
    return value * 2.2;
  } else {
    return value * 2.5;
  }
}

SizedBox sizedBoxWidth(BuildContext context, double value) {
  return SizedBox(width: adaptive(context, value));
}

SizedBox sizedBoxHeight(BuildContext context, double value) {
  return SizedBox(height: adaptive(context, value));
}
