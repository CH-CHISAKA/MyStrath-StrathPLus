import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> _bannerImage = [];
  final PageController _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    // Initialize the timer and start autoplay
    startTimer();
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
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  Stream<List<String>> getBannerUrls() {
    return _firestore.collection("Banners").snapshots().map((snapshot) {
      _bannerImage.clear();
      snapshot.docs.forEach((doc) {
        _bannerImage.add(doc['image'] as String);
      });
      return _bannerImage;
    });
  }
}
