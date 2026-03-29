import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statusneo_assign/features/onboarding/presentation/pages/recommendation_page.dart';
import 'package:statusneo_assign/features/onboarding/domain/entities/product_entity.dart';
import 'package:statusneo_assign/features/onboarding/domain/entities/recommendation_entity.dart';

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

  testWidgets('renders recommendation data correctly',
    (WidgetTester tester) async {
  const recommendation = RecommendationEntity(
    planName: 'Active Adult — Lamb Plan',
    dailyKcal: 874,
    dailyPortionGrams: 219,
    proteins: ['lamb', 'turkey'],
    products: [
      ProductEntity(
        id: '1',
        name: 'Lamb Bowl',
        description: 'Fresh lamb meal',
        price: 149,
        imageUrl: '',
      ),
    ],
  );

  await tester.pumpWidget(
    const MaterialApp(
      home: Scaffold(
        body: RecommendationContent(
          isLoading: false,
          isOffline: false,
          error: null,
          recommendation: recommendation,
        ),
      ),
    ),
  );

  await tester.pumpAndSettle();

  expect(find.text('Active Adult — Lamb Plan'), findsOneWidget);
  expect(find.text('874 kcal'), findsOneWidget);
  expect(find.text('219 g/day'), findsOneWidget);
  expect(find.text('Lamb Bowl'), findsOneWidget);
  expect(find.text('Fresh lamb meal'), findsOneWidget);
});
}