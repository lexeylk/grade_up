// lib/data/models/exam_model.dart
import 'package:grade_up/data/models/questions_list.dart';


class Exam {
  final String id;
  final String title;
  final String? description;
  final DateTime createdAt;
  final QuestionList questionList;

  const Exam({
    required this.id,
    required this.title,
    this.description,
    required this.createdAt,
    required this.questionList,
  });

  // Моковые данные для примера
  static final List<Exam> mockExams = [
    Exam(
      id: 'exam_flutter',
      title: 'Flutter Basic Certification',
      description: 'Тестирование базовых знаний Flutter',
      questionList: QuestionList.mockQuestionLists['ql_flutter']!,
      createdAt: DateTime(2023, 5, 15),
    ),
    Exam(
      id: 'exam_dart',
      title: 'Dart Advanced Exam',
      description: 'Продвинутые вопросы по языку Dart',
      questionList: QuestionList.mockQuestionLists['ql_dart']!,
      createdAt: DateTime(2023, 6, 20),
    ),
    Exam(
      id: 'exam_firebase',
      title: 'Firebase Integration Test',
      description: 'Интеграция Flutter с Firebase',
      questionList: QuestionList.mockQuestionLists['ql_firebase']!,
      createdAt: DateTime(2023, 7, 25),
    ),
    Exam(
      id: 'exam_ui',
      title: 'UI/UX Design Principles',
      description: 'Основы дизайна пользовательских интерфейсов',
      questionList: QuestionList.mockQuestionLists['ql_ui']!,
      createdAt: DateTime(2023, 8, 10),
    ),
    Exam(
      id: 'exam_combo',
      title: 'Flutter + Firebase Combo',
      description: 'Комплексный экзамен по Flutter и Firebase',
      questionList: QuestionList.mockQuestionLists['ql_flutter']!,
      createdAt: DateTime(2023, 9, 1),
    ),
  ];
}