// ignore_for_file: unused_import

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/main_screen.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/signin_screen.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/signin_screen_business.dart';
// import 'package:mystrath_strathplus/views/screens/authentication_scree/.gitignoresplash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyC67-V5zR2iXbS2_Pdfml-9zZBtVXEMKl0', 
        appId: '1:433766465974:ios:d2a905c50c9409108e4117', 
        messagingSenderId: '433766465974', 
        projectId: 'mystrath-strathplus',
        storageBucket: 'gs://mystrath-strathplus.appspot.com'
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyStrath App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home:  const MainScreen(), 
    );
  }
}
