import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path/path.dart';




class Addtodounilt extends StatelessWidget {
  final VoidCallback addfun;
TextEditingController? controller;


 Addtodounilt({super.key,required this.addfun,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, top: 10),
      child: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  onPressed:(context) => addfun(),
                  icon: Icons.add,
                  backgroundColor: Colors.black12,
                ),
              ],
            ),
            child: Container(
              width: 600,
              height: 100,
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                hintText: "what did you do"
                ),
                controller:controller ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
