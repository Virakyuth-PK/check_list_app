import 'package:check_list_app/src/model/todo_model/todo_list_model.dart';
import 'package:check_list_app/src/model/todo_model/todo_model.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager extends GetxService {
  HiveManager();

  static Future<void> init() async {
    // Initialize Hive for the Flutter app
    await Hive.initFlutter();

    // Register adapters for different data models
    Hive.registerAdapter(TodoModelImplAdapter());
  }
}
