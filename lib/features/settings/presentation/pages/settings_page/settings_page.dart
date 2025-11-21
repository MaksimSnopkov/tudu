import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool messagesEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 68),
          Container(
            width: 355.w,
            height: 155.h,
            decoration: BoxDecoration(color: const Color(0xFFE0E7FF), borderRadius: BorderRadius.circular(15.r)),
            child: Row(
              children: [
                SizedBox(width: 9.w),
                Container(
                  width: 91.w,
                  height: 91.h,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFF4F46E5)),
                ),
                SizedBox(width: 15.w),
                Column(
                  children: [
                    Text(
                      "",
                      style: AppStyles.taskText.copyWith(color: Colors.black, fontSize: 15.sp),
                    ), // TODO: ник пользователя
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "",
                          style: AppStyles.taskText.copyWith(color: Colors.black, fontSize: 15.sp),
                        ),
                        SizedBox(width: 3.w),
                        IconButton(
                          onPressed: () async => await FlutterClipboard.copy('Hello World'), // вписать переменую id
                          icon: Icon(Icons.copy, size: 12.sp),
                        ),
                      ],
                    ), //TODO: id пользователя, 10 символов
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 34.h),
          Container(
            width: 352.w,
            height: 55.h,
            decoration: BoxDecoration(color: const Color(0xFFE0E7FF), borderRadius: BorderRadius.circular(15.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30.w),
                Text(
                  "Уведомления",
                  style: AppStyles.taskText.copyWith(color: const Color(0xFF4F46E5), fontSize: 20.sp),
                ),
                SizedBox(width: 82.w),
                Switch(
                  value: messagesEnable,
                  onChanged: (value) {
                    setState(() {
                      value = !value;
                    });
                  },
                  activeThumbColor: const Color(0xFF4F46E5),
                ),
                SizedBox(width: 9.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
