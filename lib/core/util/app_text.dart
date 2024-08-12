import 'package:check_list_app/core/util/app_ext.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/app_const.dart';

var textTheme = Theme.of(Get.context!).textTheme;

TextStyle? textDisplayLarge(
        {Color? color, FontWeight? fontWeight, double? fontSize}) =>
    textTheme.displayLarge!.copyWith(
        color: color,
        fontWeight: fontWeight ?? FontWeight.w200,
        fontSize: fontSize ?? 30.0.d);

TextStyle? textDisplayMedium({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
}) =>
    textTheme.displayMedium!.copyWith(
        color: color,
        fontWeight: fontWeight ?? FontWeight.w200,
        fontSize: fontSize ?? 20.0.d);

TextStyle? textDisplaySmall({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
}) =>
    textTheme.displaySmall!.copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize ?? 16.0.d,
    );

TextStyle? textDisplaySuperSmall(
        {Color? color, FontWeight? fontWeight, double? fontSize}) =>
    textTheme.displaySmall!.copyWith(
        color: color, fontWeight: fontWeight, fontSize: fontSize ?? 12.0.d);
