import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class ParticipantsPanel extends StatelessWidget {
  const ParticipantsPanel({super.key, required this.userName, required this.userRole});

  final String userName;
  final String userRole;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 110.h,
      decoration: BoxDecoration(color: Color(0xFFFFEDD5), borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            width: 48.w,
            height: 48.h,
          ),
          SizedBox(width: 4.w),
          Column(
            children: [
              Text(
                userName,
                style: AppStyles.taskText.copyWith(color: Color(0xFFEF8249), fontSize: 16.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                userRole,
                style: AppStyles.taskText.copyWith(color: Color(0xFFEF8249), fontSize: 15.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
