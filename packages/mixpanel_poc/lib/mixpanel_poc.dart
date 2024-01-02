library mixpanel_poc;

import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixPanelManager {
  final Mixpanel _instance;

  MixPanelManager({required Mixpanel instance}) : _instance = instance;

  Future<String> getDistinctId() async {
    return await _instance.getDistinctId();
    
  }

  Future<void> logEvent(
      {required String event,
      Map<String, dynamic> properties = const {}}) async {
    final result = await getDistinctId();
    if (result.isNotEmpty) {
      properties['userId'] = result;
    }
    if (properties.isNotEmpty) {
      _instance.track(event, properties: properties);
    } else {
      _instance.track(event);
    }
  }

  Future<void> setIdentifier({required String identifierName}) async {
    _instance.identify(identifierName);
  }
   
}



Future<Mixpanel> init() async {
  return await Mixpanel.init("4d675c517a339eb3693b9ec821ab1614",
      optOutTrackingDefault: false,
      trackAutomaticEvents: true,
      config: {"track_page_view": true});
}
