
import 'package:todolist/model/register_model.dart';

abstract class RegisterState {}

abstract class RegisterActionState extends RegisterState{}

class RegisterInitial extends RegisterState{}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadingSuccessState extends RegisterState {
  // final RegisterModel registerModel= RegisterModel(id: id, name: name, email: email);
  Object? get props => [];
}

class RegisterErrorState extends RegisterState {}

class RegisterSubmitState extends RegisterState{}

class RegisterNavigateLoginPageState extends RegisterActionState{}

class RegisterNavigatePageState extends RegisterActionState{}