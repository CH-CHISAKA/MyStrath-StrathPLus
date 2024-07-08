import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

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
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              getGreeting(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
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
        
        ],
      ),
    );
  }
}
