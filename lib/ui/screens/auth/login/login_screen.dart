import 'package:e_commerce/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: const Text("SignUp"),
        ),
      ),
    );
  }
}
