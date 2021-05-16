import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/screens/task_list.dart';
import 'package:todo/screens/add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todo/service/database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  experimentalAutoDetectLongPolling: true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
        home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    void _showAddOnPanel(){
      showDialog(context: context,builder:(context)
      {
        return Dialog(
            shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(20.0)),
          child: Container(
            constraints: BoxConstraints(maxHeight: 300),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: AddOn(),
          )
        );
      });
      }
        return SafeArea(
          child: StreamProvider<List<Task>>.value(
            value:DatabaseService().task,
            child: Scaffold(
              backgroundColor: Colors.black26,
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title:Text(
                  'My Tasks',
                  style:GoogleFonts.oswald(
                  textStyle:TextStyle(
                    color:Colors.purple[800],
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),

              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                  child: TaskList()),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _showAddOnPanel();
                },
                child: const Icon(Icons.edit),
                backgroundColor: Colors.purple[800],
              ),

              ),
          ),
        );
  }
}


