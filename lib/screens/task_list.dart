import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screens/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo/service/database.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final tasks=Provider.of<List<Task>>(context) ?? [];
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context,index){
            return Dismissible(
              key: Key(tasks[index].taskName),
                background: Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child:Icon(Icons.delete),
                  color:Colors.purple[800],
                ),
                onDismissed: (direction) async{
                await DatabaseService().removetask(tasks[index].taskName);
                },
                child:TaskTile(task:tasks[index]),
            );
          },
        );
      }
  }
