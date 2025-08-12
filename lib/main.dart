import 'package:flutter/material.dart';
import 'package:grade_up/features/auth/auth_screen.dart';
import 'package:grade_up/features/home/home_screen.dart';

void main() {
  runApp(const GradeUpApp());
}

class GradeUpApp extends StatelessWidget {
  const GradeUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/auth', // Стартовый маршрут
      routes: {
        '/auth': (context) => AuthScreen(),
        '/home': (context) => HomeScreen(),
        
        // Другие маршруты...
      },
    );
  }
}