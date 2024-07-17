import 'package:dogsanitize/slidder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyA7eCT6XIa5AQAoQSS0OXTKtOHYdDJwGJU',
        appId: '1:610475096848:android:68618a294a45a37e808395',
        messagingSenderId: '610475096848',
        projectId: 'dog-sanitize'),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: slidder(),
    );
  }
}
