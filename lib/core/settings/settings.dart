import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routename = 'settingspage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
          child: Column(
        children: [
          ExpansionTile(
            title: const Text('Account Settings'),
            children: [
              TextButton(onPressed: () {}, child: const Text('Delete Account'))
            ],
          ),
        ],
      )),
    );
  }
}
