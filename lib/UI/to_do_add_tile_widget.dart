import 'package:flutter/material.dart';
import 'package:todolist/UI/to_do.dart';
import 'package:todolist/bloc/to_do_bloc.dart';
import 'package:todolist/bloc/to_do_event.dart';


class ToDoAddPage extends StatelessWidget {

  ToDoAddPage({Key? key}) : super(key: key);
  String? title;
  String? desc;
  final GlobalKey<FormState> _formKey=GlobalKey ();
  final ToDoBloc todoBloc = ToDoBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Add title',
                ),
                onChanged: (value){
                    title = value;
                },
              ),
              const SizedBox(height: 10,),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Add description',
                ),
                onChanged: (value){
                    desc = value;
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 40.0, top: 40.0),
                child:
                ElevatedButton(
                    child: const Text('Submit'),

                    onPressed: ()
                    {
                      todoBloc.add(ToDoSubmitEvent(title: title!,desc: desc!));
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ToDoPage()));

                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
