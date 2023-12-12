import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("sign up for TikTok"),
            Gaps.v20,
            Text(
                "Create a profile, follow other accounts, make your own videos, and more."),
          ],
        ),
      ),
    );
  }
}
