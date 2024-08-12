import 'package:check_list_app/core/util/app_log.dart';
import 'package:check_list_app/src/model/todo_model/todo_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class TodoLocal {
  Future<Box<TodoModel>> getBox() async {
    if (!Hive.isBoxOpen(todoHiveBox)) {
      return await Hive.openBox<TodoModel>(todoHiveBox);
    }
    return Hive.box<TodoModel>(todoHiveBox);
  }

  Future<List<TodoModel>> getData() async {
    try {
      Box box = await getBox();
      if (box.isOpen == false) {
            return [];
          }
      List<TodoModel> data = box.values.toList().cast<TodoModel>();
      return data;
    } catch (e) {
      xPrettyLog(message: "getData() : $e");
      return [];
    }
  }

  Future<TodoModel?> setData(TodoModel data) async {
    try {
      Box box = await getBox();
      if (box.isOpen == false) {
        return null;
      }
      List<TodoModel> dataLocal = await getData();
      var existedItem =
          dataLocal.firstWhereOrNull((element) => element.createdDate == data.createdDate);
      if (existedItem == null) {
        await box.add(data);
      } else {
        var index =
            dataLocal.indexWhere((element) => element.createdDate == data.createdDate);
        await box.putAt(index, data);
      }
      var resultLocal = await getData();
      return resultLocal.firstWhereOrNull(
        (element) => element.createdDate == data.createdDate,
      );
    } catch (e) {
      xPrettyLog(message: "setData() : $e");
      return null;
    }
  }

  Future<bool> deleteData(TodoModel data) async {
    try {
      Box box = await getBox();
      if (box.isOpen == false) {
        return false;
      }
      List<TodoModel> dataLocal = await getData();
      var existedItem =
          dataLocal.firstWhereOrNull((element) => element.createdDate == data.createdDate);
      if (existedItem != null) {
        var index =
            dataLocal.indexWhere((element) => element.createdDate == data.createdDate);
        await box.deleteAt(index);
      }
      return true;
    } catch (e) {
      xPrettyLog(message: "deleteData() : $e");
      return false;
    }
  }

  Future<void> removeData() async {
    Box box = await getBox();
    if (box.isOpen == false) {
      return;
    }
    await box.clear();
  }
}
