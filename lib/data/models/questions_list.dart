// lib/data/models/question_list.dart

import 'package:grade_up/data/models/question_model.dart';

class QuestionList {
  final String id;
  final List<Question> questions;
  final DateTime loadedAt; // Когда вопросы загружены

  QuestionList({
    required this.id,
    required this.questions,
    required this.loadedAt,
  });

  // Загрузка из базы (заглушка)
  // static Future<QuestionList> loadForSession(String sessionId) async {
  //   final questions = await QuestionsRepository.getForSession(sessionId);
  //   return QuestionList(
  //     id: 'ql_$sessionId',
  //     sessionId: sessionId,
  //     questions: questions,
  //     loadedAt: DateTime.now(),
  //   );
  // }
}