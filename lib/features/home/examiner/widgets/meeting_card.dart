import 'package:flutter/material.dart';
import 'package:grade_up/data/models/exam_session_model.dart';

class MeetingCard extends StatelessWidget {
  final ExamSession session;
  final Future<String> Function(String) getExamineeName;
  final VoidCallback onTap;

  const MeetingCard({
    super.key,
    required this.session,
    required this.getExamineeName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getExamineeName(session.examineeId),
      builder: (context, snapshot) {
        final examineeName = snapshot.data ?? 'Загрузка...';
        
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Аттестационная сессия',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Chip(
                        label: Text(session.statusLabel),
                        backgroundColor: _getStatusColor(session.status),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Сотрудник: $examineeName',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Дата: ${session.scheduledAt.day}.${session.scheduledAt.month}.${session.scheduledAt.year} '
                    '${session.scheduledAt.hour}:${session.scheduledAt.minute.toString().padLeft(2, '0')}',
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Вопросов: ${session.questionIds.length}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(ExamStatus status) {
    switch (status) {
      case ExamStatus.scheduled:
        return Colors.blue[100]!;
      case ExamStatus.inProgress:
        return Colors.orange[100]!;
      case ExamStatus.completed:
        return Colors.green[100]!;
      case ExamStatus.cancelled:
        return Colors.red[100]!;
    }
  }
}