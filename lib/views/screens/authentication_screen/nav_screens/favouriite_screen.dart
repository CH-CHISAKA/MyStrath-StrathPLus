import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/entities/favourite_screen_entities.dart';
// import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/entities_implementation/strathplus_entity_implementation.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/widgets/favourite_header_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          FavouriteHeaderWidget(),
          Expanded(
            child: FavouriteEntities(),
          ),
        ],
      ),
    );
  }
}
