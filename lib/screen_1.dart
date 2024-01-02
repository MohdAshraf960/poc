import 'package:flutter/material.dart';

import 'package:poc/services/screen_view_mixin.dart';

class Screen1 extends StatefulWidget{
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with RouteAwareAnalytics{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Screen1!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                 analyticsManager.logEvent(event: "screen1",);
              },
              child: const Text('Screen 1'),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  AnalyticsRoute get route => AnalyticsRoute.screen1;
}
