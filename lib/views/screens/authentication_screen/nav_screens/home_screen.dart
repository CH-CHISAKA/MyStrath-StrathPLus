import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/entities/home_screen_entiities.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/banner_widget.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderWidget(),
                  BannerWidget(),
                ],
              ),
            ),
          ),
      
          SizedBox(
            height: 200, 
            child: HomeScreenEntities(),
          ),
        ],
      ),
    );
  }
}
