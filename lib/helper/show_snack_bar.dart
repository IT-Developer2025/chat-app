import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message, required Color backgroundColor,
}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.rtl,
          children: [
            Text(message),
            Icon(Icons.info, size: 26, color: Colors.white),
          ],
        ),
      ),
    ),
  );
}