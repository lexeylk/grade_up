// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grade_up/app/app.dart';

void main() {
  testWidgets('Переход с экрана выбора роли к панели экзаменатора', (WidgetTester tester) async {
    await tester.pumpWidget(const GradeUpApp());

    expect(find.text('Выбор роли'), findsOneWidget);
    expect(find.text('Я экзаменатор'), findsOneWidget);

    await tester.tap(find.text('Я экзаменатор'));
    await tester.pumpAndSettle();

    expect(find.text('Панель экзаменатора'), findsOneWidget);
  });
}
