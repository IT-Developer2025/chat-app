import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/core/utils/email_password_validation.dart';
import 'package:chat_app/core/utils/show_snack_bar.dart';
import 'package:chat_app/core/widgets/custom_elevated_button.dart';
import 'package:chat_app/core/widgets/custom_navigation_link.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:chat_app/features/auth/services/auth_service.dart';
import 'package:chat_app/features/auth/signup_view.dart';
import 'package:chat_app/features/home/home_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthService _authService = AuthService();

  bool isLoading = false;

  @override
  void dispose() {
    // Disposing controllers after using them, better for performance!
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      showSnackBar(
        context: context,
        message: 'تحقق من اتصالك بالإنترنت',
        backgroundColor: Colors.redAccent,
      );
    } // endIf
    else {
      if (_formKey.currentState!.validate()) {
        setState(() => isLoading = true);
        try {
          await _authService.login(
            email: _emailController.text,
            password: _passwordController.text,
          );
          _emailController.clear();
          _passwordController.clear();
          showSnackBar(
            context: context,
            message: 'تم تسجيل دخولك بنجاح',
            backgroundColor: Colors.green,
          );
          Navigator.pushNamed(context, HomeView.id);
        } on FirebaseAuthException catch (e) {
          String message;
          if (e.code == 'user-not-found') {
            message = 'هذا الحساب غير موجود ... يرجى إنشاء حساب جديد';
          } else if (e.code == 'wrong-password') {
            message = 'كلمة المرور خاطئة';
          } else if (e.code == "too-many-requests") {
            message = 'لقد استنفدت عدد المحاولات. ارجع في وقت لاحق';
          } else if (e.code == "user-disabled") {
            message = 'هذا الحساب معطل حاليًا';
          } else if (e.code == "invalid-credential") {
            message = 'البيانات المدخلة غير صحيحة';
          } else {
            message = 'حدث خطأ أثناء عملية تسجيل الدخول';
          }
          showSnackBar(
            context: context,
            message: message,
            backgroundColor: Colors.redAccent,
          );
        } catch (e) {
          throw Exception("Error while [LOGIN-IN]! [$e]");
        } finally {
          if (mounted) {
            setState(() => isLoading = false);
          }
        }
      } else {
        showSnackBar(
          context: context,
          message: "حدث خطأ أثناء محاولة تسجيل الدخول",
          backgroundColor: Colors.redAccent,
        );
      } // endIfElse
    } // endIfElse
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
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
                            return validatingEmail(
                              email: _emailController.text,
                            );
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
                            await _handleLogin(context);
                          },
                        ),
                        CustomNavigationLink(
                          title: "لا تمتلك حساب! قم بـ - ",
                          linkTitle: "إنشاء حساب",
                          onTap: () {
                            Navigator.pushNamed(context, SignupView.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
