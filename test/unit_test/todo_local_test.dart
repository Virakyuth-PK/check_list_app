import 'package:check_list_app/core/util/app_log.dart';
import 'package:check_list_app/src/data/local/todo_local.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:check_list_app/src/model/todo_model/todo_model.dart';

void main() {
  late TodoLocal todoLocal;

  setUp(() async {
    xLog(message: "setUp()");
    // Initialize Hive and open a test box
    await setUpTestHive();
    if (Hive.isAdapterRegistered(0) == false) {
      Hive.registerAdapter(TodoModelImplAdapter());
      xPrettyLog(message: "registerAdapter: TodoModelImplAdapter");
    }
    todoLocal = TodoLocal();
  });

  tearDown(() async {
    xLog(message: "tearDown()");
    await tearDownTestHive();
  });

  group('TodoLocal Tests', () {
    test('getBox should open the box if not opened', () async {
      xLog(message: "getBox should open the box if not opened");
      // Act
      var box = await todoLocal.getBox();

      // Assert
      expect(box.isOpen, true);
      xPrettyLog(message: "box.isOpen should be true: ${box.isOpen}");
    });

    test('getData should return an empty list if the box is empty', () async {
      xLog(message: "getData should return an empty list if the box is empty");
      // Act
      var result = await todoLocal.getData();

      // Assert
      expect(result, []);
      xPrettyLog(message: "result List is empty: ${result.length}");
    });

    test('getData should return data if the box contains items', () async {
      xLog(message: "getData should return data if the box contains items");
      // Arrange
      var todoModel = TodoModel(title: 'Test Todo');
      var box = await todoLocal.getBox();
      await box.add(todoModel);

      // Act
      var result = await todoLocal.getData();

      // Assert
      expect(result, isNotEmpty);
      expect(result.first.title, 'Test Todo');
      xPrettyLog(message: "result.first.title should be Test Todo: ${result.first.title}");
    });

    test('setData should add new item if it does not exist', () async {
      xLog(message: "setData should add new item if it does not exist");
      // Arrange
      var todoModel = TodoModel(title: 'New Todo');

      // Act
      var result = await todoLocal.setData(todoModel);

      // Assert
      var box = await todoLocal.getBox();
      expect(box.values.length, 1);
      expect(result?.title, 'New Todo');
      xPrettyLog(message: "result.title should be 'New Todo': ${result?.title}");
    });

    test('setData should update existing item if it exists', () async {
      xLog(message: "setData should update existing item if it exists");
      // Arrange
      var todoModel = TodoModel(title: 'Existing Todo');
      var box = await todoLocal.getBox();
      await box.add(todoModel);

      // Act
      var updatedTodo = TodoModel(title: 'Existing Todo', isCompleted: true);
      var result = await todoLocal.setData(updatedTodo);

      // Assert
      expect(box.values.length, 1);
      expect(result?.title, 'Existing Todo');
      xPrettyLog(message: "result.title should be 'Existing Todo': ${result?.title}");
      expect(result?.isCompleted, true);
      xPrettyLog(message: "result.title => 'Existing Todo' result.isCompleted should be true: ${result?.isCompleted}");
    });

    test('deleteData should remove item if it exists', () async {
      xLog(message: "deleteData should remove item if it exists");
      // Arrange
      var todoModel = TodoModel(title: 'To Delete');
      var box = await todoLocal.getBox();
      await box.add(todoModel);

      // Act
      var result = await todoLocal.deleteData(todoModel);

      // Assert
      expect(box.values.length, 0);
      xPrettyLog(message: "box.values.length should be 0: ${box.values.length}");
      expect(result, true);
      xPrettyLog(message: "after delete result should be true: $result");
    });

    test('removeData should clear the box', () async {
      xLog(message: "removeData should clear the box");
      // Arrange
      var todoModel = TodoModel(title: 'To Clear');
      var box = await todoLocal.getBox();
      await box.add(todoModel);

      // Act
      await todoLocal.removeData();

      // Assert
      expect(box.values.length, 0);
      xPrettyLog(message: "box.values.length should be 0: ${box.values.length}");
    });
  });
}
