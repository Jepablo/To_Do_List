import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:todolist/bloc/to_do_event.dart';
import 'package:todolist/bloc/to_do_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/model/to_do_model.dart';

import '../repos/to_do_repo.dart';
class ToDoBloc extends Bloc<ToDoEvent,ToDoState> {
  late final ToDoRepo toDoRepo;

  ToDoBloc() : super(ToDoInitial()) {
    //events
    on<ToDoInitialEvent>(toDoInitialEvent);
    on<ToDoSubmitEvent>(toDoSubmitEvent);
    on<ToDoNavigateEvent>(toDoNavigateEvent);
    on<ToDoNavigateHomeEvent>(toDoNavigateHomeEvent);
    on<ToDoEditEvent>(toDoEditEvent);
    on<ToDoDeleteEvent>(toDoDeleteEvent);
    // on<GetDataEvent>(getDataEvent);
  }

  FutureOr<void> toDoInitialEvent(ToDoInitialEvent event,
      Emitter<ToDoState> emit) async {
    emit(ToDoLoadingState());
    await Future.delayed(Duration(seconds: 1));
    try {
      final data = await ToDoRepo.get();
      emit(ToDoLoadingSuccessState(todo: data));
    } catch (e) {
      emit(ToDoErrorState());
    }
  }


  FutureOr<void> toDoNavigateEvent(ToDoNavigateEvent event, Emitter<ToDoState> emit) {
    emit(ToDoNavigateAddPageState());
  }

  FutureOr<void> toDoSubmitEvent(ToDoSubmitEvent event, Emitter<ToDoState> emit) async{
    await ToDoRepo.create(event.title, event.desc);
    emit(ToDoLoadingState());
  }

  FutureOr<void> toDoEditEvent(ToDoEditEvent event, Emitter<ToDoState> emit) async{
    await ToDoRepo.edit(event.id, event.title, event.desc);
    emit(ToDoNavigateHomePageState());
    // emit(ToDoLoadingState());
  }

  FutureOr<void> toDoNavigateHomeEvent(ToDoNavigateHomeEvent event, Emitter<ToDoState> emit) {
    emit(ToDoNavigateHomePageState());
  }

  FutureOr<void> toDoDeleteEvent(ToDoDeleteEvent event, Emitter<ToDoState> emit) async{
    await Future.delayed(Duration(seconds: 1));
    await ToDoRepo.dele(event.id);


  }
}

//   FutureOr<void> getDataEvent(GetDataEvent event, Emitter<ToDoState> emit) async{
//     emit (ToDoLoadingState());
//     await Future.delayed(Duration(seconds: 1));
//     try {
//       final data = await ToDoRepo.get();
//       emit(ToDoLoadingSuccessState(todo: data));
//     } catch (e){
//       emit(ToDoErrorState());
//     }
//   }