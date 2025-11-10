import 'package:flutter/material.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/base_button_widget.dart';
import 'package:tudu/features/home/presentation/widgets/app_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [BaseButtonWidget()]),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
