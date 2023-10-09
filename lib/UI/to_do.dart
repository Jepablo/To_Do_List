import 'package:flutter/material.dart';
import 'package:todolist/UI/to_do_add_tile_widget.dart';
import 'package:todolist/UI/to_do_tile_widget.dart';
import 'package:todolist/bloc/to_do_event.dart';
import 'package:todolist/bloc/to_do_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/model/to_do_model.dart';

import '../bloc/to_do_bloc.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  void initState() {
    todoBloc.add(ToDoInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  //initialize bloc
  final ToDoBloc todoBloc = ToDoBloc();
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoBloc,ToDoState>(
      bloc: todoBloc,
      listenWhen: (previous,current) => current is ToDoActionHomeState,
      buildWhen:(previous,current) => current is! ToDoActionHomeState,
        listener: (context,state){
        if(state is ToDoNavigateAddPageState){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ToDoAddPage()));
        }
        else if (state is ToDoNavigateHomePageState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ToDoPage()));
        }},
      builder: (context,state){
        switch(state.runtimeType){
          case ToDoLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);

          case ToDoLoadingSuccessState:
            // List<ToDoDataModel> data = state.mydata;
            final successState = state as ToDoLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: (Text('To Do Page')),
              ),
              body: ListView.builder(
                itemCount: successState.todo.length,
                itemBuilder: (context,index){
                  print(successState.todo.length);
                  return ToDoTileWidget(toDoBloc: todoBloc, toDoDataModel: successState.todo[index]);
                },
              ),
              floatingActionButton: FloatingActionButton(onPressed: (){
                todoBloc.add(ToDoNavigateEvent());
              }, child: Icon(Icons.add),),
            );

          case ToDoErrorState:
            return Scaffold(body: Center(child: Text('Error')),);

          default:
            return SizedBox();
        }
      }
    );

  }
}
