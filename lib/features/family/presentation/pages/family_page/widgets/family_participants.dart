import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/family/presentation/pages/family_page/widgets/participants_panel.dart';

class FamilyParticipants extends StatelessWidget {
  const FamilyParticipants({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 366,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (_, __) => SizedBox(height: 18.h),
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        itemBuilder: (context, index) => ParticipantsPanel(userName: 'maksim', userRole: 'admin', inOnline: true),
      ),
    );
  }
}
