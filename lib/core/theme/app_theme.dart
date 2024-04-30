import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,//dark grey
  scaffoldBackgroundColor: Colors.white10,
  appBarTheme: const AppBarTheme(color: Colors.white12,elevation: 20,centerTitle: true),


  textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w200),
  bodySmall: TextStyle(color: Colors.grey.shade200,fontSize: 16),
      titleSmall: TextStyle(color: Colors.grey.shade200,fontSize: 18,fontWeight: FontWeight.w300)

  ),
  sliderTheme:  SliderThemeData(
    inactiveTickMarkColor: Colors.transparent,
    inactiveTrackColor: Colors.blueAccent.withOpacity(0.3),
  )

);