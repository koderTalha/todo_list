
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Custom/Colors.dart';
import 'package:todo_app/Custom/todotile.dart';
import 'package:todo_app/Model/todo_Model.dart';
import 'package:todo_app/Model/todo_data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

TextEditingController txtcontroller = TextEditingController();
TextEditingController txt2controller = TextEditingController();

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoData>(
        builder: (context, value, child) =>
            Scaffold(
              backgroundColor: bgcolor,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Appbarcolor,
                onPressed: addnewitem,
                child: const Icon(Icons.add,color: Colors.black),
              ),
              appBar: AppBar(
                title: const Text('TODO  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black87),),
                centerTitle: true,
                backgroundColor: Appbarcolor,

              ),
              body: ListView.builder(
                  itemCount: value
                      .getalltodolist()
                      .length,
                  itemBuilder: (context,index)=> Todotile(
                    title: value.overalltodo[index].title,
                    subtitle: value.overalltodo[index].subtitle,
                    datetime: value.overalltodo[index].Creationdate,
                    deletetodo: (p0)=> deleteToDo(value.overalltodo[index]),
                  )
              ),
            )
    );
  }

  void addnewitem() {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: tilecolor,
              title: const Text("Add new item",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: txtcontroller,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                      labelText: "Add Item",
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: txt2controller,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                      labelText: "Add details",
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(onPressed: save, child: const Text('Save', style: TextStyle(color: Colors.black),),style: ElevatedButton.styleFrom(backgroundColor: Appbarcolor, ),),
                ElevatedButton(onPressed: () {}, child: const Text('cancel',style: TextStyle(color: Colors.black)),style: ElevatedButton.styleFrom(backgroundColor: Appbarcolor, ),),
              ],
            )
    );
  }

  void save() {
    ToDo newtodo = ToDo(
      title: txtcontroller.text,
      subtitle: txt2controller.text,
      Creationdate: DateTime.now(),
    );
    Provider.of<ToDoData>(context,listen: false).addnewtodoitem(newtodo);
    Navigator.pop(context);
    clear();
  }

  void deleteToDo(ToDo item){
    Provider.of<ToDoData>(context,listen: false).deletetodoitem(item);
  }

  void clear() {
    txtcontroller.clear();
    txt2controller.clear();
  }
}
