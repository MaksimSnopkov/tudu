import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({required this.focusedDayNotifier, super.key});

  final ValueNotifier<DateTime> focusedDayNotifier;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

List<DateTime> generateCalendarDays(DateTime focusedDay) {
  final firstDayOfMonth = DateTime(focusedDay.year, focusedDay.month, 1);

  int weekdayOfFirst = firstDayOfMonth.weekday;
  final startDate = firstDayOfMonth.subtract(Duration(days: weekdayOfFirst - 1));

  return List.generate(42, (index) {
    return startDate.add(Duration(days: index));
  });
}

bool _isToday(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year && date.month == now.month && date.day == now.day;
}

bool _isCurrentMonth(DateTime date, DateTime focusedDay) {
  return date.month == focusedDay.month && date.year == focusedDay.year;
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: widget.focusedDayNotifier,
      builder: (context, focusedDay, _) {
        final days = generateCalendarDays(focusedDay);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: GridView.builder(
            // ✅ КРИТИЧНО: добавляем shrinkWrap и отключаем скролл
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 34.7.w,
              mainAxisSpacing: 8.h,
            ),

            itemCount: 35,
            itemBuilder: (context, index) {
              final date = days[index];
              final isToday = _isToday(date);
              final isSelected =
                  _selectedDay != null &&
                  date.year == _selectedDay!.year &&
                  date.month == _selectedDay!.month &&
                  date.day == _selectedDay!.day;
              final isCurrentMonth = _isCurrentMonth(date, focusedDay);

              Color backgroundColor;
              Color textColor;
              FontWeight fontWeight = FontWeight.w500;

              if (isSelected) {
                backgroundColor = const Color(0xFF059669);
                textColor = Colors.white;
                fontWeight = FontWeight.w600;
              } else if (isToday) {
                backgroundColor = const Color(0xFF10B981);
                textColor = Colors.white;
              } else if (isCurrentMonth) {
                backgroundColor = Colors.white;
                textColor = const Color(0xFF059669);
              } else {
                backgroundColor = Colors.white.withValues(alpha: 0.3);
                textColor = const Color(0xFF059669).withValues(alpha: 0.3);
              }

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDay = date;
                    widget.focusedDayNotifier.value = date;
                  });
                },
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    date.day.toString(),
                    style: AppStyles.taskText.copyWith(color: textColor, fontWeight: fontWeight, fontSize: 15.sp),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
