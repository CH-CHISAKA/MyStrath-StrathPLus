import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystrath_strathplus/controllers/category_controller.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/main_screen.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/signin_screen_business.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyStrath App',
      // theme: lightTheme, // Set light theme here
      darkTheme: darkTheme, // Set dark theme here
      themeMode: ThemeMode.dark, // Use system theme mode (light or dark)
      home: const MainScreen(title: 'MyStrath App'),
    );

  }
}

// Define the dark theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.black,
);

// Define the light theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
);
