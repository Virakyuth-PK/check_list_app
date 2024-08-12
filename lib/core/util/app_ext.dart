import 'dart:math';
import 'package:check_list_app/core/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

extension ScreenUtil on double {
  double get d {
    var deviceHeight = Get.height;
    var deviceWidth = Get.width;
    var deviceDiagonal = sqrt(pow(deviceHeight, 2) + pow(deviceWidth, 2));
    return deviceDiagonal * (this / 1000);
  }
}

extension DateTimeExtension on DateTime? {
  DateTime? setTimeOfDay(TimeOfDay time) {
    if (this == null) return null;
    return DateTime(this!.year, this!.month, this!.day, time.hour, time.minute);
  }

  DateTime? setTime(
      {int hours = 0,
      int minutes = 0,
      int seconds = 0,
      int milliSeconds = 0,
      int microSeconds = 0}) {
    if (this == null) return null;
    return DateTime(this!.year, this!.month, this!.day, hours, minutes, seconds,
        milliSeconds, microSeconds);
  }

  DateTime? clearTime() {
    if (this == null) return null;
    return DateTime(this!.year, this!.month, this!.day, 0, 0, 0, 0, 0);
  }

  String get formatToString {
    return DateFormat("dd, MMMM, yyyy").format(this!);
  }

  String get formatDayToString {
    var locale =
        Get.locale?.languageCode == AppConst.englishCode ? "en_US" : "km";
    return DateFormat.MMMMEEEEd(locale).format(this!);
  }

  String get formatTimeToString {
    return DateFormat("d, MMMM, yyyy ' | ' h:mm a").format(this!);
  }
}
