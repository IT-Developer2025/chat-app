import 'package:chat_app/views/widgets/custom_navigation_icon.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarBody extends StatelessWidget {
  const CustomBottomNavigationBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.rtl,
        spacing: 102,
        children: [
          CustomNavigationIcon(
            iconPath: "assets/icons/chat_icon_unselected.svg",
            title: "دردشات",
          ),
          CustomNavigationIcon(
            iconPath: "assets/icons/call_icon_unselected.svg",
            title: "المكالمات",
          ),
          CustomNavigationIcon(
            iconPath: "assets/icons/story_icon_unselected.svg",
            title: "القصص",
          ),
        ],
      ),
    );
  }
}
