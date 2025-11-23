import 'package:chat_app/features/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/views/home_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:chat_app/features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute:  SplashView.id,
    );
  }
}
