import 'package:flutter/foundation.dart';

// features/questions/domain/entities/question.dart

@immutable
class Question {
  final String id;
  final String text;
  final String answer;

  const Question({
    required this.id,
    required this.text,
    required this.answer,
  });

  Question get forExaminee => Question(
        id: id,
        text: text,
        answer: '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'answer': answer,
      };

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        text: json['text'],
        answer: json['answer'],
      );
} 