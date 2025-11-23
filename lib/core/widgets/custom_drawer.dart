import 'package:chat_app/views/widgets/custom_drawer_body.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: const CustomDrawerBody());
  }
}
