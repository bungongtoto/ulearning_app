import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: const Center(
            child: Text("Sign in Page"),
          ),
        ),
      ),
    );
  }
}
