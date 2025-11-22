import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;

  const CustomHomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, kSecondaryColor],
          ),
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon:
                  currentIndex == 0
                      ? SvgPicture.asset(
                        "assets/icons/filled/chatbubble.svg",
                        height: 25,
                        width: 25,
                        color: Colors.white,
                      )
                      : SvgPicture.asset(
                        "assets/icons/outline/chatbubble-outline.svg",
                        height: 25,
                        width: 25,
                        color: Colors.white,
                      ),
              label: "المحادثة",
              tooltip: "يوصلك إلى قسم المحادثات",
            ),
            BottomNavigationBarItem(
              icon:
                  currentIndex == 1
                      ? SvgPicture.asset(
                        "assets/icons/filled/phone-portrait.svg",
                        height: 25,
                        width: 25,
                        color: Colors.white,
                      )
                      : SvgPicture.asset(
                        "assets/icons/outline/phone-portrait-outline.svg",
                        height: 25,
                        width: 25,
                        color: Colors.white,
                      ),
              label: "الحالات",
            ),
            BottomNavigationBarItem(
              icon:
                  currentIndex == 2
                      ? SvgPicture.asset(
                        "assets/icons/filled/call.svg",
                        height: 25,
                        width: 25,
                        color: Colors.white,
                      )
                      : SvgPicture.asset(
                        "assets/icons/outline/call-outline.svg",
                        height: 25,
                        width: 25,
                        color: Colors.white,
                      ),
              label: "القصص",
            ),
          ],
        ),
      ),
    );
  }
}
