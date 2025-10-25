import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;

          if (value == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (value == 1) {
            Navigator.pushNamed(context, '/family');
          } else if (value == 2) {
            Navigator.pushNamed(context, '/settings');
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
