import 'package:flutter/material.dart';
import 'package:salah/bottom_navigation.dart';
import 'package:salah/core/app_colors.dart';

Future<void> main() async => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estaly',
      theme: AppTheme.lightTheme,
      home: EnhancedBottomNavigation(),
    );
  }
}
