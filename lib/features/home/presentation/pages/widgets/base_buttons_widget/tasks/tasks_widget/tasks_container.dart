import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/tasks/tasks_widget/task_card.dart';

class TasksContainer extends StatefulWidget {
  const TasksContainer({super.key});

  @override
  State<TasksContainer> createState() => _TasksContainerState();
}

class _TasksContainerState extends State<TasksContainer> {
  List<String> tasks = ["Помыть посуду", "Сделать уборку"];

  VoidCallback addTask() {
    return () => setState(() {
      tasks.add('Напишите задачу (нажмите)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,

      decoration: BoxDecoration(color: Color(0xFFE0E7FF), borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 390.h,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskText: tasks[index],
                  onAdd: addTask,
                  onDelete: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: ElevatedButton(
              onPressed: addTask,
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4F46E5), shape: const CircleBorder()),
              child: Icon(Icons.add, size: 25.sp),
            ),
          ),
        ],
      ),
    );
  }
}
