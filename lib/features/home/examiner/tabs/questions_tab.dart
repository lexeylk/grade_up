import 'package:flutter/material.dart';

class QuestionsTab extends StatelessWidget {
  const QuestionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('База вопросов для аттестаций',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}