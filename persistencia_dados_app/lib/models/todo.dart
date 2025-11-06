// CLASSE QUE REPRESENTA MINHA TAREFA
class Todo {
  final int? id;
  final String title;
  final bool done;

  const Todo({this.id, required this.title, this.done = false});

  Todo copyWith({int? id, String? title, bool? done}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      done: json['done'] == 1 || json['done'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'done': done ? 1 : 0};
  }
}
