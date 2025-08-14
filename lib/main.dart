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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/session_detail') {
          final sessionId = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (_) => _SessionDetailScreen(sessionId: sessionId),
          );
        }
        return null;
      },
    );
  }
}

class _SessionDetailScreen extends StatelessWidget {
  final String? sessionId;
  const _SessionDetailScreen({required this.sessionId});

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