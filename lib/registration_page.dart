// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:poc/login_page.dart';
import 'package:poc/services/screen_view_mixin.dart';

class RegistrationPage extends StatefulWidget {

   const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>  with RouteAwareAnalytics{
  final TextEditingController _newUsernameController = TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _newUsernameController,
              decoration: const InputDecoration(
                labelText: 'New Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Implement your registration logic here
                String newUsername = _newUsernameController.text;
                String newPassword = _newPasswordController.text;
                // Example validation and registration logic
                if (newUsername.isNotEmpty && newPassword.isNotEmpty) {
                  moEngageManager.logEvent(
                      event: "Registration",
                      properties: {'newUsername': newUsername});
                  debugPrint('Registration successful');
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const LoginPage()),
                  );
                } else {
                  // Show an error message or handle the registration failure
                  debugPrint('Registration failed');
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  AnalyticsRoute get route => AnalyticsRoute.register;
}
