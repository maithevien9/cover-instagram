import 'package:flutter/material.dart';
import 'package:hello/screen/login_screen.dart';
import 'package:hello/screen/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AuthScreen> {
  bool a = true;
  void go() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return a ? LoginScreen(go) : SignUpScreen(go);
  }
}



// }