import 'package:chat_app/constants.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:flutter/material.dart';

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [kPrimaryColor, kSecondaryColor]),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.lightBlue,
            child: Image.asset(kLogo),
          ),
          accountName: Text("vscode895@gmail.com"),
          accountEmail: Text("vs code"),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'الصفحة الرئيسية',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'الإعدادات',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            'تسجيل الخروج',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, LoginView.id);
          },
        ),
      ],
    );
  }
}
