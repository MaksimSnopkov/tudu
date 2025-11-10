import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/home/presentation/pages/home_page/widgets/account_widget.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/usecases/containers_control.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/calendar/calendar_widget/calendar_button.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/calendar/calendar_widget/calendar_container.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/products/products_widget/producs_button.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/products/products_widget/products_container.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/tasks/tasks_widget/tasks_button.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/tasks/tasks_widget/tasks_container.dart';

class BaseButtonWidget extends StatefulWidget {
  const BaseButtonWidget({super.key});

  @override
  State<BaseButtonWidget> createState() => _BaseButtonWidgetState();
}

class _BaseButtonWidgetState extends State<BaseButtonWidget> {
  final ContainersControl controller = ContainersControl();

  void _toggleContainer(ContainerType type) {
    setState(() {
      controller.changeContainer(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? activeWidget;

    switch (controller.activeContainer) {
      case ContainerType.task:
        activeWidget = const TasksContainer();
        break;
      case ContainerType.product:
        activeWidget = const ProductsContainer();
        break;
      case ContainerType.none:
        activeWidget = null;
        break;
      case ContainerType.calendar:
        activeWidget = CalendarContainer();
    }

    return Expanded(
      child: Column(
        children: [
          AccountWidget(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.w,
            children: [
              TasksButton(
                onTap: () => _toggleContainer(ContainerType.task),
                isActive: controller.activeContainer == ContainerType.task,
              ),
              CalendarButton(
                onTap: () => _toggleContainer(ContainerType.calendar),
                isActive: controller.activeContainer == ContainerType.calendar,
              ),
              ProductsButton(
                onTap: () => _toggleContainer(ContainerType.product),
                isActive: controller.activeContainer == ContainerType.product,
              ),
            ],
          ),
          SizedBox(height: 27.h),
          if (activeWidget != null) Expanded(child: activeWidget),
        ],
      ),
    );
  }
}
