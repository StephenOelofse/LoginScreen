import 'package:flutter/material.dart';

import 'package:user_auth_2/utils/services/user_secure_storage.dart';
import 'auth.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  static const routename = 'deleteaccount';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Are you sure you want to delete your account?',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  deleteUser();
                  UserSecureStorage.setRememberMe('false');
                  UserSecureStorage.setUsername('');
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Yes, delete my account'),
              ),
            ),
            BackButton(onPressed: () {
              Navigator.of(context).pop();
            }),
          ],
        ),
      ),
    );
  }
}
