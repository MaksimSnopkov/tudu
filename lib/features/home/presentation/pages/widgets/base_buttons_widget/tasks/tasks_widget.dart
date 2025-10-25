import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/home/presentation/pages/home_page/widgets/account_widget.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/tasks/tasks_widget/tasks_button.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/tasks/tasks_widget/tasks_container.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AccountWidget(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.w,
            children: [TasksButton()],
          ),
          SizedBox(height: 27.h),
          Expanded(child: TasksContainer()),
        ],
      ),
    );
  }
}
