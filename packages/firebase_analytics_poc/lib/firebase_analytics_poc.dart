library firebase_analytics_poc;

import 'package:firebase_analytics/firebase_analytics.dart';



class FirebaseAnalyticsServices {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> logEvent(
      {required String event, Map<String, dynamic>? properties}) async {
       
    _analytics.logEvent(name: event, parameters: properties);
    
  }

  Future<void> logScreenView({required String screenName}) async{
    _analytics.logScreenView(screenClass: screenName,screenName: screenName);
  }

  Future<void> setUserId({required String userId})async{
     await _analytics.setUserId(id: userId);
  }
}






