import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/core/utils/show_snack_bar.dart';
import 'package:chat_app/core/widgets/custom_list_tile.dart';
import 'package:chat_app/core/widgets/custom_user_accounts_drawer_header.dart';
import 'package:chat_app/core/widgets/custome_alert_dialog.dart';
import 'package:chat_app/features/auth/login_view.dart';
import 'package:chat_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({super.key});

  Future<void> _handleLogout(BuildContext context) async {
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
              try {
                await AuthService().logout();
                showSnackBar(
                  context: context,
                  message: 'تم تسجيل الخروج بنجاح',
                  backgroundColor: Colors.green,
                );
                Navigator.popUntil(context, ModalRoute.withName(LoginView.id));
              } catch (e) {
                showSnackBar(
                  context: context,
                  message: 'حدث خطأ أثناء محاولة تسجيل الخروج',
                  backgroundColor: Colors.redAccent,
                );
              }
            },
            secondButtonTitle: "لا",
            secondOnPressed: () {
              Navigator.pop(context);
            },
          );
        },
      );
    } catch (e) {
      throw Exception("Error while trying signed-out! \n [$e]");
    }
  }

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
          onTap: () async {
            await _handleLogout(context);
          },
        ),
      ],
    );
  }
}
