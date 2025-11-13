import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  const CustomElevatedButton({super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
