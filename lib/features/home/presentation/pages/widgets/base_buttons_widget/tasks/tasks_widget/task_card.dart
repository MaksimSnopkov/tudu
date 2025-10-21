import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class TaskCard extends StatefulWidget {
  TaskCard({required this.taskText, required this.isDone, super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();

  String taskText;
  bool isDone = false;
}

class _TaskCardState extends State<TaskCard> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 236.w,
      height: 15.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.isDone = !widget.isDone;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF4F46E5), width: 2.w),
                color: widget.isDone ? Color(0xFF4F46E5) : Colors.transparent,
              ),
              child: widget.isDone ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
            ),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            width: 236.w,
            height: 15.h,
            child: TextField(
              controller: controller,
              style: AppStyles.taskText,
              cursorColor: Colors.black,

              decoration: InputDecoration(
                hintStyle: AppStyles.taskText,
                hintText: widget.taskText,
                hintTextDirection: TextDirection.ltr,

                border: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                disabledBorder: InputBorder.none,

                helperText: '',
                counterText: '',
                errorText: null,

                filled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
