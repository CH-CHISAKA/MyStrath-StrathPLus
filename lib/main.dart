import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyC67-V5zR2iXbS2_Pdfml-9zZBtVXEMKl0',
        appId: '1:433766465974:ios:d2a905c50c9409108e4117',
        messagingSenderId: '433766465974',
        projectId: 'mystrath-strathplus',
        storageBucket: 'gs://mystrath-strathplus.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  // Run the app
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
