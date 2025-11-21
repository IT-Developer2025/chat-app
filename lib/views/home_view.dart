import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/contact_view.dart';
import 'package:chat_app/views/stories_view.dart';
import 'package:chat_app/views/widgets/custom_app_bar.dart';
import 'package:chat_app/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:chat_app/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static final String id = "HomeView";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final views = [const ChatView(), const StoriesView(), const ContactView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: CustomAppBar(),
      ),
      drawer: const CustomDrawer(),
      body: views[currentIndex],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomHomeBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
