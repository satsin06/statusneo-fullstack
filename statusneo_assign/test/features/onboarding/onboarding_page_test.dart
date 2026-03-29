import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statusneo_assign/features/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  testWidgets('shows validation errors when required fields are empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: OnboardingPage(),
        ),
      ),
    );

    await tester.tap(find.text('Get Recommendation'));
    await tester.pumpAndSettle();

    expect(find.text('Name is required'), findsOneWidget);
    expect(find.text('Breed is required'), findsOneWidget);
    expect(find.text('Age years is required'), findsOneWidget);
    expect(find.text('Age months is required'), findsOneWidget);
    expect(find.text('Weight is required'), findsOneWidget);
  });
}