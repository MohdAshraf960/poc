library moengage_poc;

import 'package:moengage_poc/moengage_poc.dart';

export  'package:moengage_flutter/moengage_flutter.dart';

final MoEngageFlutter _moengagePlugin = MoEngageFlutter("QGI3H1EQA7Q4RAD89DYZ6IRL",moEInitConfig: MoEInitConfig.defaultConfig());


class MoEngageManager{

  initManager(){
    _moengagePlugin.initialise();
    _moengagePlugin.configureLogs(LogLevel.DEBUG);
    _moengagePlugin.enableSdk();
  }  

  logEvent({required String event, Map<String, dynamic>? properties}) {
    MoEProperties? moEProperties = MoEProperties();

    properties?.forEach((key, value) {
      moEProperties.addAttribute(key, value);
    });

    if (properties != null) {
      _moengagePlugin.trackEvent(event, moEProperties);
    } else {
      _moengagePlugin.trackEvent(event);
    }
  }

}