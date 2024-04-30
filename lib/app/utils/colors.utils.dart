
import 'package:flutter/material.dart';

class ColorsUtils {
  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) { //dynamic converter colors
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
}