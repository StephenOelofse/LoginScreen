import 'package:flutter/material.dart';
import 'package:user_auth_2/core/auth/forgotpasswordpage.dart';

import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/auth/loginpage.dart';
import 'screen/homepage.dart';
import 'core/auth/signuppage.dart';
import 'themes/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: CustomTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      routes: {
        MyHomePage.routename: (context) => const MyHomePage(),
        CreateAccount.routename: (context) => const CreateAccount(),
        ForgotPassword.routename: (context) => ForgotPassword(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyHomePage();
            } else {
              return const LoginPage();
            }
          }));
}
