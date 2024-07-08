import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> _bannerImage = [];
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    getBanners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> getBanners() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection("Banners").get();
      setState(() {
        _bannerImage = querySnapshot.docs.map((doc) => doc['image'] as String).toList();
        if (_bannerImage.isNotEmpty) {
          startTimer();
        }
      });
    } catch (e) {
      // Handle errors if necessary
      print(e);
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        if (_currentPage < _bannerImage.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 25,
        height: 370,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _bannerImage.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0), 
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: _bannerImage[index],
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _bannerImage.length,
                  (index) {
                    // Define the base size and factor for the active state
                    double baseSize = 8.5;
                    double activeSize = 12.5;

                    // Calculate the size based on active state
                    double size = _currentPage == index ? activeSize : baseSize;

                    // Calculate margin to maintain spacing between circles
                    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 4.0);

                    // Adjust margin slightly for the active circle
                    if (_currentPage == index) {
                      margin = const EdgeInsets.symmetric(horizontal: 4.0);
                    }

                    return Container(
                      width: size,
                      height: size,
                      margin: margin,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? const Color(0xFF3A5DAE)
                            : const Color.fromARGB(255, 219, 219, 219),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
