import 'package:flutter/material.dart';
import 'package:project_1/screens/onboarding.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF6F6F6)),
        useMaterial3: true,
      ),
      home: OnboardingPage(),
    );
  }
}
