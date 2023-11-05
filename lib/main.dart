import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/todo_data.dart';
import 'Screen/Homepage.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('Todolist');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> ToDoData(),
      builder: (context, child)=>const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TodoList",
        home: Homepage(),
      ),
    );
  }
}
