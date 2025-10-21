import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class TasksButton extends StatelessWidget {
  const TasksButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(108.65625.w, 80.h),
        elevation: 12,
        backgroundColor: Color(0xFFE0E7FF),
        side: BorderSide(width: 2.w, color: Color(0xFF4F46E5)),
      ),
      child: Text(
        'Задачи',
        style: AppStyles.authText.copyWith(fontSize: 15.sp, height: 100.sp, color: Color(0xFF4F46E5)),
      ),
    );
  }
}
