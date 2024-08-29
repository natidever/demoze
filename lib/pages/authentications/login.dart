import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(33, 64, 7, 15),
        child: Column(
          children: [
            Image.asset(width: 64, height: 74, 'assets/icons/logo.png')
          ],
        ),
      ),
    );
  }
}
