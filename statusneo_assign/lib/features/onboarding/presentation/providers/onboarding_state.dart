import '../../domain/entities/recommendation_entity.dart';

class OnboardingState {
  final bool isLoading;
  final String? error;
  final RecommendationEntity? recommendation;

  const OnboardingState({
    this.isLoading = false,
    this.error,
    this.recommendation,
  });

  OnboardingState copyWith({
    bool? isLoading,
    String? error,
    RecommendationEntity? recommendation,
  }) {
    return OnboardingState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      recommendation: recommendation ?? this.recommendation,
    );
  }
}