
class Task {
  static const String collectionName = "tasks";
  String? id;
  String? title;
  String? description;
  DateTime? dateTime;
  bool? isDone;
  Task({this.id, this.title, this.description, this.dateTime, this.isDone});
  Task.fromFirestore(Map<String,dynamic>? data)
      :this(
      id:data!["id"],
      title:data["title"],
      description:data["description"],
      dateTime:DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
      isDone:data["isDone"]);
  Map<String,dynamic>toFirestore(){
    return{
      "id":id,
      "title":title,
      "description":description,
      "dateTime":dateTime?.millisecondsSinceEpoch,
      "isDone":isDone
    };
  }
}
