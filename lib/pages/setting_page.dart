import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Auth Guard",
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: globalAuthService.isAuthGuardEnabled,
                  onChanged: (_){
                    setState(() {
                      globalAuthService.toggleAuthGuard();
                    });
                  },
                )
              ]
            ),
            const Divider(),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                globalAuthService.logout();
              },
            ),
          ],
        ),
      )
    );
  }
}