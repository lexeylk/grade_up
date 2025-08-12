// lib/data/models/question_model.dart
import 'package:flutter/foundation.dart';

@immutable
class Question {
  final String id;       // Уникальный идентификатор
  final String text;     // Текст вопроса
  final String answer;   // Текст ответа (виден только экзаменатору)

  const Question({
    required this.id,
    required this.text,
    required this.answer,
  });

  // Для экзаменуемого (без ответа)
  Question get forExaminee => Question(
    id: id,
    text: text,
    answer: '', // Скрываем ответ
  );

  // Сериализация в JSON (для бэкенда)
  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'answer': answer,
  };

  // Десериализация из JSON
  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json['id'],
    text: json['text'],
    answer: json['answer'],
  );
}