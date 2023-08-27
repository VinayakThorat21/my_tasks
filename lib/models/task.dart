class Task {
  late String name;
  late bool isDone;

  Task({this.name = 'New Task', this.isDone = false});
  void taskStatus() {
    isDone = !isDone;
  }
}
