import 'package:flutter/material.dart';
import 'package:user_auth_2/core/auth/deleteuserpage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routename = 'settingspage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text('Settings Page'),
          BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(DeleteAccount.routename);
            },
            child: const Text(
              'Delete Account',
            ),
          ),
        ],
      )),
    );
  }
}
