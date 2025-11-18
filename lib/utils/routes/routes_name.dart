import 'package:flutter/material.dart';
import 'package:tudu/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:tudu/features/auth/presentation/pages/register_page/register_page.dart';
import 'package:tudu/features/family/presentation/pages/family_page/family_page.dart';
import 'package:tudu/features/home/presentation/pages/home_page/home_page.dart';
import 'package:tudu/utils/routes/routes.dart';

Map<String, WidgetBuilder> generateRoutes() {
  return {
    route(HomePage): (_) => const HomePage(),
    route(RegisterPage): (_) => RegisterPage(),
    route(LoginPage): (_) => LoginPage(),
    route(FamilyPage): (_) => FamilyPage(),
  };
}

//Navigator.pushNamed(context, route(UserRegisterPage))
