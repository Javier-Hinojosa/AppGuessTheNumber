import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecorationUtils {
  static InputDecoration outLine(
      {
        String? labelText,
        Color? labelColor,
        IconData? suffixIcon,
        GestureTapCallback? onSuffixIconTap,
        IconData? prefixIcon,
        GestureTapCallback? onPrefixIconTap,
      }) {

    return InputDecoration(
      labelText: labelText,
      focusColor: Colors.blueAccent,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color:Colors.white12
        )
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
              color:Colors.blueAccent
          )
      ),
    );
  }

  static BoxDecoration outLineContainer(
      {
        String? labelText,
        Color? labelColor,
        IconData? suffixIcon,
        GestureTapCallback? onSuffixIconTap,
        IconData? prefixIcon,
        GestureTapCallback? onPrefixIconTap,
      }) {

    return BoxDecoration(
      border: Border.all(color: Colors.white60),
        borderRadius: BorderRadius.circular(7),
    );
  }
}