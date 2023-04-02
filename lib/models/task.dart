class Task
{
  late final String name;
  late bool isDone;

  Task({required this.name,this.isDone=false});

  void togglecheck() {
    isDone = !isDone;
  }

  Task.fromJson(Map<String, dynamic> json)
      : name = json['item'],
        isDone = json['done'];

  Map<String, dynamic> toJson() => {'item': name, 'done': isDone};
}