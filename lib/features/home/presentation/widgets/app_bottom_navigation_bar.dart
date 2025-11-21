import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';
import 'package:tudu/features/family/presentation/pages/family_page/family_page.dart';
import 'package:tudu/features/home/presentation/pages/home_page/home_page.dart';
import 'package:tudu/utils/routes/routes.dart';

class AppBottomNavigationBar extends StatefulWidget {
  AppBottomNavigationBar({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (value) {
        setState(() {
          if (value == widget.currentIndex) return;

          if (value == 0) {
            Navigator.pushNamed(context, route(HomePage));
          } else if (value == 1) {
            Navigator.pushNamed(context, route(FamilyPage));
          } else if (value == 2) {
            //TODO: Navigator.pushNamed(context, route(SettingPage));
          }
        });
      },

      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 20.sp),
          label: 'Главная',
          tooltip: '1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.family_restroom, size: 20.sp),
          label: 'Семья',
          tooltip: '2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 20.sp),
          label: 'Настройки',
          tooltip: '3',
        ),
      ],

      selectedItemColor: Color(0xFF4F46E5),
      unselectedItemColor: Color(0xFF4B5563),

      selectedLabelStyle: AppStyles.bottomNavSelected,
      unselectedLabelStyle: AppStyles.bottomNavUnselected,
    );
  }
}
