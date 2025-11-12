import 'package:chat_app/constants.dart';
import 'package:chat_app/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SecureChat());
}

class SecureChat extends StatelessWidget {
  const SecureChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Secure Chatting",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: kFontFamily),
      routes: {SplashView.id: (context) => SplashView()},
      initialRoute: SplashView.id,
    );
  }
}

// git commit -m "first commit"
// git push -u origin main