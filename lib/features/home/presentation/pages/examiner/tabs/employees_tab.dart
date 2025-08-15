import 'package:flutter/material.dart';
import 'package:grade_up/features/users/domain/entities/user.dart';

class EmployeesTab extends StatelessWidget {
  final String currentExaminerId;

  const EmployeesTab({
    super.key,
    required this.currentExaminerId,
  });

  @override
  Widget build(BuildContext context) {
    final employees = User.mockUsers
        .where((user) => user.role == UserRole.examinee && user.assignedExaminerId == currentExaminerId)
        .toList();

    return Scaffold(
      body: _buildEmployeesList(employees),
    );
  }

  Widget _buildEmployeesList(List<User> employees) {
    if (employees.isEmpty) {
      return const Center(
        child: Text('Нет назначенных сотрудников'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(employee.fullName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(employee.email),
                const SizedBox(height: 4),
                Text(
                  'Зарегистрирован: ${_formatDate(employee.registeredAt)}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            onTap: () => _openEmployeeDetails(context, employee),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }

  void _openEmployeeDetails(BuildContext context, User employee) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(employee.fullName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${employee.email}'),
            Text('Роль: ${_roleName(employee.role)}'),
            Text('Дата регистрации: ${_formatDate(employee.registeredAt)}'),
          ],
        ),
      ),
    );
  }

  String _roleName(UserRole role) {
    return const {
      UserRole.examinee: 'Сотрудник',
      UserRole.examiner: 'Экзаменатор',
      UserRole.author: 'Автор',
      UserRole.admin: 'Администратор',
    }[role]!;
  }
} 