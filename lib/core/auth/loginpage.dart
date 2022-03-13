import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_auth_2/core/auth/forgotpasswordpage.dart';
import 'package:user_auth_2/main.dart';
import 'package:user_auth_2/core/auth/signuppage.dart';
import 'package:user_auth_2/utils/services/user_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {});
    _passwordController.addListener(() {});
    init();
  }

  Future init() async {
    final name = await UserSecureStorage.getUsername() ?? '';
    final rememberMeStatus = await UserSecureStorage.getRememberMe() ?? 'false';

    if (mounted) {
      setState(() {
        _emailController.text = name;
        if (name == '') {
          isChecked = false;
        } else if (rememberMeStatus == 'true') {
          isChecked = true;
        }
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final String assetName = 'lib/assets/images/abstract-user-flat-3.svg';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              Opacity(
                opacity: 0.5,
                child: SvgPicture.asset(
                  assetName,
                  semanticsLabel: 'Acme Logo',
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Log In',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'John.Smith@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildCheckBox(),
                  TextButton(
                    child: const Text('Remember Me'),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: size.width / 1.5,
                  height: 40,
                  child: ElevatedButton.icon(
                      icon: const Icon(Icons.lock, size: 20),
                      onPressed: () {
                        signIn();
                      },
                      label: const Text('Sign In')),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ForgotPassword.routename);
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CreateAccount.routename);
                },
                child: Text(
                  'New User? Create Account!',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      if (isChecked) {
        UserSecureStorage.setUsername(_emailController.text);
      }
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException {
      //catch (e) unused
      //TODO impliment exception
    }
    navigatorKey.currentState!.popUntil(((route) => route.isFirst));
  }

  bool isChecked = false;

  Widget buildCheckBox() => Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
            if (isChecked) {
              UserSecureStorage.setRememberMe('true');
            } else {
              UserSecureStorage.setRememberMe('false');
              UserSecureStorage.setUsername('');
            }
          });
        },
        checkColor: Colors.white,
      );
}
