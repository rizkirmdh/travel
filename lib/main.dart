import 'package:flutter/material.dart';
import 'package:travel/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const WelcomePage(),
    );
  }
}
