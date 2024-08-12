import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app/app.dart';
import 'core/app/service.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initServices();
  runApp(const App());
}
