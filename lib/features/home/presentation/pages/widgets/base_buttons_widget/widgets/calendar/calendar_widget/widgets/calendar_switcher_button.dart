import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class CalendarSwitcherButton extends StatefulWidget {
  const CalendarSwitcherButton({
    super.key,
    required this.onPrev,
    required this.onNext,
    required this.list,
    required this.focusedDayNotifier,
    required this.isYear,
  });

  final VoidCallback onPrev;
  final VoidCallback onNext;
  final List<String> list;
  final ValueNotifier<DateTime> focusedDayNotifier;
  final bool isYear;

  @override
  State<CalendarSwitcherButton> createState() => _CalendarSwitcherButtonState();
}

class _CalendarSwitcherButtonState extends State<CalendarSwitcherButton> {
  String get selected {
    if (widget.isYear) {
      return widget.focusedDayNotifier.value.year.toString();
    } else {
      return widget.list[widget.focusedDayNotifier.value.month - 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    void showMonthPickerWithScrollbar(BuildContext context) async {
      final RenderBox button = context.findRenderObject() as RenderBox;
      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

      final offset = button.localToGlobal(Offset.zero, ancestor: overlay);

      final scrollController = ScrollController();

      final String? selectedObject = await showDialog<String>(
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
                        itemCount: widget.list.length,
                        itemBuilder: (context, index) {
                          final bList = widget.list[index];
                          final isSelected = bList == selected;

                          return InkWell(
                            onTap: () => Navigator.of(dialogContext).pop(bList),
                            child: Container(
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(color: isSelected ? const Color(0xFFD1FAE5) : null),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                bList,
                                style: AppStyles.taskText.copyWith(
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

      if (selectedObject != null) {
        setState(() {
          if (widget.isYear) {
            widget.focusedDayNotifier.value = DateTime(
              int.parse(selectedObject),
              widget.focusedDayNotifier.value.month,
              1,
            );
          }
        });
      } else {
        widget.focusedDayNotifier.value = DateTime(
          widget.focusedDayNotifier.value.year,
          widget.list.indexOf(selectedObject!) + 1,
          1,
        );
      }
    }

    return ValueListenableBuilder<DateTime>(
      valueListenable: widget.focusedDayNotifier,
      builder: (context, focusedDay, _) {
        return Row(
          children: [
            IconButton(
              onPressed: widget.onPrev,
              icon: const Icon(Icons.keyboard_arrow_left, color: Color(0xFF000000)),
            ),

            Builder(
              builder: (BuildContext btnContext) {
                return TextButton(
                  onPressed: () => showMonthPickerWithScrollbar(btnContext),
                  child: SizedBox(
                    width: 60.w,
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
              onPressed: widget.onNext,
              icon: const Icon(Icons.keyboard_arrow_right, color: Color(0xFF000000)),
            ),
          ],
        );
      },
    );
  }
}
