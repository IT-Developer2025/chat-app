import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/widgets/custom_list_tile.dart';
import 'package:chat_app/views/widgets/custom_user_accounts_drawer_header.dart';
import 'package:flutter/material.dart';

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomUserAccountsDrawerHeader(),
        CustomListTile(
          icon: Icons.home,
          title: 'الصفحة الرئيسية',
          onTap: () {},
        ),
        CustomListTile(icon: Icons.settings, title: 'الإعدادات', onTap: () {}),
        CustomListTile(
          icon: Icons.logout_rounded,
          title: 'تسجيل الخروج',
          onTap: () {
            Navigator.popAndPushNamed(context, LoginView.id);
          },
        ),
      ],
    );
  }
}
