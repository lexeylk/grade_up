import 'package:flutter/material.dart';
import 'package:grade_up/features/home/examinee_home_screen.dart';
import 'package:grade_up/features/home/examiner_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Временная заглушка - позже замените на чтение из Cubit
    final isExaminer = ModalRoute.of(context)!.settings.arguments as bool? ?? false;
    
    return isExaminer 
        ? const ExaminerHomeScreen()
        : const ExamineeHomeScreen();
  }
}