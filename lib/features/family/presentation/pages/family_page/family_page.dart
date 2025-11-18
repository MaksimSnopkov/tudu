import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/family/presentation/pages/family_page/widgets/family_chat_button.dart';
import 'package:tudu/features/family/presentation/pages/family_page/widgets/family_participants.dart';
import 'package:tudu/features/home/presentation/widgets/app_bottom_navigation_bar.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});

  //TODO: сделать менюшку для добавления пользователей в семью
  void addNewFamilyParticipants() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 95.h),
          FamilyChatButton(chatCountMessages: 5),
          SizedBox(height: 18.h),
          FamilyParticipants(),
          SizedBox(height: 18.h),
          ElevatedButton(
            onPressed: addNewFamilyParticipants,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFEF8249),
              shape: const CircleBorder(),
              minimumSize: Size(60.w, 60.h),
              maximumSize: Size(60.w, 60.h),
            ),
            child: Icon(Icons.add, size: 25.sp),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
