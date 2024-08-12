import 'package:check_list_app/core/const/app_const.dart';
import 'package:check_list_app/core/translate/app_translation.dart';
import 'package:check_list_app/core/util/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../const/app_color.dart';
import '../route/app_navigation.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        getPages: AppNavigation.pages,
        initialRoute: AppNavigation.HOME,
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500),
        popGesture: Get.isPopGestureEnable,
        translations: AppTranslation(),
        locale: Locale(AppConst.englishCode),
        theme: ThemeData(
            brightness: Brightness.light,
            colorSchemeSeed: primaryColor,
            useMaterial3: true,
          fontFamily: Get.locale == Locale(AppConst.khmerCode)
              ? AppConst.khmerFont
              : AppConst.englishFont,
        ),
      ),
    );
  }
}
