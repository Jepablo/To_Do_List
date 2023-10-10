
import 'package:todolist/bloc/to_do_state.dart';

import '../model/to_do_model.dart';
import '../repos/to_do_repo.dart';

abstract class ToDoEvent {}

class ToDoInitialEvent extends ToDoEvent {
  // ToDoInitialEvent();
}

class ToDoSubmitEvent extends ToDoEvent{
  // final ToDoRepo toDoRepo;
  final String title,desc;
  ToDoSubmitEvent({required this.title,required this.desc});
  // final ToDoDataModel todoData;
  // ToDoSubmitEvent({required this.todoData});
}

class ToDoEditEvent extends ToDoEvent{
  final String title, desc,id;
  ToDoEditEvent({required this.title,required this.desc, required this.id});
}

class ToDoDeleteEvent extends ToDoEvent {
  final String id;
  ToDoDeleteEvent({required this.id});
}
class ToDoNavigateEvent extends ToDoEvent {}

class ToDoNavigateHomeEvent extends ToDoEvent{}


