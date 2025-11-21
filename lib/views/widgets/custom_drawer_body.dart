import 'package:chat_app/constants.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/widgets/custom_list_tile.dart';
import 'package:chat_app/views/widgets/custom_user_accounts_drawer_header.dart';
import 'package:chat_app/views/widgets/custome_alert_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void firebaseLogoutProcess(BuildContext context) {
  try {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: "تسجيل الخروج",
          content: "هل حقًا تود تسجيل الخروج من تطبيق $kAppBrandName؟",
          bgColor: Colors.redAccent,
          firstButtonTitle: "نعم",
          firstOnPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.popAndPushNamed(context, LoginView.id);
          },
          secondButtonTitle: "لا",
          secondOnPressed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  } catch (e) {
    print("Error while trying signed-out! \n [$e]");
  }
}

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomUserAccountsDrawerHeader(),
        CustomListTile(
          icon: SvgPicture.asset(
            "assets/icons/outline/home-outline.svg",
            width: 24,
            height: 24,
          ),
          title: 'الصفحة الرئيسية',
          onTap: () {},
        ),
        CustomListTile(
          icon: SvgPicture.asset(
            "assets/icons/outline/settings-outline.svg",
            width: 24,
            height: 24,
          ),
          title: 'الإعدادات',
          onTap: () {},
        ),
        CustomListTile(
          icon: SvgPicture.asset(
            "assets/icons/outline/log-out-outline.svg",
            width: 24,
            height: 24,
          ),
          title: 'تسجيل الخروج',
          onTap: () {
            firebaseLogoutProcess(context);
          },
        ),
      ],
    );
  }
}
