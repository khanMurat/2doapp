import 'package:flutter/material.dart';
import 'package:do2app/task_provider.dart';
import 'package:provider/provider.dart';

class TaskView extends StatefulWidget {
  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (BuildContext context, index) {
            return TaskTile(
                text: taskData.tasks[index].name,
                isDone: taskData.tasks[index].isCheck,
                onChanged: (bool) {
                  taskData.changeCheck(taskData.tasks[index]);
                },
                onLongPressed: () {
                  taskData.deleteTask(taskData.tasks[index]);
                });
          },
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final String? text;
  final bool? isDone;
  final void Function()? onLongPressed;

  const TaskTile(
      {super.key, this.onChanged, this.text, this.isDone, this.onLongPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.5),
      color: isDone == false ? Color(0xFFEAECC6) : Colors.white12,
      child: ListTile(
        onLongPress: onLongPressed,
        leading: Text(
          text!,
          style: TextStyle(
              color: isDone == false ? Colors.black : Colors.black26,
              decoration: isDone == false ? null : TextDecoration.lineThrough),
        ),
        trailing: Checkbox(
          activeColor: Colors.black26,
          checkColor: Colors.white12,
          value: isDone,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
