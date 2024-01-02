// A Navigator observer that notifies RouteAwares of changes to state of their Route


import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:mixpanel_poc/mixpanel.dart';
import 'package:poc/main.dart';


final routeObserver = RouteObserver<PageRoute>();

 final analyticsManager = get<MixPanelManager>();

mixin RouteAwareAnalytics<T extends StatefulWidget> on State<T>
    implements RouteAware {
  AnalyticsRoute get route;
  
    @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {}

  @override
  void didPopNext() {
    _setCurrentScreen(route);
  }

  @override
  void didPush() {
    _setCurrentScreen(route);
  }

  @override
  void didPushNext() {}

  Future<void> _setCurrentScreen(AnalyticsRoute analyticsRoute) async{
    log('Setting current screen to ${analyticsRoute.name}',name: analyticsRoute.name);
    analyticsManager.logEvent(event: screenClass(route),properties: {"screen_name": screenClass(route), "timestamp":DateTime.now().millisecondsSinceEpoch}); 
    
  }
}



enum AnalyticsRoute { login,register,home,screen1,screen2,screen3 }

String screenClass(AnalyticsRoute route) {
  switch (route) {
    case AnalyticsRoute.login:
      return 'Login Viewed';
    case AnalyticsRoute.register:
       return 'Register Viewed';
    case AnalyticsRoute.home:
       return 'Home Viewed';
    case AnalyticsRoute.screen1:
       return 'Screen 1 Viewed';
    case AnalyticsRoute.screen2:
       return 'Screen 2 Viewed';
    case AnalyticsRoute.screen3:
       return 'Screen 3 Viewed';
  }
}