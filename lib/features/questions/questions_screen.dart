import 'package:flutter/material.dart';
import 'package:grade_up/data/models/exam_model.dart';
import 'package:grade_up/data/models/questions_list.dart';
import 'package:grade_up/data/models/question_model.dart';

class QuestionsScreen extends StatelessWidget {
  final Exam exam;
  final QuestionList questionList;

  const QuestionsScreen({
    super.key,
    required this.exam,
    required this.questionList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.title),
      ),
      body: _buildQuestionList(),
    );
  }

  Widget _buildQuestionList() {
    if (questionList.questions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'В этой аттестации пока нет вопросов',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: questionList.questions.length,
      itemBuilder: (context, index) => _buildQuestionCard(questionList.questions[index]),
    );
  }

  Widget _buildQuestionCard(Question question) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(
          question.text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ответ:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(question.answer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}