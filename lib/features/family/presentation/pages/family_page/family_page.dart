import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/family/presentation/pages/family_page/widgets/add_participant_dialog.dart';
import 'package:tudu/features/family/presentation/pages/family_page/widgets/family_chat_button.dart';
import 'package:tudu/features/family/presentation/pages/family_page/widgets/family_participants.dart';
import 'package:tudu/features/home/presentation/widgets/app_bottom_navigation_bar.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  void _addNewFamilyParticipantsMenu() async {
    await showDialog<String>(context: context, builder: (context) => AddParticipantDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 95.h),
              FamilyChatButton(chatCountMessages: 5),
              SizedBox(height: 18.h),
              FamilyParticipants(),
              SizedBox(height: 18.h),
              ElevatedButton(
                onPressed: _addNewFamilyParticipantsMenu,
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
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 1),
    );
  }
}
