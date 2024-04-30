import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecorationUtils {
  static InputDecoration outLine(
      {
        String? labelText,
        Color? labelColor,
        IconData? suffixIcon,
        Color? suffixIconColor = Colors.black,
        GestureTapCallback? onSuffixIconTap,
        bool? isReadlyOnly,
        Color? focusedBorderColor = Colors.black,
        Color? fillColor = Colors.white,
        IconData? prefixIcon,
        GestureTapCallback? onPrefixIconTap,
      }) {
    var themeDefault = Theme.of(Get.context!).colorScheme.outlineVariant;
    return InputDecoration(
      filled: true,
      fillColor: fillColor,
      suffixIcon: IconButton(icon: Icon(suffixIcon, color: suffixIconColor),onPressed: onSuffixIconTap),
      prefixIcon: prefixIcon != null
          ? IconButton(
          icon: Icon(
            prefixIcon,
            color: suffixIconColor,
          ),
          onPressed: onPrefixIconTap)
          : null,
      contentPadding: const EdgeInsets.all(15),
      labelStyle: Theme.of(Get.context!).textTheme.bodyMedium!.apply(
        fontWeightDelta: 0,
        color: labelColor,
      ),
      labelText: labelText,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[350]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        borderSide: BorderSide(
          color: isReadlyOnly ?? true
              ? Colors.grey[350]!
              : themeDefault.withOpacity(0.3),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: themeDefault),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: focusedBorderColor!),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(Get.context!)
                .inputDecorationTheme
                .errorBorder!
                .borderSide
                .color,
            width: 2.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(Get.context!)
                .inputDecorationTheme
                .errorBorder!
                .borderSide
                .color
                .withOpacity(0.2),
            width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}