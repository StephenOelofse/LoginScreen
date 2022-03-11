import 'package:flutter/material.dart';

import 'package:user_auth_2/core/auth/auth.dart';
import 'package:user_auth_2/core/settings/settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const routename = 'homepage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  ListTile(),
                ],
              ),
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pushNamed(SettingsPage.routename);
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: TextButton(
                  onPressed: () {
                    signUserOut();
                  },
                  child: const Text(
                    'Log Out',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
