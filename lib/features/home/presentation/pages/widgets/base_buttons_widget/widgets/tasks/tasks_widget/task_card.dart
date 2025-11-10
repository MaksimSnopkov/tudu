import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({required this.taskText, required this.onAdd, required this.onDelete, super.key});

  final String taskText;
  final VoidCallback onAdd;
  final VoidCallback onDelete;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final TextEditingController controller = TextEditingController();
  bool isDone = false;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    controller.text = widget.taskText;
  }

  void toggleIsDone() {
    setState(() {
      isDone = !isDone;
    });
  }

  void handleDelete() {
    setState(() => isVisible = false); // начинаем анимацию
    Future.delayed(const Duration(milliseconds: 300), () {
      widget.onDelete(); // удаляем элемент после анимации
    });
  }

  void handleAdd() {
    setState(() => isVisible = true); // начинаем анимацию
    Future.delayed(const Duration(milliseconds: 300), () {
      widget.onAdd(); // удаляем элемент после анимации
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isVisible
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: toggleIsDone,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF4F46E5), width: 2.w),
                        color: isDone ? const Color(0xFF4F46E5) : Colors.transparent,
                      ),
                      child: isDone ? Icon(Icons.check, color: Colors.white, size: 20.sp) : null,
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: AppStyles.taskText.copyWith(fontSize: 15.sp),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  IconButton(
                    onPressed: handleDelete,
                    icon: Icon(CupertinoIcons.trash, size: 20.sp),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
