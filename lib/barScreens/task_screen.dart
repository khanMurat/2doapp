// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:do2app/constant.dart';
import 'package:do2app/task_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 70, bottom: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: TextStyle(
                        color: kBlueyColor,
                      ),
                    ),
                    Text('2do App', style: kTodoTextStyle),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kBlueyColor,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddTaskScreen(),
                    );
                  },
                  child: Text(
                    'Add TASK',
                    style: TextStyle(color: Color(0xFFEAECC6)),
                  ),
                ),
              ],
            ),
          ),
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: kBlueyColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ),
          SizedBox(
            height: 25.0,
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TaskView(),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
