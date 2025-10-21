import 'package:flutter/material.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/tasks/tasks_widget/task_card.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348,
      height: 451,
      decoration: BoxDecoration(color: Color(0xFFE0E7FF), borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 240, top: 31, left: 18, right: 18),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskCard(isDone: false, taskText: "Помыть посуду");
          },
        ),
      ),
    );
  }
}
