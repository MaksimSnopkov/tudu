import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class FamilyChatButton extends StatefulWidget {
  const FamilyChatButton({super.key, required this.chatCountMessages});

  final int chatCountMessages;

  @override
  State<FamilyChatButton> createState() => _FamilyChatButtonState();
}

class _FamilyChatButtonState extends State<FamilyChatButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(elevation: 15.r, backgroundColor: Color(0xFFEF8249)),
      child: Row(
        children: [
          Image.asset("assets/icons/family.png", width: 30.w, height: 30.h),
          SizedBox(width: 40.w),
          Text(
            "Семейный чат",
            style: AppStyles.taskText.copyWith(color: Colors.white, fontSize: 20.sp),
          ),
          SizedBox(width: 55.w),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            width: 30.w,
            height: 30.h,
            child: Text(
              widget.chatCountMessages.toString(),
              style: AppStyles.taskText.copyWith(fontSize: 17.sp, color: Color(0xFFEF8249)),
            ),
          ),
        ],
      ),
    );
  }
}
