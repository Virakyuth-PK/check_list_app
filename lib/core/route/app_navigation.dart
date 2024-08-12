import 'package:get/get.dart';

import '../../src/module/home/binding.dart';
import '../../src/module/home/view.dart';

class AppNavigation {
  AppNavigation._();

  static const HOME = "/home";

  static final pages = [
    GetPage(
      name: HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
