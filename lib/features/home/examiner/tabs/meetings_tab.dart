import 'package:flutter/material.dart';
import 'package:grade_up/data/models/exam_session_model.dart';
import 'package:grade_up/features/home/examiner/widgets/meeting_card.dart';

class MeetingsTab extends StatefulWidget {
  const MeetingsTab({super.key});

  @override
  State<MeetingsTab> createState() => _MeetingsTabState();
}

class _MeetingsTabState extends State<MeetingsTab> {
  late List<ExamSession> _sessions;

  @override
  void initState() {
    super.initState();
    _sessions = ExamSession.mockSessions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: _sessions.length,
        separatorBuilder: (_, __) => SizedBox(height: 8),
        itemBuilder: (context, index) {
          final session = _sessions[index];
          return MeetingCard(
            session: session,
            getExamineeName: (id) => _getUserName(id), // Реализуйте получение имени
            onTap: () => _openSessionDetails(context, session),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewSession(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<String> _getUserName(String userId) async {
    // Заглушка - реализуйте получение имени из репозитория
    return {'usr1': 'Иванов Иван', 'usr2': 'Петрова Анна'}[userId] ?? 'Неизвестный';
  }

  void _openSessionDetails(BuildContext context, ExamSession session) {
    Navigator.pushNamed(
      context,
      '/session_detail',
      arguments: session.id,
    );
  }

  void _createNewSession(BuildContext context) {
    // Позже реализуем
  }
}