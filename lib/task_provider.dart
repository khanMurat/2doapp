import 'package:flutter/material.dart';
import 'package:do2app/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskProvider extends ChangeNotifier {
  CollectionReference pastTask = FirebaseFirestore.instance.collection('past');

  List<Task> tasks = [
    Task(name: 'Go to gym'),
  ];

  void addPastTask(String text) {
    Map<String, dynamic> pTaskData = {'task': text};
    pastTask.doc(text).set(pTaskData);
    notifyListeners();
  }

  void addTask(String text) {
    tasks.add(
      Task(name: text),
    );
    notifyListeners();
  }

  void changeCheck(Task task) {
    task.reverseCheck();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
