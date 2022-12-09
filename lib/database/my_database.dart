import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/database/task.dart';
import 'package:todo/date_utiles.dart';

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


static Future<void> insertTask(Task task){
    var tasksCollection = getTasksCollection();
    var taskDoc = tasksCollection.doc();
    task.id = taskDoc.id;
  return taskDoc.set(task);
}


static Future<QuerySnapshot<Task>> getAllTasks(DateTime selectedDate) async{
  return await getTasksCollection()
        .where("dateTime",isEqualTo:dateOnly(selectedDate).millisecondsSinceEpoch)
       .get();

}

static Stream<QuerySnapshot<Task>> listenForTasksRealTimeUpdates(DateTime selectedDate){
   return getTasksCollection()
        .where("dateTime",isEqualTo:dateOnly(selectedDate).millisecondsSinceEpoch)
       .snapshots();
}

static Future<void> deleteTask(Task task){
  var taskDoc = getTasksCollection().doc(task.id);
  return taskDoc.delete();
}

}