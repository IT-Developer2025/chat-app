import 'package:chat_app/constants.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/widgets/custom_auth_form.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

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
                    "إنشاء حساب جديد", // Will be changed
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CustomAuthForm(
                routeName: LoginView.id,
                buttonTitle: "إنشاء حساب",
                title: "هل لديك حساب بالفعل! قم بـ - ",
                linkTitle: "تسجيل الدخول",
                snackBarMessage: "إنشاء حساب جديد",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
