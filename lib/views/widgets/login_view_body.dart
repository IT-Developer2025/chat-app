import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/email_password_validation.dart';
import 'package:chat_app/utils/form_validation.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:chat_app/views/widgets/custom_elevated_button.dart';
import 'package:chat_app/views/widgets/custom_navigation_link.dart';
import 'package:chat_app/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

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
                kAppBrandName,
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
                    "تسجيل الدخول",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 12,
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      hintText: "البريد الإلكتروني...",
                      validator: (_) {
                        return validatingEmail(email: _emailController.text);
                      },
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "كلمة المرور...",
                      validator: (_) {
                        return validatingPassword(
                          password: _passwordController.text,
                        );
                      },
                    ),
                    CustomElevatedButton(
                      buttonTitle: "تسجيل الدخول",
                      onPressed: () {
                        formValidation(
                          context,
                          formKey: _formKey,
                          snackBarMessage: "تسجيل الدخول",
                          routeName: SignupView.id,
                          emailController: _emailController,
                          passwordController: _passwordController,
                        );
                      },
                    ),
                    CustomNavigationLink(
                      title: "لا تمتلك حساب! قم بـ - ",
                      linkTitle: "إنشاء حساب",
                      onTap: () {
                        Navigator.popAndPushNamed(context, SignupView.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
