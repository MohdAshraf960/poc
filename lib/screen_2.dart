import 'package:flutter/material.dart';

import 'package:poc/services/screen_view_mixin.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2>  with RouteAwareAnalytics {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Screen2!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                analyticsManager.logEvent(event: "screen2",);
              },
              child: const Text('Screen 2'),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
   AnalyticsRoute get route => AnalyticsRoute.screen2;
}
