// ignore_for_file: annotate_overrides


import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moengage_poc/moengage_poc.dart';

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
  //Amplitude amplitudeinstance = await initAmplitudeConfig();
  // get.registerSingleton<Mixpanel>(mixpanelInstance);
  // get.registerSingleton<amplitudeManager>(
  //     amplitudeManager(instance: mixpanelInstance));
  // get.registerSingleton<Amplitude>(amplitudeinstance);
  // get.registerSingleton<AmplitudeManager>(
  //     AmplitudeManager(instance: amplitudeinstance));
  get.registerSingleton<MoEngageManager>(MoEngageManager()).initManager();    
  
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
 
  runApp(const MyApp());
}



// if (Platform.isIOS) {
//     appToken = 'AAf04981a59e611b4d1feedc9afe712193530badc3-NRMA';
// } else if (Platform.isAndroid) {
//     appToken = 'AAbc4ecb861b0e403f907bc151f9fcf871ce878b6a-NRMA';
// }

// Config config = Config(
//     accessToken: appToken,
//     analyticsEventEnabled: true,
//     networkErrorRequestEnabled: true,
//     networkRequestEnabled: true,
//     crashReportingEnabled: true,
//     interactionTracingEnabled: true,
//     httpResponseBodyCaptureEnabled: true,
//     loggingEnabled: true,
//     webViewInstrumentation: true,
//     printStatementAsEventsEnabled: true,
//     httpInstrumentationEnabled:true);

// // NewrelicMobile.instance.start(config, () {
// //   runApp(MyApp());
// // });

// runZonedGuarded(() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   FlutterError.onError = NewrelicMobile.onError;
//   await NewrelicMobile.instance.startAgent(config);
//   runApp(MyApp());
// }, (Object error, StackTrace stackTrace) {
//   NewrelicMobile.instance.recordError(error, stackTrace);
// });




// import 'package:newrelic_mobile/newrelic_mobile.dart';

// var appToken = "";
// if (Platform.isIOS) {
//     appToken = '<YOUR_IOS_TOKEN>';
// } else if (Platform.isAndroid) {
//     appToken = '<YOUR_ANDROID_TOKEN>';
// }

// Config config =
//     Config(accessToken: appToken,

//     // Android specific option
//     // Optional: Enable or disable collection of event data.
//     analyticsEventEnabled: true,

//     // iOS specific option
//     // Optional: Enable or disable automatic instrumentation of WebViews.
//     webViewInstrumentation: true,

//     // Optional: Enable or disable reporting successful HTTP requests to the MobileRequest event type.
//     networkErrorRequestEnabled: true,

//     // Optional: Enable or disable reporting network and HTTP request errors to the MobileRequestError event type.
//     networkRequestEnabled: true,

//     // Optional: Enable or disable crash reporting.
//     crashReportingEnabled: true,

//     // Optional: Enable or disable interaction tracing. Trace instrumentation still occurs, but no traces are harvested. This will disable default and custom interactions.
//     interactionTracingEnabled: true,

//     // Optional: Enable or disable capture of HTTP response bodies for HTTP error traces, and MobileRequestError events.
//     httpResponseBodyCaptureEnabled: true,

//     // Optional: Enable or disable agent logging.
//     loggingEnabled: true,
    
//     // Optional: Enable or disable print statements as Analytics Events.
//     printStatementAsEventsEnabled : true,

//     // Optional: Enable or disable automatic instrumentation of HTTP requests.
//     httpInstrumentationEnabled: true
//     );

// NewrelicMobile.instance.start(config, () {
//     runApp(MyApp());
// });

