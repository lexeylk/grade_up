import 'package:flutter/foundation.dart';

// lib/data/models/user_model.dart
enum UserRole {
  examinee,    // Экзаменуемый (по умолчанию)
  examiner,    // Экзаменатор
  author,      // Автор вопросов (будет позже)
  expert,      // Эксперт (будет позже)
  admin,       // Администратор
}

@immutable
class User {
  final String id;
  final String email;
  final String fullName;
  final UserRole role;
  final DateTime registeredAt;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    this.role = UserRole.examinee, // По умолчанию экзаменуемый
    required this.registeredAt,
  });

  // Удобные геттеры
  bool get isExaminee => role == UserRole.examinee;
  bool get isExaminer => role == UserRole.examiner;
  bool get isAuthor => role == UserRole.author;
  bool get isAdmin => role == UserRole.admin;

  // Сериализация
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'fullName': fullName,
    'role': role.name,
    'registeredAt': registeredAt.toIso8601String(),
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      role: UserRole.values.byName(json['role']),
      registeredAt: DateTime.parse(json['registeredAt']),
    );
  }

  // Для обновления данных
  User copyWith({
    String? email,
    String? fullName,
    UserRole? role,
    String? avatarUrl,
  }) {
    return User(
      id: id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      registeredAt: registeredAt,
    );
  }
}