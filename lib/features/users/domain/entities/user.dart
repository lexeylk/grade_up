import 'package:flutter/foundation.dart';

// features/users/domain/entities/user.dart

enum UserRole {
  examinee, // Экзаменуемый (по умолчанию)
  examiner, // Экзаменатор
  author, // Автор вопросов (будет позже)
  expert, // Эксперт (будет позже)
  admin, // Администратор
}

@immutable
class User {
  final String id;
  final String email;
  final String fullName;
  final UserRole role;
  final DateTime registeredAt;
  final String? assignedExaminerId; // Временное поле для связи

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    this.role = UserRole.examinee, // По умолчанию экзаменуемый
    required this.registeredAt,
    this.assignedExaminerId, // Новое поле
  });

  bool get isExaminee => role == UserRole.examinee;
  bool get isExaminer => role == UserRole.examiner;
  bool get isAuthor => role == UserRole.author;
  bool get isAdmin => role == UserRole.admin;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'fullName': fullName,
        'role': role.name,
        'registeredAt': registeredAt.toIso8601String(),
        'assignedExaminerId': assignedExaminerId,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      role: UserRole.values.byName(json['role']),
      registeredAt: DateTime.parse(json['registeredAt']),
      assignedExaminerId: json['assignedExaminerId'],
    );
  }

  User copyWith({
    String? email,
    String? fullName,
    UserRole? role,
    String? assignedExaminerId,
  }) {
    return User(
      id: id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      registeredAt: registeredAt,
      assignedExaminerId: assignedExaminerId ?? this.assignedExaminerId,
    );
  }

  static List<User> mockUsers = [
    User(
      id: 'e1',
      email: 'examiner1@company.com',
      fullName: 'Сергеев Алексей',
      role: UserRole.examiner,
      registeredAt: DateTime(2023, 1, 15),
    ),
    User(
      id: 'u1',
      email: 'ivanov@company.com',
      fullName: 'Иванов Иван',
      role: UserRole.examinee,
      registeredAt: DateTime(2023, 5, 10),
      assignedExaminerId: 'e1',
    ),
    User(
      id: 'u2',
      email: 'petrova@company.com',
      fullName: 'Петрова Анна',
      role: UserRole.examinee,
      registeredAt: DateTime(2023, 6, 15),
      assignedExaminerId: 'e1',
    ),
  ];
} 