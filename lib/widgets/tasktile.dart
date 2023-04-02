import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';


class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String tasktitle;
  final void Function(bool?) checkBoxCallback;
  final GestureLongPressCallback? longPressCallback;

  TaskTile({required this.isChecked,required this.tasktitle,required this.checkBoxCallback,this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        tasktitle,
        style: TextStyle(color: Colors.black54,
            fontSize: 20,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
  }
