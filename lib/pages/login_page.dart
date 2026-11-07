import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_outline, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 20),
              const Text(
                'Please log in to continue',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Sign In'),
                onPressed: () {
                  // Simply set logged in state!
                  // GoRouter will automatically redirect us to '/'!
                  globalAuthService.login();
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
