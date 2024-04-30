import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_the_number/app/widgets/text/subtitle.widget.dart';
import 'package:guess_the_number/app/widgets/text/title.widget.dart';

class MsgUtils{

  static Future<bool?> info(BuildContext context, {required Widget child, String? title}) async {
    final result = await Get.dialog(
        AlertDialog(
      title: title==null?null:CustomTitle(title:title),
          content: child,
          actions: [
            TextButton(
            onPressed: () {
              Get.back();
            }, child: const CustomSubtitle(title: 'Cerrar')
          )]
    ),transitionCurve: Curves.ease);
    return result;
  }

}