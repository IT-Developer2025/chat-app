import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/email_password_validation.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/home_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:chat_app/views/widgets/custom_elevated_button.dart';
import 'package:chat_app/views/widgets/custom_navigation_link.dart';
import 'package:chat_app/views/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> firebaseLoginProcess(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    emailController.clear();
    passwordController.clear();
    showSnackBar(
      context: context,
      message: "تم تسجيل دخول بنجاح",
      backgroundColor: Colors.green,
    );
    Navigator.popAndPushNamed(context, HomeView.id);
  } on FirebaseAuthException catch (e) {
    print("############## FirebaseAuthException ##############");

    if (e.code == 'user-not-found') {
      showSnackBar(
        context: context,
        message: 'هذا الحساب غير موجود ... يرجى إنشاء حساب جديد',
        backgroundColor: Colors.redAccent,
      );
    } else if (e.code == 'wrong-password') {
      showSnackBar(
        context: context,
        message: 'كلمة المرور خاطئة',
        backgroundColor: Colors.redAccent,
      );
    } else if (e.code == "user-disabled") {
      showSnackBar(
        context: context,
        message: 'هذا الحساب معطل حاليًا',
        backgroundColor: Colors.redAccent,
      );
    } else if (e.code == "invalid-credential") {
      showSnackBar(
        context: context,
        message: 'البيانات المدخلة غير صحيحة',
        backgroundColor: Colors.redAccent,
      );
    }
  } catch (e) {
    throw Exception("$e");
  }
}

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
                      keyboardType: TextInputType.emailAddress,
                      validator: (_) {
                        return validatingEmail(email: _emailController.text);
                      },
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "كلمة المرور...",
                      isObsecure: true,
                      validator: (_) {
                        return validatingPassword(
                          password: _passwordController.text,
                        );
                      },
                    ),
                    CustomElevatedButton(
                      buttonTitle: "تسجيل الدخول",
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            await firebaseLoginProcess(
                              context,
                              emailController: _emailController,
                              passwordController: _passwordController,
                            );
                          } else {
                            showSnackBar(
                              context: context,
                              message: "حدث خطأ أثناء محاولة تسجيل الدخول",
                              backgroundColor: Colors.redAccent,
                            );
                          }
                        } catch (e) {
                          throw Exception("Error while [LOGIN-IN]! [$e]");
                        }
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
