import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/shimmer/recommendation_shimmer.dart';
import '../providers/onboarding_controller.dart';

class RecommendationPage extends ConsumerWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    final recommendation = state.recommendation;

    return Scaffold(
      appBar: AppBar(title: const Text('Your Pet Plan')),
      body: Builder(
        builder: (_) {
          if (state.isLoading) {
            return const RecommendationShimmer();
          }

          if (state.error != null) {
            return ErrorStateView(
              message: state.error!,
              onRetry: () =>
                  ref.read(onboardingControllerProvider.notifier).submit(),
            );
          }

          if (recommendation == null) {
            return const Center(child: Text('No recommendation available'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                recommendation.planName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),

              _infoCard(
                title: 'Daily Calories',
                value: '${recommendation.dailyKcal} kcal',
              ),

              _infoCard(
                title: 'Daily Portion',
                value: '${recommendation.dailyPortionGrams} g/day',
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: recommendation.proteins
                        .map((protein) => Chip(label: Text(protein)))
                        .toList(),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Recommended Products',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),

              ...recommendation.products.map(
                (product) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    trailing: Text('AED ${product.price.toStringAsFixed(0)}'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _infoCard({
    required String title,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}