import 'package:flutter/material.dart';
import 'package:todo/widgets/taskslist.dart';
import 'addTaskScreen.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class TaskScreen extends StatelessWidget {


  Widget buildBottomSheet(BuildContext context){
    return addTaskScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, isScrollControlled: true,builder: (context)=>SingleChildScrollView(
              child:Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: buildBottomSheet(context),
              ),
          )
              );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todo',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${Provider.of<TaskData>(context).TaskCount} tasks',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TasksList()),
          ),
        ],
      ),
    );
  }
}

