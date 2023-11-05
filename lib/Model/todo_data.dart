import 'package:flutter/material.dart';
import 'package:todo_app/Model/db_model.dart';
import 'package:todo_app/Model/todo_Model.dart';
import 'package:provider/provider.dart';

class ToDoData extends ChangeNotifier {
  List<ToDo> overalltodo = [];
  final db = HiveDatabase();

  List<ToDo> getalltodolist() {
    return overalltodo;
  }

  void preparedata() {
    if (db.readdata().isNotEmpty) {
      overalltodo = db.readdata();
    }
  }

  void addnewtodoitem(ToDo item) {
    overalltodo.add(item);
    db.saveData(overalltodo);
    notifyListeners();
  }

  void deletetodoitem(ToDo item) {
    overalltodo.remove(item);
    db.saveData(overalltodo);
    notifyListeners();
  }
}
