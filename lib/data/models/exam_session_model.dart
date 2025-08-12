// lib/data/models/exam_session_model.dart
import 'package:flutter/foundation.dart';

@immutable
class ExamSession {
  final String id;
  final String examinerId; // ID экзаменатора
  final String examineeId; // ID экзаменуемого
  final DateTime scheduledAt; // Дата и время встречи
  final List<String> questionIds; // Вопросы ДЛЯ ЭТОЙ встречи
  final ExamStatus status; // Статус встречи

  const ExamSession({
    required this.id,
    required this.examinerId,
    required this.examineeId,
    required this.scheduledAt,
    required this.questionIds,
    this.status = ExamStatus.scheduled,
  });

  // Методы toJson/fromJson, copyWith...
}

enum ExamStatus {
  scheduled, // Назначена
  inProgress, // В процессе
  completed,  // Завершена
  cancelled,  // Отменена
}