import 'package:flutter/material.dart';
import 'package:grade_up/features/auth/presentation/pages/auth_screen.dart';
import 'package:grade_up/features/home/presentation/pages/home_screen.dart';
import 'package:grade_up/features/exams/presentation/pages/session_detail_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    '/auth': (context) => const AuthScreen(),
    '/home': (context) => const HomeScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/session_detail') {
      final sessionId = settings.arguments as String?;
      return MaterialPageRoute(
        builder: (_) => SessionDetailScreen(sessionId: sessionId),
      );
    }
    return null;
  }
} 