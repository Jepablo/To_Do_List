import 'package:flutter/material.dart';
import 'package:todolist/UI/register/register_tile.widget.dart';
import 'package:todolist/UI/register/registerbloc/register_bloc.dart';
import 'package:todolist/UI/register/registerbloc/register_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/UI/register/registerbloc/register_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    registerBloc.add(RegisterInitialEvent());
    super.initState();
  }

  final RegisterBloc registerBloc = RegisterBloc();
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc,RegisterState>(
      bloc: registerBloc,
      listenWhen: (previous,current) => current is RegisterActionState,
      buildWhen: (previous,current) => current is! RegisterActionState,
      listener: (context,state){
        if (state is RegisterNavigateLoginPageState){
          // Navigator.push(context,MaterialPageRoute(builder: (context) => ToDoAddPage()));
        }
        // else if (state is RegisterNavigatePageState){
        //   Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterTilePage()));
        // }
      },
      builder: (context,state){
        switch(state.runtimeType){
          case RegisterLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          case RegisterLoadingSuccessState:
            return RegisterTilePage();

          case RegisterErrorState:
            return Scaffold(body: Center(child: Text('Error'),),);

          default:
            return SizedBox();
        }
      },
    );
  }
}
