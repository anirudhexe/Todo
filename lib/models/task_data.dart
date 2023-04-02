import 'package:flutter/material.dart';
import 'task.dart';
import 'package:collection/collection.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:collection';
import 'package:flutter/foundation.dart';

class Storage {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> getLocalFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }
}

class TaskData extends ChangeNotifier{

  List<Task> tasks=[
  ];

  TaskData() {
    init();
  }

  void init() async {
    await readFromFile();
    notifyListeners();
  }

  Future readFromFile() async {
    try {
      final file = await Storage.getLocalFile('todo.txt');

      if (file != null) {
        // Read the file
        String contents = await file.readAsString();
        Map jsonMap = jsonDecode(contents);
        print(jsonMap);
        fromJson(jsonMap);
      }
    } catch (e) {
      print("readFromFile: $e");
    }
  }

  void writeToFile() async {
    try {
      final file = await Storage.getLocalFile('todo.txt');
      String json = jsonEncode(toJson());

      // Write the file
      file.writeAsString(json);
    } catch (e) {
      print("writeToFile: $e");
    }
  }

  void fromJson(Map<dynamic, dynamic> json) {
    tasks = [];
    List<dynamic> jsonItems = json['items'];

    for (var item in jsonItems) {
      tasks.add(Task.fromJson(item));
    }
  }

  List _encodeToJson(List<Task> list) {
    List jsonList = [];
    list.map((item) => jsonList.add(item.toJson())).toList();
    return jsonList;
  }

  Map<String, dynamic> toJson() {
    return {'items': _encodeToJson(tasks)};
  }

  void toggleData(int index) {
    tasks[index].togglecheck();
    writeToFile();
    notifyListeners();
  }

  int get TaskCount{
    return tasks.length;
  }

  void addTask(String newTaskTitle)
  {
    final task=Task(name: newTaskTitle);
    tasks.add(task);
    writeToFile();
    notifyListeners();
  }

  void updateTask(Task task)
  {
    task.togglecheck();
    writeToFile();
    notifyListeners();
  }

  void deleteTask(Task task)
  {
    tasks.remove(task);
    writeToFile();
    notifyListeners();
  }
}