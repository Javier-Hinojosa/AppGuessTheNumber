import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_the_number/app/utils/decoration.utils.dart';
import 'package:guess_the_number/app/widgets/text/title.widget.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final Widget child;
  final Color color;
  final IconData? icon;

  const CustomContainer({
    super.key,
    required this.child,
    required this.labelText,
    this.icon,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: DecorationUtils.outLineContainer(),
        height: Get.height*.4,
        child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CustomTitle(
                title: labelText,
                textAlign: TextAlign.center,
              ),
              child
            ]));
  }
}
