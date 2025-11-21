import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/email_password_validation.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/widgets/custom_elevated_button.dart';
import 'package:chat_app/views/widgets/custom_navigation_link.dart';
import 'package:chat_app/views/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> firebaseSignUpProcess(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    emailController.clear();
    passwordController.clear();
    showSnackBar(
      context: context,
      message: "تم إنشاء حسابك بنجاح",
      backgroundColor: Colors.green,
    );
    Navigator.popAndPushNamed(context, LoginView.id);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnackBar(
        context: context,
        message: 'كلمة المرور المستخدمة ضعيفة جدًا',
        backgroundColor: Colors.redAccent,
      );
    } else if (e.code == 'email-already-in-use') {
      showSnackBar(
        context: context,
        message: 'هذا الحساب مستخدم بالفعل',
        backgroundColor: Colors.redAccent,
      );
    }
  } catch (e) {
    throw Exception("$e");
  }
}

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
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
                    "إنشاء حساب جديد",
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
                      keyboardType: TextInputType.emailAddress,
                      hintText: "البريد الإلكتروني...",
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
                      buttonTitle: "إنشاء حساب",
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            await firebaseSignUpProcess(
                              context,
                              emailController: _emailController,
                              passwordController: _passwordController,
                            );
                          } else {
                            showSnackBar(
                              context: context,
                              message: "حدث خطأ أثناء محاولة إنشاء حساب",
                              backgroundColor: Colors.redAccent,
                            );
                          }
                        } catch (e) {
                          throw Exception("Error while [SIGNING-UP]! [$e]");
                        }
                      },
                    ),
                    CustomNavigationLink(
                      title: "هل لديك حساب بالفعل! قم بـ - ",
                      linkTitle: "تسجيل الدخول",
                      onTap: () {
                        Navigator.popAndPushNamed(context, LoginView.id);
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
