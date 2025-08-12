import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _enterAs(context, isExaminer: true),
              child: Text('Я экзаменатор'),
            ),
            ElevatedButton(
              onPressed: () => _enterAs(context, isExaminer: false),
              child: Text('Я экзаменуемый'),
            ),
          ],
        ),
      ),
    );
  }

  void _enterAs(BuildContext context, {required bool isExaminer}) {
    // Сохраняем роль и переходим на главный экран
    // context.read<AuthCubit>().setRole(isExaminer);
    Navigator.pushReplacementNamed(
      context, 
      '/home',
      arguments: isExaminer);
  }
}