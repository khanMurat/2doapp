// ignore_for_file: prefer_const_constructors
import 'package:do2app/constant.dart';
import 'package:do2app/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  String? newTask;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff757575),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  newTask = value;
                },
                textAlign: TextAlign.center,
                decoration: kTaskTextFieldDecoration.copyWith(
                    hintText: 'Add Assigment'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF2BC0E4)),
                onPressed: () {
                  Provider.of<TaskProvider>(context, listen: false)
                      .addTask(newTask!);
                  Provider.of<TaskProvider>(context, listen: false)
                      .addPastTask(newTask!);
                  Navigator.pop(context);
                },
                child: (Icon(Icons.add)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
