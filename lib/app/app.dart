import 'package:flutter/material.dart';
import 'package:grade_up/app/router.dart';

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
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
} 