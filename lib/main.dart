import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tudu/features/home/presentation/pages/home_page/home_page.dart';

import 'firebase_options.dart';
import 'features/auth/presentation/pages/register_page/register_page.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseAuth auth = FirebaseAuth.instance;
  getIt.registerSingleton<FirebaseAuth>(auth);

  runApp(
    ScreenUtilInit(designSize: const Size(390, 844), minTextAdapt: true, splitScreenMode: true, child: const MainApp()),
  );
}

Widget isAuth() {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  if (user != null) {
    return RegisterPage();
  } else {
    return HomePage();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tudu',
      theme: ThemeData(useMaterial3: false),
      home: isAuth(),
    );
  }
}
