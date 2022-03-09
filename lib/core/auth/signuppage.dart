import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  static const routename = 'createaccount';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {});
    _passwordController.addListener(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _passwordVisible = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //top: size.height / 4.5,
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onChanged: (value) {
                      email = value.toString().trim();
                    },
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                    )),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    width: size.width / 1.5,
                    height: 40,
                    child: ElevatedButton.icon(
                        icon: const Icon(Icons.lock, size: 20),
                        onPressed: () async {
                          try {
                            await _auth.createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Successful Registration! You can log in now'),
                                    duration: Duration(seconds: 3)));
                            Navigator.of(context).pop();
                          } on FirebaseAuthException catch (e) {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                    title:
                                        const Text(' Ops! Registration Failed'),
                                    content: Text('${e.message}')));
                          }
                        },
                        label: const Text('Register')),
                  ),
                ),
                BackButton(
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
