import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(kLogo, width: 100, height: 100),
          Text(kAppBrandName),
        ],
      ),
    );
  }
}
