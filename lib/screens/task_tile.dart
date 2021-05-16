import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/task.dart';




class TaskTile extends StatefulWidget {
  final Task task;

  TaskTile({this.task});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool ischeck=false;
  @override
  Widget build(BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                      child:ListTile(
                        leading: Checkbox(
                            activeColor: Colors.purple[800],
                            value:ischeck,
                            onChanged: (bool val){
                              if(val==false){
                                setState(()=>ischeck=false);
                              }else{
                                setState(()=>ischeck=true);
                              }
                            },
                          ),
                        title:Text(
                            widget.task.taskName,
                          style:GoogleFonts.ubuntu(
                            textStyle:TextStyle(
                            fontSize: 20.0,
                            color:Colors.black87,
                          ),
                        ),
                        ),
                        onTap: () {
                          //_showEditPanel();
                        },
                        ),
                      ),
                );
              }
          }



