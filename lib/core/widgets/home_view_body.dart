import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/contact_view.dart';
import 'package:chat_app/views/stories_view.dart';
import 'package:chat_app/views/widgets/custom_app_bar.dart';
import 'package:chat_app/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:chat_app/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;

  // using CONST keyword, for better performance!.
  final views = const [ChatView(), StoriesView(), ContactView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: const CustomAppBar(),
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
