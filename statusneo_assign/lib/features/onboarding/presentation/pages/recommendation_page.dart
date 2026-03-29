import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/no_connection_view.dart';
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
      body: RecommendationContent(
        isLoading: state.isLoading,
        isOffline: state.isOffline,
        error: state.error,
        recommendation: recommendation,
        onRetry: () => ref.read(onboardingControllerProvider.notifier).submit(),
      ),
    );
  }

  // Widget _infoCard({required String title, required String value}) {
  //   return Card(
  //     margin: const EdgeInsets.only(bottom: 12),
  //     child: ListTile(title: Text(title), subtitle: Text(value)),
  //   );
  // }
}

class RecommendationContent extends StatelessWidget {
  final bool isLoading;
  final bool isOffline;
  final String? error;
  final dynamic recommendation;
  final VoidCallback? onRetry;

  const RecommendationContent({
    super.key,
    required this.isLoading,
    required this.isOffline,
    required this.error,
    required this.recommendation,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const RecommendationShimmer();
    }

    if (isOffline) {
      return NoConnectionView(onRetry: onRetry ?? () {});
    }

    if (error != null) {
      return ErrorStateView(message: error!, onRetry: onRetry);
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
                  .map<Widget>((protein) => Chip(label: Text(protein)))
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

        ...recommendation.products.map<Widget>(
          (product) => Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
              ),
              title: Text(product.name),
              subtitle: Text(product.description),
              trailing: Text('AED ${product.price.toStringAsFixed(0)}'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoCard({required String title, required String value}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(title: Text(title), subtitle: Text(value)),
    );
  }
}
