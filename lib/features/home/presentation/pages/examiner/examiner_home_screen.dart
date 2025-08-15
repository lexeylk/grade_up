import 'package:flutter/material.dart';
import 'tabs/meetings_tab.dart';
import 'tabs/questions_tab.dart';
import 'tabs/employees_tab.dart';

class ExaminerHomeScreen extends StatefulWidget {
  const ExaminerHomeScreen({super.key});

  @override
  State<ExaminerHomeScreen> createState() => _ExaminerHomeScreenState();
}

class _ExaminerHomeScreenState extends State<ExaminerHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Панель экзаменатора'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: 'Встречи', icon: Icon(Icons.calendar_today)),
            Tab(text: 'Вопросы', icon: Icon(Icons.quiz)),
            Tab(text: 'Сотрудники', icon: Icon(Icons.people)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MeetingsTab(),
          QuestionsTab(),
          EmployeesTab(
            currentExaminerId: 'e1',
          ),
        ],
      ),
    );
  }
} 