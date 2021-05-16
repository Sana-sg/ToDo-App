import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task.dart';

class DatabaseService {
  String uid;
  DatabaseService({this.uid});

   CollectionReference taskCollection = FirebaseFirestore.instance
      .collection('todos');

Future removetask(item) async{
  await taskCollection.where("taskName", isEqualTo: item).get().then((snapshot){
    snapshot.docs.first.reference.delete();
  });
}
Future updatetask(String taskName) async{
  return await taskCollection.doc(uid).set({
    'taskName':taskName,
  });
}
  List<Task> taskListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Task(
        taskName: doc.data()['taskName'] ?? '',
      );
    }).toList();
  }

   TaskData _taskData(DocumentSnapshot snapshot){
  return TaskData(
    taskName: snapshot.data()['taskName'],
  );
   }
  Stream<List<Task>> get task {
    return taskCollection.snapshots()
        .map(taskListFromSnapshot);
  }
  Stream<TaskData> get taskData{
    return taskCollection.doc(uid).snapshots()
        .map(_taskData);
  }


}



