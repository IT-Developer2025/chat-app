import 'package:chat_app/constants.dart';
import 'package:chat_app/views/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String firstButtonTitle;
  final String secondButtonTitle;
  final Color bgColor;
  final VoidCallback firstOnPressed;
  final VoidCallback secondOnPressed;
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.firstButtonTitle,
    required this.secondButtonTitle,
    required this.bgColor,
    required this.firstOnPressed,
    required this.secondOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, kSecondaryColor],
          ),
        ),
        child: AlertDialog(
          backgroundColor: bgColor,
          title: Text(title, style: TextStyle(color: Colors.white)),
          content: Text(content, style: TextStyle(color: Colors.white)),
          actions: [
            CustomElevatedButton(buttonTitle: "نعم", onPressed: firstOnPressed),
            CustomElevatedButton(buttonTitle: "لا", onPressed: secondOnPressed),
          ],
        ),
      ),
    );
  }
}
