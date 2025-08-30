import 'package:flutter/material.dart';
import 'funeral_matching_1.dart';
import 'funeral_matching_2.dart'; // LocationSelectionScreen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 공통 색상(피그마 기준)
  static const primary = Color(0xFFD2691E);
  static const bg = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welldying',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'NotoSans',
        colorScheme: ColorScheme.fromSeed(seedColor: primary, primary: primary),
        scaffoldBackgroundColor: bg,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      initialRoute: '/fm/intro',
      routes: {
        '/fm/intro': (_) => const StoreRegistrationScreen(),
        '/fm/location': (_) => const LocationSelectionScreen(),
      },
    );
  }
}
