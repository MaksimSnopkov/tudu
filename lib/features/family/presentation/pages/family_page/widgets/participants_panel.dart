import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class ParticipantsPanel extends StatelessWidget {
  const ParticipantsPanel({super.key, required this.userName, required this.userRole, required this.inOnline});

  final String userName;
  final String userRole;
  final bool inOnline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 110.h,
      decoration: BoxDecoration(color: Color(0xFFFFEDD5), borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(width: 8.w),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFEF8249)),

            width: 48.w,
            height: 48.h,
          ),
          SizedBox(width: 4.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: AppStyles.taskText.copyWith(color: Color(0xFFEF8249), fontSize: 16.sp),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    userRole,
                    style: AppStyles.taskText.copyWith(color: Color(0xFFEF8249), fontSize: 15.sp),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    inOnline ? "(в сети)" : "(не в сети)",
                    style: AppStyles.taskText.copyWith(color: Color(0xFFEF8249), fontSize: 10.sp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
