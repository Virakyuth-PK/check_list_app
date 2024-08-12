import 'package:check_list_app/src/model/todo_model/todo_model.dart';
import 'package:get/get.dart';

class HomeState {
  var todoList = <TodoModel>[];
  var statusTodo = StatusTodoEnum.All.obs;
  var modeTodo = ModeEnum.Empty;
  var isDesc = true.obs;
}

enum StatusTodoEnum {
  All,
  Open,
  Closed,
}

enum PriorityLevelEnum {
  Low,
  Medium,
  High,
}

enum ModeEnum {
  Empty,
  Create,
  Update,
}
