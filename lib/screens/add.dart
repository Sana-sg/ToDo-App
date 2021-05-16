import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/service/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddOn extends StatefulWidget {

  @override
  _AddOnState createState() => _AddOnState();
}

class _AddOnState extends State<AddOn> {
  final _formKey =GlobalKey<FormState>();
  final FirebaseFirestore taskcollection=FirebaseFirestore.instance;
  String newtask;
  String id;
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'Add New Task',
        style: GoogleFonts.montserrat(
        textStyle:TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
          ),
      SizedBox(height:30.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Enter task'),
            validator: (val) =>
            val.isEmpty ? 'Please enter a task' : null,
            onChanged: (val) => setState(() => newtask = val),
          ),
          SizedBox(height: 30.0),
          RaisedButton(
            color:Colors.purple[800],
            child:Text(
                'Add',
              style:GoogleFonts.montserrat(
                color:Colors.white,
              ),
            ),
            onPressed: () async{
              if (_formKey.currentState.validate()) {
                await taskcollection.collection("todos").add(
                    {
                      "taskName": newtask,
                    }).then((value) {
                  setState(() {
                    id = value.id;
                  });
                  Navigator.pop(context);
                });
              }
            }
          ),
        ],
      ),

    );
  }
}
