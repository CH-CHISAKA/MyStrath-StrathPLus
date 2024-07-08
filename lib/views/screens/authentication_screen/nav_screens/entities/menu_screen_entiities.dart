import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/entities_implementation/strathplus_entity_implementation.dart';

class MenuScreenEntities extends StatefulWidget {
  const MenuScreenEntities({super.key});

  @override
  MenuScreenEntitiesState createState() => MenuScreenEntitiesState();
}

class MenuScreenEntitiesState extends State<MenuScreenEntities> {
  final List<String> entitiesList = [
    'Profile',
    'Fees',
    'Coursework',
    'Library',
    'Attendance',
    'StrathPLus',
    'Strath Map',
    'Strath Connect',
    'Mentoring',
    'Events',
    'News',
    'Printer Status',
    'Timetable',
  ];

  void navigateToEntity(String entity) {
    if (entity == 'StrathPLus') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StrathPLusImplementation(),
        ),
      );
    }
    // Add more conditions here if you want to navigate to different screens for other entities
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Menu",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2), 
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              itemCount: entitiesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0, // Adjusted aspect ratio for square cells
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
              ),
              itemBuilder: (context, index) {
                String assetPath = "assets/icons/menu_page/${entitiesList[index]}.png";
                return InkWell(
                  onTap: () => navigateToEntity(entitiesList[index]),
                  borderRadius: BorderRadius.circular(150),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            assetPath,
                            width: 43, // Adjust image width as needed
                            height: 43, // Adjust image height as needed
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error); // Placeholder for error handling
                            },
                          ),
                        ),
                        const SizedBox(height: 1.5),
                        Text(
                          entitiesList[index],
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
