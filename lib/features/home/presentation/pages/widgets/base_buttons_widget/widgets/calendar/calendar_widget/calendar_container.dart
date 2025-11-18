import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/calendar/calendar_widget/calendar_widget.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/calendar/calendar_widget/widgets/calendar_switcher_button.dart';

class CalendarContainer extends StatefulWidget {
  const CalendarContainer({super.key});

  @override
  State<CalendarContainer> createState() => _CalendarContainerState();
}

//TODO: перекодить
class _CalendarContainerState extends State<CalendarContainer> {
  final ValueNotifier<DateTime> focusedDayNotifier = ValueNotifier(DateTime.now());

  late String selected;

  /// Список месяцев
  final List<String> months = const [
    "Январь",
    "Февраль",
    "Март",
    "Апрель",
    "Май",
    "Июнь",
    "Июль",
    "Август",
    "Сентябрь",
    "Октябрь",
    "Ноябрь",
    "Декабрь",
  ];

  // Список лет
  List<String> years = [DateTime.now().year.toString()];

  @override
  void initState() {
    super.initState();
    selected = months[focusedDayNotifier.value.month - 1];

    focusedDayNotifier.addListener(() {
      final newMonth = months[focusedDayNotifier.value.month - 1];

      if (selected != newMonth) {
        setState(() => selected = newMonth);
      }
    });
  }

  void onPreviousMonth() {
    final newDate = DateTime(focusedDayNotifier.value.year, focusedDayNotifier.value.month - 1, 1);
    focusedDayNotifier.value = newDate;
    setState(() {});
  }

  void onNextMonth() {
    final newDate = DateTime(focusedDayNotifier.value.year, focusedDayNotifier.value.month + 1, 1);
    focusedDayNotifier.value = newDate;
    setState(() {});
  }

  void onNextYear() {
    focusedDayNotifier.value = DateTime(focusedDayNotifier.value.year + 1, focusedDayNotifier.value.month);
  }

  void onPrevYear() {
    focusedDayNotifier.value = DateTime(focusedDayNotifier.value.year - 1, focusedDayNotifier.value.month);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      decoration: BoxDecoration(color: const Color(0xFFD1FAE5), borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalendarSwitcherButton(
                focusedDayNotifier: focusedDayNotifier,
                isYear: false,
                list: months,
                onPrev: onPreviousMonth,
                onNext: onNextMonth,
              ),
              CalendarSwitcherButton(
                focusedDayNotifier: focusedDayNotifier,
                isYear: true,
                list: years,
                onPrev: onPrevYear,
                onNext: onNextYear,
              ),
            ],
          ),
          CalendarWidget(focusedDayNotifier: focusedDayNotifier),
        ],
      ),
    );
  }
}
