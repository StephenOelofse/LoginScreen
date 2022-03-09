import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

Future<void> sendPasswordResetEmail(String email) async {
  return _auth.sendPasswordResetEmail(email: email);
}

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  static const routename = 'forgotpassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  bool emailError = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('No Worries! Enter your email adress below:',
                style: Theme.of(context).textTheme.bodyText2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              controller: _emailController,
              textInputAction: TextInputAction.done,
              //obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Johnny.example@gmail.com'),
            ),
          ),
          errorText(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () async {
                  try {
                    await sendPasswordResetEmail(_emailController.text.trim());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'If the email is valid, you have been sent a password reset email'),
                        duration: Duration(seconds: 3)));
                    Navigator.of(context).pop();
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      emailError = true;
                    });
                  }
                },
                child: const Text('Send Password Reset Email')),
          ),
          BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    ));
  }

  Widget errorText() {
    if (emailError == true) {
      return const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          'This is not a valid email adress',
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      return Container();
    }
  }
}
