library amplitude_poc;

import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/identify.dart';


export 'package:amplitude_flutter/amplitude.dart';

class AmplitudeManager{
  final Amplitude _instance;

  AmplitudeManager({required Amplitude instance}) : _instance = instance;


  Future<void> logEvent(
      {required String event, Map<String, dynamic>? properties}) async {
    _instance.logEvent(event, eventProperties: properties);
   
    
  }

   Future<void> setIdentifier(
      {required String key, required String value}) async {
    final Identify identify = Identify()..set(key, value);
    _instance.identify(identify);
  }

  Future<void> setUserId({required String userId}) async{
     _instance.setUserId(userId);
     
  }

}

 
Future<Amplitude> initAmplitudeConfig() async{
  final Amplitude analytics = Amplitude.getInstance()
  ..trackingSessionEvents(true);

  await analytics.init("800512f31fd09919c5869442ab04e67b");
  return analytics;
}