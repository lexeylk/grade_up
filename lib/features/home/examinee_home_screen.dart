import 'package:flutter/material.dart';

class ExamineeHomeScreen extends StatelessWidget {
  const ExamineeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мои аттестации')),
      body: const Center(child: Text('Здесь список ваших тестов')),
    );
  }
}