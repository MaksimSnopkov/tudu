import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:tudu/features/home/presentation/pages/home_page/home_page.dart';
import 'package:tudu/utils/routes/routes.dart';
import 'package:tudu/utils/routes/routes_name.dart';

import 'features/auth/presentation/pages/register_page/register_page.dart';
import 'firebase_options.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ru_RU', null);

  final talker = TalkerFlutter.init();
  getIt.registerSingleton<Talker>(talker);
  talker.verbose('Talker initialized');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseAuth auth = FirebaseAuth.instance;
  getIt.registerSingleton<FirebaseAuth>(auth);

  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: false,
      splitScreenMode: false,
      child: const MainApp(),
    ),
  );
}

String isAuth() {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  Talker talker = GetIt.I.get<Talker>();
  talker.info('Current user: ${user ?? "No user logged in"}');

  if (user != null) {
    return route(HomePage);
  } else {
    return route(RegisterPage);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: generateRoutes(),
      initialRoute: isAuth(),

      title: 'Tudu',
      theme: ThemeData(useMaterial3: false),
      home: RegisterPage(),
    );
  }
}
