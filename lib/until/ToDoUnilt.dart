import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';



class ToDoUnilt extends StatelessWidget {
  final String taskname;
  bool checkboxbool = false;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deletefunction;
   ToDoUnilt({
    super.key,
    required this.taskname,
    required this.checkboxbool,
    required this.onChanged,
    required this.deletefunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24,top: 10),
      child: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(motion: StretchMotion(), children:[SlidableAction(onPressed: deletefunction,icon: Icons.delete,backgroundColor: Colors.black12,)]) ,
            child: Container(
              width: 600,height: 100,
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40)),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Checkbox(value: checkboxbool, onChanged: onChanged,),
                  Text(
                    taskname,
                    style: TextStyle(fontWeight: FontWeight.w800,decoration: checkboxbool ? TextDecoration.lineThrough : TextDecoration.none),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
