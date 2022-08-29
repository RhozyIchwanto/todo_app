class Todo {
  final String id;
  final String title;
  final String desc;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.desc,
    this.isCompleted = false,
  });
}

List<Todo> dataTodo = [
  Todo(
    id: DateTime.now().toString(),
    title: "Data 1",
    desc: "Data 123",
  ),
  Todo(
    id: DateTime.now().toString(),
    title: "Data 2",
    desc: "Data 1234",
  ),
  Todo(
    id: DateTime.now().toString(),
    title: "Data 3",
    desc: "Data 1234",
  ),
  Todo(
    id: DateTime.now().toString(),
    title: "Data 4",
    desc: "Data 1234",
  ),
  Todo(
    id: DateTime.now().toString(),
    title: "Data 5",
    desc: "Data 1234",
  ),
];
