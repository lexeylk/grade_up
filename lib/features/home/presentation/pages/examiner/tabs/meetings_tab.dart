import 'package:flutter/material.dart';
import 'package:grade_up/features/exams/domain/entities/exam_session.dart';
import 'package:grade_up/features/users/domain/entities/user.dart';
import 'package:grade_up/features/home/presentation/pages/examiner/widgets/meeting_card.dart';

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
        padding: const EdgeInsets.all(16),
        itemCount: _sessions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final session = _sessions[index];
          return MeetingCard(
            session: session,
            getExamineeName: (id) => _getUserName(id),
            onTap: () => _openSessionDetails(context, session),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewSession(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<String> _getUserName(String userId) async {
    final user = User.mockUsers.firstWhere(
      (u) => u.id == userId,
      orElse: () => User(
        id: 'unknown',
        email: 'unknown@company.com',
        fullName: 'Неизвестный пользователь',
        registeredAt: DateTime(1970, 1, 1),
      ),
    );
    return user.fullName;
  }

  void _openSessionDetails(BuildContext context, ExamSession session) {
    Navigator.pushNamed(
      context,
      '/session_detail',
      arguments: session.id,
    );
  }

  void _createNewSession(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Создание новой сессии')),
    );
  }
} 