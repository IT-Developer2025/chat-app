import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/email_password_validation.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/widgets/custom_elevated_button.dart';
import 'package:chat_app/views/widgets/custom_navigation_link.dart';
import 'package:chat_app/views/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthService _authService = AuthService();

  bool isLoading = false;

  @override
  void dispose() {
    // Disposing controllers after using them, for better performance!
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
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
          await _authService.signUp(
            email: _emailController.text,
            password: _passwordController.text,
          );
          _emailController.clear();
          _passwordController.clear();
          showSnackBar(
            context: context,
            message: "تم إنشاء حسابك بنجاح",
            backgroundColor: Colors.green,
          );
          if (mounted) {
            Navigator.popAndPushNamed(context, LoginView.id);
          }
        } on FirebaseAuthException catch (e) {
          String message;
          if (e.code == 'weak-password') {
            message = 'كلمة المرور المستخدمة ضعيفة جدًا';
          } else if (e.code == 'email-already-in-use') {
            message = 'هذا الحساب مستخدم بالفعل';
          } else if (e.code == "too-many-requests") {
            message = 'لقد استنفدت عدد المحاولات. ارجع في وقت لاحق';
          } else {
            message = 'حدث خطأ في المصادقة: ${e.message}';
          }
          showSnackBar(
            context: context,
            message: message,
            backgroundColor: Colors.redAccent,
          );
        } catch (e) {
          throw Exception("Error while [SIGNING-UP]! [$e]");
        } finally {
          if (mounted) {
            setState(() => isLoading = false);
          }
        }
      } // endIf
      else {
        showSnackBar(
          context: context,
          message: "الرجاء التحقق من صحة البيانات المدخلة",
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
                          buttonTitle: "إنشاء حساب",
                          onPressed: () async {
                            await _handleSignUp();
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
        ),
      ),
    );
  }
}
