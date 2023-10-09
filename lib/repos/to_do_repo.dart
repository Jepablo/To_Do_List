import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist/model/to_do_model.dart';

class ToDoRepo{


  static Future <void> create(String title, String desc ) async{ //add product
    final docMenu = FirebaseFirestore.instance.collection('ToDo').doc();
    final add = ToDoDataModel(id: docMenu.id, title: title, desc: desc);
    final json = add.toJson();

    await docMenu.set(json);
  }

  static Future <void> dele(String todoID) async{ //delete product
    final cloud = FirebaseFirestore.instance.collection('ToDo');
    await cloud.doc(todoID).delete();
  }

  static Future <void> edit(String todoID, String title, String desc) async{ //delete product
    final CollectionReference edit = FirebaseFirestore.instance.collection('ToDo');
    return await edit.doc(todoID).update({'title': title , 'desc' : desc});
  }

  static Future<List<ToDoDataModel>> get() async{ //retrieve data from database
    List<ToDoDataModel> todoList = [];
    try{
      final todo = await FirebaseFirestore.instance.collection("ToDo").get();
        todo.docs.forEach((element) {
          return todoList.add(ToDoDataModel.fromJson(element.data()));
        });
        return todoList;
    } on FirebaseException catch (e){
      if (kDebugMode){
        print ("Error la BRO");
      }
      return todoList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }



}