import 'package:flutter/material.dart';
import 'package:grade_up/features/home/presentation/pages/examinee_home_screen.dart';
import 'package:grade_up/features/home/presentation/pages/examiner/examiner_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isExaminer = ModalRoute.of(context)!.settings.arguments as bool? ?? false;
    return isExaminer ? const ExaminerHomeScreen() : const ExamineeHomeScreen();
  }
} 