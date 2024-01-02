library amplitude_poc;

import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/identify.dart';

export 'package:amplitude_flutter/amplitude.dart';

class AmplitudeManager {
  final Amplitude _instance;

  AmplitudeManager({required Amplitude instance}) : _instance = instance;

  Future<void> logEvent(
      {required String event,
      Map<String, dynamic> properties = const {}}) async {
    final result = await getUserId();
    if (result.isNotEmpty) {
      properties['userId'] = result;
    }

    if (properties.isNotEmpty) {
      _instance.logEvent(event, eventProperties: properties);
    } else {
      _instance.logEvent(event);
    }
  }

  Future<void> setIdentifier(
      {required String key, required String value}) async {
    final Identify identify = Identify()..set(key, value);
    _instance.identify(identify);
  }

  Future<void> setUserId({required String userId}) async {
    _instance.setUserId(userId);
  }

  Future<String> getUserId() async {
    return await _instance.getUserId() ?? "";
  }

  reset(){
    
  }
}

Future<Amplitude> initAmplitudeConfig() async {
  final Amplitude analytics = Amplitude.getInstance()
    ..trackingSessionEvents(true);

  await analytics.init("800512f31fd09919c5869442ab04e67b");
  return analytics;
}
