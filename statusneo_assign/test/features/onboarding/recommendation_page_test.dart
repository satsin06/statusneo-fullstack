import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statusneo_assign/features/onboarding/presentation/pages/recommendation_page.dart';

void main() {
  testWidgets('shows empty state when no recommendation exists',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: RecommendationPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('No recommendation available'), findsOneWidget);
  });
}