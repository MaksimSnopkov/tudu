import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/tasks/tasks_widget/task_card.dart';

class TasksContainer extends StatefulWidget {
  const TasksContainer({super.key});

  @override
  State<TasksContainer> createState() => _TasksContainerState();
}

class _TasksContainerState extends State<TasksContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,
      height: 451.h,
      decoration: BoxDecoration(color: Color(0xFFE0E7FF), borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.only(bottom: 240.h, top: 31.h, left: 18.w, right: 18.w),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return TaskCard(taskText: "Помыть посуду");
          },
        ),
      ),
    );
  }
}
