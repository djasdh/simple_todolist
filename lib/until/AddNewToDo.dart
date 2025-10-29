import 'package:flutter/material.dart';

String ToDoting = "";

final mycontroller = TextEditingController();


class Addnewtodo extends StatefulWidget {
 const Addnewtodo({super.key});

  @override
  State<Addnewtodo> createState() => _Addnewtodo();
}


class _Addnewtodo extends State<Addnewtodo> {

  void updatetodoting(){
    setState(() {
      ToDoting = mycontroller.text;
      print(ToDoting);
      mycontroller.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 60, bottom: 20),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 44,right: 32,),
                        child: TextField(
                          controller:mycontroller,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(hintText: "\n\n\n\n\n\n\n               ToDo"),
                        ),
                        width: 500,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black12,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(width: 100,height: 100,decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(42)), child:TextButton(onPressed:(){Navigator.pop(context);}, child: Text("返回",style: TextStyle(color: Colors.deepPurple),)),),
                      Container(width: 100,height: 100,decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(42)), child:TextButton(onPressed:(){updatetodoting();Navigator.pop(context,ToDoting);}, child: Text("确定",style: TextStyle(color: Colors.deepPurple),)),)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
