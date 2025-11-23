import 'package:flutter/material.dart';

class CustomNavigationLink extends StatelessWidget {
  final String title;
  final String linkTitle;
  final VoidCallback onTap;
  const CustomNavigationLink({
    super.key,
    required this.title,
    required this.linkTitle,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.rtl,
      spacing: 4,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.lightBlue, Colors.deepPurpleAccent],
            ),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              linkTitle,
              style: TextStyle(
                color: Colors.white,
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
