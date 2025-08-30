import 'package:flutter/material.dart';
import 'funeral_matching_1.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welldying',
      debugShowCheckedModeBanner: false,
      home: const StoreRegistrationScreen(), // 1번 화면 실행
    );
  }
}
