import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          accountPhoto(),
          SizedBox(width: 12.w),
          Column(
            children: [
              Text(
                'Добро пожаловать',
                style: AppStyles.authText.copyWith(
                  color: Color(0xFF4B5563),
                  fontSize: 16.sp,
                  letterSpacing: 0,
                  height: 16.sp,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                'Семья Немощных',
                style: AppStyles.authText.copyWith(
                  color: Colors.black,
                  fontSize: 18.sp,
                  letterSpacing: 0,
                  height: 18.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget accountPhoto() {
    return Avatar(
      backgroundColor: Color(0xFFD9D9D9),
      shape: AvatarShape(width: 48.w, height: 48.h, shapeBorder: RoundedRectangleBorder()),
    );
  }
}
