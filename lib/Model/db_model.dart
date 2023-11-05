import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/Model/todo_Model.dart';

class HiveDatabase{
  final _mybox = Hive.box('todolist');

  void saveData(List<ToDo> alltodolist){
    List<List<dynamic>> alltodolistformatted = [];
    for(var listitems in alltodolist){
      List<dynamic> todolist = [
        listitems.subtitle,
        listitems.title,
        listitems.Creationdate,

      ];
      alltodolistformatted.add(todolist);
    }
    _mybox.put('All_todoList', alltodolistformatted);
  }

  List<ToDo> readdata(){
    List saveddata = _mybox.get('All_todolist')?? [];
    List<ToDo> alltodolist = [];

    for(int i =0; i<saveddata.length ; i++){
      String title = saveddata[i][0];
      DateTime Creationdate = saveddata[i][2];
      String subttitle = saveddata[i][1];
      ToDo todo = ToDo(title: title, subtitle: subttitle, Creationdate: Creationdate);
      alltodolist.add(todo);
    }
    return alltodolist;
  }
}