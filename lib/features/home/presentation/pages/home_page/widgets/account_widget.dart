import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 73.h),
      child: Row(
        children: [
          accountPhoto(),
          SizedBox(width: 12.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Добро пожаловать',
                  style: AppStyles.authText.copyWith(
                    color: Color(0xFF4B5563),
                    fontSize: 16.sp,
                    letterSpacing: 0,
                    height: 1.6.sp,
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  'Семья Немощных',
                  style: AppStyles.authText.copyWith(
                    color: Colors.black,
                    fontSize: 18.sp,
                    letterSpacing: 0,
                    height: 1.8.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget accountPhoto() {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(color: Color(0xFFD9D9D9), shape: BoxShape.circle),
    );
  }
}
