import 'package:chat_app/helper/email_password_validation.dart';
import 'package:chat_app/utils/form_validation.dart';
import 'package:chat_app/views/widgets/custom_elevated_button.dart';
import 'package:chat_app/views/widgets/custom_navigation_link.dart';
import 'package:chat_app/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomAuthForm extends StatefulWidget {
  final String routeName;
  final String buttonTitle;
  final String title;
  final String linkTitle;
  final String snackBarMessage;
  const CustomAuthForm({
    super.key,
    required this.routeName,
    required this.title,
    required this.linkTitle,
    required this.buttonTitle,
    required this.snackBarMessage,
  });

  @override
  State<CustomAuthForm> createState() => _CustomAuthFormState();
}

class _CustomAuthFormState extends State<CustomAuthForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
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
              return validatingPassword(password: _passwordController.text);
            },
          ),
          CustomElevatedButton(
            buttonTitle: widget.buttonTitle,
            onPressed: () {
              formValidation(
                context,
                formKey: _formKey,
                snackBarMessage: widget.snackBarMessage,
                routeName: widget.routeName,
                emailController: _emailController,
                passwordController: _passwordController,
              );
            },
          ),
          CustomNavigationLink(
            title: widget.title,
            linkTitle: widget.linkTitle,
            onTap: () {
              Navigator.popAndPushNamed(context, widget.routeName);
            },
          ),
        ],
      ),
    );
  }
}
