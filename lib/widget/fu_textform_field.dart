import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/app_color.dart';

class FUTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final int? minLines;
  final bool useHint;
  final int? maxLength;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool readOnly;
  final bool filled;
  final bool expands;
  final bool autoFocus;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputDecoration? inputDecoration;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;

  const FUTextFormField({Key? key, this.controller,
    this.textInputAction, this.textInputType, this.label, this.maxLines = 1,
    this.minLines, this.useHint = false, this.maxLength, this.onChanged,
    this.validator, this.inputFormatters, this.obscureText = false, this.suffixIcon,
    this.readOnly = false, this.onTap, this.filled = true, this.fillColor,
    this.prefixIcon, this.onFieldSubmitted, this.inputDecoration,
    this.expands = false, this.autoFocus = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: readOnly ? AppColor.disabledColor : AppColor.textColor),
      expands: expands,
      autofocus: autoFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: inputDecoration??InputDecoration(
        hintText: useHint? label : null,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.disabledColor),
        labelText: useHint? null : label,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.disabledColor),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor??Theme.of(context).cardColor,
        filled: filled,
        counterText: ''
      ),
      maxLines: maxLines,
      maxLength: maxLength,
      minLines: minLines,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      cursorColor: AppColor.textColor,
      onFieldSubmitted: onFieldSubmitted,
      enabled: !readOnly,
    );
  }
}
