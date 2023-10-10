

import 'dart:async';

import 'package:todolist/UI/register/registerbloc/register_event.dart';
import 'package:todolist/UI/register/registerbloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repos/auth_repo.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  // late final AuthRepo authRepo;
  RegisterBloc() : super(RegisterInitial()){
    //events
    on<RegisterInitialEvent>(registerInitialEvent);

  }

  FutureOr<void> registerInitialEvent(RegisterInitialEvent event, Emitter<RegisterState> emit) async{
    emit (RegisterLoadingState());
    // print('masuk');
    await Future.delayed(Duration(milliseconds: 800));
    try{
      print('masuk');
      emit(RegisterLoadingSuccessState());
    } catch (e){
      emit (RegisterErrorState());
    }
  }
}