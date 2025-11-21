import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? icon;
  final String title;
  final VoidCallback onTap;
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: icon,
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
