import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/home/presentation/pages/home_page/widgets/account_widget.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/tasks/tasks_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 70.h),
          AccountWidget(),
          TasksWidget(),
        ],
      ),
    );
  }
}
