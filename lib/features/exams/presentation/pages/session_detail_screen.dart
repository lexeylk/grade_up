import 'package:flutter/material.dart';

class SessionDetailScreen extends StatelessWidget {
  final String? sessionId;
  const SessionDetailScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детали сессии')),
      body: Center(
        child: Text('Сессия: ${sessionId ?? 'неизвестно'}'),
      ),
    );
  }
} 