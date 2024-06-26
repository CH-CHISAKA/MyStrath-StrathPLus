import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> _bannerImage = [];
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  Future<void> getBanners() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection("Banners").get();
      setState(() {
        _bannerImage.addAll(
            querySnapshot.docs.map((doc) => doc['image'] as String).toList());
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
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < _bannerImage.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 25,
        height: 360,
        child: PageView.builder(
          controller: _pageController,
          itemCount: _bannerImage.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  _bannerImage[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
