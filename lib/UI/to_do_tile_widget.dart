import 'package:flutter/material.dart';
import 'package:todolist/bloc/to_do_bloc.dart';
import 'package:todolist/bloc/to_do_event.dart';
import 'package:todolist/model/to_do_model.dart';

class ToDoTileWidget extends StatelessWidget {
  ToDoTileWidget({Key? key, required this.toDoDataModel, required this.toDoBloc}) : super(key: key);
  final ToDoDataModel toDoDataModel;
  final ToDoBloc toDoBloc;
  String title = " ";
  String desc = " ";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          // Text(toDoDataModel.id),
          Text(toDoDataModel.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(width : 10),
          Text(toDoDataModel.desc),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
                _showBottomSheet(context, toDoDataModel.title, toDoDataModel.desc,toDoBloc,toDoDataModel.id);
              }, icon: Icon(Icons.edit)),
              IconButton(onPressed: (){
                toDoBloc.add(ToDoDeleteEvent(id: toDoDataModel.id));
                toDoBloc.add(ToDoNavigateHomeEvent());

              }, icon: Icon(Icons.delete))
            ],
          )
        ],

      ),
    );
  }

  void _showBottomSheet(BuildContext context, String title, String desc, ToDoBloc toDoBloc, String id) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              TextField(
                decoration: InputDecoration(
                  labelText: title,
                ),
                onChanged: (value){
                  title = value;
                },
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  labelText: desc,
                ),
                onChanged: (value){
                  desc = value;
                },
              ),
              SizedBox(height: 10),
              // Text(
              //   desc,
              //   style: TextStyle(fontSize: 16.0),
              // ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pop(); // Close the bottom sheet
                  toDoBloc.add(ToDoEditEvent(title: title, desc: desc, id: id));
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
}

