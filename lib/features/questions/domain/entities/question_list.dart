// features/questions/domain/entities/question_list.dart

import 'package:grade_up/features/questions/domain/entities/question.dart';

class QuestionList {
  final String id;
  final List<Question> questions;
  final DateTime loadedAt;

  QuestionList({
    required this.id,
    required this.questions,
    required this.loadedAt,
  });

  static final Map<String, QuestionList> mockQuestionLists = {
    'ql_flutter': QuestionList(
      id: 'ql_flutter',
      questions: [
        Question(
          id: 'q_flutter_1',
          text: 'Что такое Widget в Flutter?',
          answer: 'Базовый элемент пользовательского интерфейса',
        ),
        Question(
          id: 'q_flutter_2',
          text: 'Назовите три основных типа виджетов',
          answer: 'StatelessWidget, StatefulWidget, InheritedWidget',
        ),
        Question(
          id: 'q_flutter_3',
          text: 'Как работает setState()?',
          answer: 'Помечает widget как "грязный" и запускает перестроение',
        ),
        Question(
          id: 'q_flutter_4',
          text: 'Что такое BuildContext?',
          answer: 'Ссылка на местоположение виджета в дереве',
        ),
      ],
      loadedAt: DateTime(2023, 5, 10),
    ),
    'ql_dart': QuestionList(
      id: 'ql_dart',
      questions: [
        Question(
          id: 'q_dart_1',
          text: 'Чем final отличается от const?',
          answer: 'final - runtime константа, const - compile-time константа',
        ),
        Question(
          id: 'q_dart_2',
          text: 'Как работает async/await?',
          answer: 'Превращает асинхронный код в последовательный',
        ),
        Question(
          id: 'q_dart_3',
          text: 'Что такое Stream?',
          answer: 'Последовательность асинхронных событий',
        ),
      ],
      loadedAt: DateTime(2023, 6, 15),
    ),
    'ql_firebase': QuestionList(
      id: 'ql_firebase',
      questions: [
        Question(
          id: 'q_firebase_1',
          text: 'Как работает Firestore?',
          answer: 'NoSQL база данных с документами и коллекциями',
        ),
        Question(
          id: 'q_firebase_2',
          text: 'Что такое Firebase Auth?',
          answer: 'Сервис аутентификации пользователей',
        ),
      ],
      loadedAt: DateTime(2023, 7, 20),
    ),
    'ql_ui': QuestionList(
      id: 'ql_ui',
      questions: [
        Question(
          id: 'q_ui_1',
          text: 'Что такое Material Design?',
          answer: 'Дизайн-система от Google',
        ),
        Question(
          id: 'q_ui_2',
          text: 'Как создать анимацию в Flutter?',
          answer: 'Через AnimationController и Tween',
        ),
      ],
      loadedAt: DateTime(2023, 8, 5),
    ),
  };
} 