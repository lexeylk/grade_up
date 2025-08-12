import 'package:flutter/material.dart';

class ExaminerHomeScreen extends StatelessWidget {
  const ExaminerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Панель экзаменатора')),
      body: const Center(child: Text('Здесь будет список аттестаций')),
    );
  }
}