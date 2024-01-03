// ignore_for_file: annotate_overrides


import 'package:firebase_analytics_poc/firebase_analytics_poc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:poc/registration_page.dart';
import 'package:poc/services/firebase_services.dart';
import 'package:poc/services/screen_view_mixin.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        routeObserver,
        get<FirebaseAnalyticsServices>().getAnalyticsObserver()
      ],
      home: const RegistrationPage(),
    );
  }
}

GetIt get = GetIt.instance;

Future<void> initDI() async {
  await initFirebase();
}

Future<void> initFirebase() async {
  get.registerSingleton<FirebaseAnalyticsServices>(FirebaseAnalyticsServices());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDI();

  runApp(const MyApp());
}
