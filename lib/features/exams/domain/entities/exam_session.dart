// features/exams/domain/entities/exam_session.dart
import 'package:flutter/foundation.dart';

@immutable
class ExamSession {
  final String id;
  final String examinerId;
  final String examineeId;
  final DateTime scheduledAt;
  final List<String> questionIds;
  final ExamStatus status;

  const ExamSession({
    required this.id,
    required this.examinerId,
    required this.examineeId,
    required this.scheduledAt,
    required this.questionIds,
    this.status = ExamStatus.scheduled,
  });

  bool get isUpcoming => status == ExamStatus.scheduled && scheduledAt.isAfter(DateTime.now());
  bool get isPast => scheduledAt.isBefore(DateTime.now());

  ExamSession copyWith({
    String? id,
    String? examinerId,
    String? examineeId,
    DateTime? scheduledAt,
    List<String>? questionIds,
    ExamStatus? status,
  }) {
    return ExamSession(
      id: id ?? this.id,
      examinerId: examinerId ?? this.examinerId,
      examineeId: examineeId ?? this.examineeId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      questionIds: questionIds ?? this.questionIds,
      status: status ?? this.status,
    );
  }

  String get statusLabel {
    switch (status) {
      case ExamStatus.scheduled:
        return isUpcoming ? 'Запланирована' : 'Просрочена';
      case ExamStatus.inProgress:
        return 'В процессе';
      case ExamStatus.completed:
        return 'Завершена';
      case ExamStatus.cancelled:
        return 'Отменена';
    }
  }

  static List<ExamSession> mockSessions = [
    ExamSession(
      id: '1',
      examinerId: 'ex1',
      examineeId: 'u1',
      scheduledAt: DateTime.now().add(const Duration(days: 1)),
      questionIds: ['q1', 'q2'],
    ),
    ExamSession(
      id: '2',
      examinerId: 'ex1',
      examineeId: 'u2',
      scheduledAt: DateTime.now().subtract(const Duration(days: 1)),
      questionIds: ['q3'],
      status: ExamStatus.completed,
    ),
  ];
}

enum ExamStatus { scheduled, inProgress, completed, cancelled } 