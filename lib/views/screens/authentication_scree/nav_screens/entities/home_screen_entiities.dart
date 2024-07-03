import 'package:flutter/material.dart';

class HomeScreenEntities extends StatefulWidget {
  const HomeScreenEntities({super.key});

  @override
  HomeScreenEntitiesState createState() => HomeScreenEntitiesState();
}

class HomeScreenEntitiesState extends State<HomeScreenEntities> {
  final List<String> entitiesList = [
    'Profile',
    'Fees',
    'Coursework',
    'Library',
    'Attendance',
    'StrathPlus',
    'Strath Map',
    'Strath Connect',
    'Mentoring',
    'Events',
    'News',
    'Printer Status',
    'Timetable',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Menu",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  itemCount: entitiesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0, // Adjusted aspect ratio for square cells
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    String assetPath = "assets/icons/menu_page/${entitiesList[index]}.png";
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color(0xFFF5F3FF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
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
                              entitiesList[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
