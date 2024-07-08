import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/entities/menu_screen_entiities.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/menu_header_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          MenuHeaderWidget(),
          Expanded(
            child: MenuScreenEntities(),
          ),
       
        ],
      ),
    );
  }
}
