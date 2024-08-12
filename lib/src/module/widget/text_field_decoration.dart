import 'package:check_list_app/core/const/app_color.dart';
import 'package:check_list_app/core/util/app_ext.dart';
import 'package:flutter/material.dart';
import '../../../core/util/app_text.dart';
import 'decorated_input_border.dart';

InputDecoration getTextFieldDecoration({
  String? hintText,
  String? errorMessage,
  TextStyle? hintStyle,
  TextStyle? errorStyle,
  EdgeInsets? contentPadding,
  Widget? suffixIcon,
  VoidCallback? onSuffixIconPress,
  Color? fillColor,
  Color? borderColor,
  BorderRadius? borderRadius,
  bool hasShadow = true,
  bool isShowCounter = false,
  int? maxLength,
}) {
  return InputDecoration(
    errorText: errorMessage,
    errorStyle: errorStyle ?? textDisplaySmall(color: Colors.red),
    filled: true,
    fillColor: fillColor ?? Colors.white,
    disabledBorder: getBorder(Colors.transparent,
        hasShadow: hasShadow, borderRadius: borderRadius),
    focusedBorder: getBorder(primaryColor,
        hasShadow: hasShadow, borderRadius: borderRadius),
    border: getBorder(Colors.transparent,
        hasShadow: hasShadow, borderRadius: borderRadius),
    enabledBorder: getBorder(borderColor ?? Colors.transparent,
        hasShadow: hasShadow, borderRadius: borderRadius),
    focusedErrorBorder:
        getBorder(Colors.red, hasShadow: hasShadow, borderRadius: borderRadius),
    errorBorder:
        getBorder(Colors.red, hasShadow: hasShadow, borderRadius: borderRadius),
    hintText: hintText,
    counter: isShowCounter && maxLength != null ? null : const SizedBox(),
    contentPadding: contentPadding ??
        EdgeInsets.symmetric(vertical: 10..d, horizontal: 15..d),
    hintStyle: hintStyle ?? textDisplaySmall(color: Colors.grey),
    suffixIcon: suffixIcon == null
        ? null
        : ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onSuffixIconPress,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: suffixIcon,
                ),
              ),
            ),
          ),
  );
}

InputBorder getBorder(Color color,
    {bool hasShadow = true, BorderRadius? borderRadius}) {
  final border = OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(10.0.d),
      borderSide: BorderSide(color: color));
  if (!hasShadow) {
    return border;
  }
  return DecoratedInputBorder(
      child: border,
      shadow: const BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 2),
          blurRadius: 5));
}
