import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выбор роли')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: () => _enterAs(context, isExaminer: true),
              icon: const Icon(Icons.verified_user),
              label: const Text('Я экзаменатор'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _enterAs(context, isExaminer: false),
              icon: const Icon(Icons.school),
              label: const Text('Я экзаменуемый'),
            ),
          ],
        ),
      ),
    );
  }

  void _enterAs(BuildContext context, {required bool isExaminer}) {
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: isExaminer,
    );
  }
} 