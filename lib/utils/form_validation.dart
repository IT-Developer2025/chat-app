import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/home_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:flutter/material.dart';

void formValidation(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required String snackBarMessage,
  required String routeName,
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  try {
    if (formKey.currentState!.validate()) {
      showSnackBar(
        context: context,
        message: "تم $snackBarMessage بنجاح",
        backgroundColor: Colors.green,
      );

      /// [routeName] is name of the destination that you'll be redirected
      /// to it if you press the link in the below of both screens [LoginView]
      /// or [SignupView], So if the current screen is the [LoginView] the
      /// [routeName] is equal to "SignupView" and if the current screen is
      /// [SignupView] so the [routeName] will be equal to "LoginView".
      if (routeName == "SignupView") {
        Navigator.popAndPushNamed(context, HomeView.id);
      } else {
        Navigator.popAndPushNamed(context, LoginView.id);
      }
      emailController.clear();
      passwordController.clear();
    } else {
      showSnackBar(
        context: context,
        message: "حدث خطأ أثناء $snackBarMessage",
        backgroundColor: Colors.redAccent,
      );
    }
  } catch (e) {
    throw Exception("Login faild!");
  }
}
