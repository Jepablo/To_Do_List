import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/to_do_model.dart';

abstract class ToDoState {}

abstract class ToDoActionHomeState extends ToDoState{}

class ToDoInitial extends ToDoState {}

class ToDoLoadingState extends ToDoState{}

class ToDoLoadingSuccessState extends ToDoState{
  final List<ToDoDataModel> todo;
  ToDoLoadingSuccessState({required this.todo});
  @override
  List<Object?> get props => [todo];
}

class ToDoErrorState extends ToDoState {}

class ToDoSubmitState extends ToDoState {
  // final String title,desc;
  final ToDoDataModel todo;
  ToDoSubmitState({required this.todo});
  // final List<ToDoDataModel> todo;
  // ToDoSubmitState({required this.todo});
} // this when user submit new to_do list

class ToDoNavigateAddPageState extends ToDoActionHomeState {}

class ToDoNavigateHomePageState extends ToDoActionHomeState {}