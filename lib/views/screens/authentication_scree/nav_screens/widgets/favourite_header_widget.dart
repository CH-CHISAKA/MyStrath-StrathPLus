
import 'package:flutter/material.dart';

class FavouriteHeaderWidget extends StatelessWidget {  
  const FavouriteHeaderWidget({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
       width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 30,
            child: Text(
              'Favourites',
              style:TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
              
            ),
          ),


          // Notification
          Positioned(
            left: 300,
            top: 72,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  // Handle onTap event
                },
                borderRadius: BorderRadius.circular(
                    15), 
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, 
                    image: DecorationImage(
                      image: AssetImage('assets/icons/bell.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),


           // DM
          Positioned(
            left: 345,
            top: 72,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  // Handle onTap event
                },
                borderRadius: BorderRadius.circular(
                    15), 
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/dm2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        
          ]
      ),
    );
  }
}
