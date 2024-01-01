// ignore_for_file: annotate_overrides

import 'package:amplitude_poc/amplitude_poc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:poc/registration_page.dart';
import 'package:poc/services/screen_view_mixin.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorObservers: [routeObserver],
      home: const RegistrationPage(),
    );
  }
}

GetIt get = GetIt.instance;

Future<void> initDI() async {
  // Mixpanel mixpanelInstance = await init();
  Amplitude amplitudeinstance = await initAmplitudeConfig();
  // get.registerSingleton<Mixpanel>(mixpanelInstance);
  // get.registerSingleton<amplitudeManager>(
  //     amplitudeManager(instance: mixpanelInstance));
  get.registerSingleton<Amplitude>(amplitudeinstance);
  get.registerSingleton<AmplitudeManager>(
      AmplitudeManager(instance: amplitudeinstance));

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const MyApp());
}