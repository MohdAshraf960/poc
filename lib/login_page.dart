// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:poc/home_screen.dart';

import 'package:poc/services/screen_view_mixin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with RouteAwareAnalytics {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Implement your authentication logic here
                String username = _usernameController.text;
              
                // Example validation (you should replace this with your authentication logic)

                amplitudeManager.logEvent(
                    event: 'Login', properties: {'username': username});
               // moEngageManager.setUserId(userId: username);

                // Navigate to the home page or perform other actions
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                debugPrint('Login successful');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AnalyticsRoute get route => AnalyticsRoute.login;
}
