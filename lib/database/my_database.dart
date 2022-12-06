import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/database/task.dart';

class MyDatabase{
 static CollectionReference <Task> getTasksCollection(){
    return  FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(fromFirestore:((snapshot, options) {
      return Task.fromFirestore(snapshot.data()!);
    }) , toFirestore: (task,options){
      return task.toFirestore();
    });
  }
static Future<void>  insertTask(Task task){
    var tasksCollection = getTasksCollection();
    var taskDoc = tasksCollection.doc();
    task.id = taskDoc.id;
  return taskDoc.set(task);
}
}