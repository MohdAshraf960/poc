import 'package:flutter/material.dart';
import 'package:poc/services/screen_view_mixin.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with RouteAwareAnalytics {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Screen3!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
              analyticsManager.logEvent(event: "screen3",);
              },
              child: const Text('Screen 3'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AnalyticsRoute get route => AnalyticsRoute.screen3;
}
