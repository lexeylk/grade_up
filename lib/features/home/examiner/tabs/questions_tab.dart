import 'package:flutter/material.dart';
import 'package:grade_up/data/models/exam_model.dart';
import 'package:grade_up/features/questions/questions_screen.dart';

class QuestionsTab extends StatelessWidget {
  const QuestionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = Exam.mockExams;

    return Scaffold(
      appBar: AppBar(
        title: const Text('База вопросов'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearch(context),
          ),
        ],
      ),
      body: _buildContent(exams),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewExam(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContent(List<Exam> exams) {
    if (exams.isEmpty) {
      return const Center(
        child: Text('Нет созданных аттестаций'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: exams.length,
      itemBuilder: (context, index) {
        final exam = exams[index];

        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _openQuestionsScreen(context, exam),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          exam.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Chip(
                        label: Text(
                          '${exam.questionList.questions.length} вопросов',
                        ),
                      ),
                    ],
                  ),
                  if (exam.description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      exam.description!,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    'Создано: ${_formatDate(exam.createdAt)}',
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }

  void _openQuestionsScreen(BuildContext context, Exam exam) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuestionsScreen(
          exam: exam,
        ),
      ),
    );
  }

  void _showSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: _QuestionsSearchDelegate(),
    );
  }

  void _createNewExam(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Создание новой аттестации')),
    );
  }
}

class _QuestionsSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = Exam.mockExams.where((exam) {
      final searchLower = query.toLowerCase();
      return exam.title.toLowerCase().contains(searchLower) ||
          (exam.description?.toLowerCase().contains(searchLower) ?? false);
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final exam = results[index];
        return ListTile(
          title: Text(exam.title),
          subtitle: Text(exam.description ?? ''),
          onTap: () {
            close(context, exam.id);
            _openExamDetails(context, exam);
          },
        );
      },
    );
  }

  void _openExamDetails(BuildContext context, Exam exam) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuestionsScreen(
          exam: exam,
        ),
      ),
    );
  }
}