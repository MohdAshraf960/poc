// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:poc/services/screen_view_mixin.dart';

class HomeScreen extends StatefulWidget {
 const  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAwareAnalytics {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                moEngageManager.logEvent(event: 'Logout');
                if (!context.mounted) return;
                Navigator.pop(context); // Navigate back to the login page
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
  
  @override

  AnalyticsRoute get route => AnalyticsRoute.home;
}
