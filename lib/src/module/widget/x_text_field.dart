import 'package:check_list_app/core/const/app_color.dart';
import 'package:flutter/material.dart';

import 'text_field_decoration.dart';

class XTextField extends StatelessWidget {
  XTextField({
    super.key,
    this.initialValue,
    this.enable = true,
    required this.onChanged,
    this.keyboardType,
    this.textInputAction,
    required this.hintText,
    this.maxLines,
    this.suffixIcon,
    this.maxLength,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.textController,
  });

  factory XTextField.showOnly({
    required hintText,
    required suffixIcon,
  }) {
    return XTextField(
        initialValue: null,
        onChanged: null,
        hintText: hintText,
        enable: false,
        suffixIcon: suffixIcon);
  }

  final initialValue;
  final enable;
  final Function(String value)? onChanged;
  final Function(String value)? onFieldSubmitted;
  final hintText;
  final textInputAction;
  final keyboardType;
  final maxLines;
  final suffixIcon;
  final maxLength;
  final inputFormatters;
  final textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryColor,
      initialValue: initialValue,
      controller: textController,
      enabled: enable,
      onChanged: enable == false ? null : (value) => onChanged!(value),
      decoration:
          getTextFieldDecoration(hintText: hintText, suffixIcon: suffixIcon),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
