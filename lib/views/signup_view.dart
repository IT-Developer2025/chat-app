import 'package:chat_app/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  static final String id = "SignupView";
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SignupViewBody());
  }
}
