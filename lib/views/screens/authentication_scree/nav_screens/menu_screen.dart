

import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/widgets/home_header_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen ({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeaderWidget(),
          ],
        ),
      ),
    );
  }}