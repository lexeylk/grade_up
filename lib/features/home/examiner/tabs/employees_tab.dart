import 'package:flutter/material.dart';

class EmployeesTab extends StatelessWidget {
  const EmployeesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Список сотрудников для аттестации',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}