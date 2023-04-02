import 'package:flutter/material.dart';
import 'package:todo/models/task_data.dart';
import 'tasktile.dart';
import 'package:todo/models/task.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, TaskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
              isChecked: TaskData.tasks[index].isDone,
              tasktitle: TaskData.tasks[index].name,
              checkBoxCallback: (checkBoxState) {
                TaskData.updateTask(TaskData.tasks[index]);
              },
            longPressCallback: (){
              TaskData.deleteTask(TaskData.tasks[index]);
            },
          );
        },
        itemCount: TaskData.TaskCount,
      );
    });
  }
}
