import 'package:flutter/material.dart';

class FavouriteEntities extends StatelessWidget {
  const FavouriteEntities({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 15),
            child: Text(
              "My Favourites",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15), // Added padding to grid
              shrinkWrap: true,
              itemCount: 6, // Number of static items
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0, // Adjusted aspect ratio for square cells
                mainAxisSpacing: 10, // Reduced main axis spacing
                crossAxisSpacing: 10, // Reduced cross axis spacing
              ),
              itemBuilder: (context, index) {
                String assetPath;
                switch (index) {
                  case 0:
                    assetPath = "assets/icons/favourite_page/Profile.png";
                    break;
                  case 1:
                    assetPath = "assets/icons/favourite_page/Fees.png";
                    break;
                  case 2:
                    assetPath = "assets/icons/favourite_page/Coursework.png";
                    break;
                  case 3:
                    assetPath = "assets/icons/favourite_page/Attendance.png";
                    break;
                  case 4:
                    assetPath = "assets/icons/favourite_page/StrathPLus.png";
                    break;
                  case 5:
                    assetPath = "assets/icons/favourite_page/Strath Map.png";
                    break;
                  default:
                    assetPath = ""; // Handle default case if needed
                }
                return InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Image.asset(
                          assetPath,
                          width: 80, // Adjust image width as needed
                          height: 80, // Adjust image height as needed
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error); // Placeholder for error handling
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        // Display static labels corresponding to each image
                        index == 0 ? 'Profile' :
                        index == 1 ? 'Fees' :
                        index == 2 ? 'Coursework' :
                        index == 3 ? 'Attendance' :
                        index == 4 ? 'StrathPLus' : 'Strath Map',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
