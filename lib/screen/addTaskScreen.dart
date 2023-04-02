import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_data.dart';



class addTaskScreen extends StatelessWidget {
  String newTaskTitle="";

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 30,left: 50,right: 50,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue.shade300,
                  fontSize: 30,
                ),
              ),
              TextField(
                onChanged: (newText){
                  newTaskTitle=newText;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextButton(
                    onPressed: (){
                      
                      Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
