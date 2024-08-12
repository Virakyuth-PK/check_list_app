import 'package:check_list_app/src/data/local/todo_local.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoLocal());
    Get.lazyPut(() => HomeLogic());
  }
}
