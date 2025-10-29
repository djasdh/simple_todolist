
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/until/AddNewToDo.dart';
import 'package:untitled6/until/AddToDoUnilt.dart';
import 'package:untitled6/until/ToDoUnilt.dart';


class ToDoAppFirstPage extends StatefulWidget {
  const ToDoAppFirstPage({super.key});

  @override
  State<ToDoAppFirstPage> createState() => _ToDoAppFirstPageState();
}

class _ToDoAppFirstPageState extends State<ToDoAppFirstPage> {
  List<List<dynamic>> toDoList = [
    ["this is a example1", false],
    ["this is a ohter example", true],
  ];


  @override
  void initState() {
   super.initState();
    loadData();
  }

  final mycontroller = TextEditingController();
  void _openAddTodoPage() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addnewtodo()),
    );

    if (newTask != null && newTask.isNotEmpty) {
      setState(() {
        toDoList.insert(0, [newTask, false]);
        saveData();
      });
    }
  }

  void _openAddTodoPage2() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addnewtodo()),
    );

    if (newTask != null && newTask.isNotEmpty) {
      setState(() {
        toDoList.insert(0, [newTask, false]);
        saveData();
      });
    }
  }

 void saveData()async{
   final prefs = await SharedPreferences.getInstance();
   List<String> strlist =[];
   setState(() {
     for(var savelist in toDoList) {
       strlist.add("${savelist[0]}|${savelist[1]}");
     }
   });
   await prefs.setStringList("savelist", strlist);
 }

 void loadData()async{
   final prefs = await SharedPreferences.getInstance();
setState(() {
  toDoList.clear();

  List<String>? temptoDoList = prefs.getStringList("savelist");
  for(var iemt in temptoDoList!){
    List<String> temp = iemt.split("|");
    toDoList.add([temp[0],temp[1] == "true"]);
  }
});
  }


  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      saveData();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
      saveData();
    });
  }

  void addtask() {
    String todo = mycontroller.text;
    if (todo.isNotEmpty) {
      setState(() {
        toDoList.insert(0, [todo, false]);
        mycontroller.clear(); // 清空输入框
        saveData();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTodoPage,
        child: Icon(Icons.add),
        shape: CircleBorder(),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          int adjust = index - 1;
          if(index == 0){
            return Column(
              children: [
                Text("TODOLIST",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 52,color: Colors.black12),),
                Addtodounilt(addfun:addtask, controller: mycontroller,)
              ],
            );
          }else{
          return
            ToDoUnilt(
            taskname: toDoList[adjust][0],
            checkboxbool: toDoList[adjust][1],
            onChanged: (value) => checkboxChanged(value, adjust),
            deletefunction: (context) => deleteTask(adjust),
          );
          }
        },
      ),
    );
  }
}
