import 'package:flutter/material.dart';
import 'package:guess_the_number/app/utils/decoration.utils.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController editingController;
  final int? maxLines;
  final TextInputType? textInputType;
  final Widget? trailing;
  final String? errorText;
  final int? maxCharts;
  final Color? backgroundColor;
  final Color? labelTextColor;
  final Color? borderSideColor;
  final String? hintText;
  final double? borderRadius;
  final GestureTapCallback? onComplete;

  const CustomTextField(this.labelText, this.editingController,
  {super.key,
  this.maxLines,
  this.textInputType,
  this.trailing,
    this.errorText,
        this.maxCharts,
        this.labelTextColor,
        this.backgroundColor,
    this.hintText,
        this.borderSideColor,
        this.borderRadius,
        this.onComplete});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      maxLength: maxCharts,
      onEditingComplete: onComplete,
      enableIMEPersonalizedLearning: false,
      enableSuggestions: false,
      buildCounter: (context,{required currentLength, required isFocused, maxLength}) =>null, //delete text Counter
      controller: editingController,
      keyboardType: textInputType,
      decoration: DecorationUtils.outLine(labelText: labelText,errorText:errorText, hintText:hintText ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}