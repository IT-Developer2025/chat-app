import 'package:chat_app/constants.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:chat_app/views/widgets/custom_elevated_button.dart';
import 'package:chat_app/views/widgets/custom_navigation_link.dart';
import 'package:chat_app/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kPrimaryColor, kSecondaryColor],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Image.asset(kLogo, width: 75, height: 75),
              const Text(
                "يمن تشات",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 64),
              const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "تسجيل الدخول", // Will be changed
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const CustomTextField(hintText: "البريد الإلكتروني..."),
              const CustomTextField(hintText: "كلمة المرور..."),
              const CustomElevatedButton(buttonTitle: "تسجيل الدخول"),
              CustomNavigationLink(
                title: "لا تمتلك حساب! قم بـ -",
                linkTitle: "إنشاء حساب",
                onTap: () {
                  Navigator.pushNamed(context, SignupView.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
