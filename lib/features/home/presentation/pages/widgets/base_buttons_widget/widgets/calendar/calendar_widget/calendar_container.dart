import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/calendar/calendar_widget/calendar_widget.dart';

class CalendarContainer extends StatefulWidget {
  const CalendarContainer({super.key});

  @override
  State<CalendarContainer> createState() => _CalendarContainerState();
}

class _CalendarContainerState extends State<CalendarContainer> {
  final ValueNotifier<DateTime> focusedDayNotifier = ValueNotifier(DateTime.now());

  /// ✅ Переменная выбранного месяца
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

  @override
  void initState() {
    super.initState();
    selected = months[focusedDayNotifier.value.month - 1];
  }

  void onPreviousMonth() {
    final newDate = DateTime(focusedDayNotifier.value.year, focusedDayNotifier.value.month - 1, 1);
    focusedDayNotifier.value = newDate;
    selected = months[newDate.month - 1];
    setState(() {});
  }

  void onNextMonth() {
    final newDate = DateTime(focusedDayNotifier.value.year, focusedDayNotifier.value.month + 1, 1);
    focusedDayNotifier.value = newDate;
    selected = months[newDate.month - 1];
    setState(() {});
  }

  Widget calendarSwitcherButton(VoidCallback onPrev, VoidCallback onNext, List<String> bottomList) {
    void showMonthPickerWithScrollbar(BuildContext context) async {
      final RenderBox button = context.findRenderObject() as RenderBox;
      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

      final offset = button.localToGlobal(Offset.zero, ancestor: overlay);

      final scrollController = ScrollController();

      final String? selectedMonth = await showDialog<String>(
        context: context,
        barrierColor: Colors.transparent,
        builder: (dialogContext) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(dialogContext).pop(),
                behavior: HitTestBehavior.translucent,
                child: Container(color: Colors.transparent),
              ),

              Positioned(
                left: offset.dx - 40.w,
                top: offset.dy,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 150.w,
                    constraints: BoxConstraints(maxHeight: 250.h),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: RawScrollbar(
                      controller: scrollController,
                      thumbColor: Color(0xFF059669),
                      radius: const Radius.circular(4),
                      thickness: 2,
                      thumbVisibility: true,
                      trackVisibility: false,
                      padding: EdgeInsets.only(right: 2.w, top: 4.h, bottom: 4.h),
                      child: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        shrinkWrap: true,
                        itemCount: months.length,
                        itemBuilder: (context, index) {
                          final month = months[index];
                          final isSelected = month == selected;

                          return InkWell(
                            onTap: () => Navigator.of(dialogContext).pop(month),
                            child: Container(
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(color: isSelected ? const Color(0xFFD1FAE5) : null),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                month,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );

      scrollController.dispose();

      if (selectedMonth != null) {
        setState(() {
          selected = selectedMonth;
          focusedDayNotifier.value = DateTime(focusedDayNotifier.value.year, months.indexOf(selectedMonth) + 1, 1);
        });
      }
    }

    return ValueListenableBuilder<DateTime>(
      valueListenable: focusedDayNotifier,
      builder: (context, focusedDay, _) {
        return Row(
          children: [
            IconButton(
              onPressed: onPrev,
              icon: const Icon(Icons.keyboard_arrow_left, color: Color(0xFF000000)),
            ),

            Builder(
              builder: (BuildContext btnContext) {
                return TextButton(
                  onPressed: () => showMonthPickerWithScrollbar(btnContext),
                  child: SizedBox(
                    width: 74.w,
                    child: Text(
                      selected,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style: AppStyles.authText.copyWith(color: Colors.black, fontSize: 15.sp),
                    ),
                  ),
                );
              },
            ),

            IconButton(
              onPressed: onNext,
              icon: const Icon(Icons.keyboard_arrow_right, color: Color(0xFF000000)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      decoration: BoxDecoration(color: const Color(0xFFD1FAE5), borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          calendarSwitcherButton(onPreviousMonth, onNextMonth, months),
          CalendarWidget(focusedDayNotifier: focusedDayNotifier),
        ],
      ),
    );
  }
}
