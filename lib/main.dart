import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/views/home_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:chat_app/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      routes: {
        SplashView.id: (context) => SplashView(),
        LoginView.id: (context) => LoginView(),
        SignupView.id: (context) => SignupView(),
        HomeView.id: (context) => HomeView(),
      },
      initialRoute: SplashView.id,
    );
  }
}
