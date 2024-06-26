import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/widgets/favourite_header_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          FavouriteHeaderWidget(),

          SizedBox(
            height: 20,
          ),
          
          Center(
            child: Text(
              'Welcome Favourite',
            ),
          ),
        ],
      ),
    ));
  }
}
