import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavigationIcon extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  const CustomNavigationIcon({
    super.key,
    required this.iconPath,
    required this.title, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SvgPicture.asset(iconPath),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
