import 'package:flutter/material.dart';
import 'package:chat_app/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static final String id = "HomeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}
