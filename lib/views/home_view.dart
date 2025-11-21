import 'package:chat_app/views/widgets/custom_app_bar.dart';
import 'package:chat_app/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:chat_app/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static final String id = "HomeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: CustomAppBar(),
      ),
      drawer: const CustomDrawer(),
      body: const HomeViewBody(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
