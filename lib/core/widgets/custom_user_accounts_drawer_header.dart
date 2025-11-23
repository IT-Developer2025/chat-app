import 'package:chat_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomUserAccountsDrawerHeader extends StatelessWidget {
  const CustomUserAccountsDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [kPrimaryColor, kSecondaryColor]),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.lightBlue,
        child: Image.asset(kLogo),
      ),
      accountName: Text("vscode895@gmail.com"),
      accountEmail: Text("vs code"),
    );
  }
}
