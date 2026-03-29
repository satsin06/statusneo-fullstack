import '../../domain/entities/recommendation_entity.dart';

class OnboardingState {
  final bool isLoading;
  final String? error;
  final bool isOffline;
  final RecommendationEntity? recommendation;

  const OnboardingState({
    this.isLoading = false,
    this.error,
    this.isOffline = false,
    this.recommendation,
  });

  OnboardingState copyWith({
    bool? isLoading,
    String? error,
    bool? isOffline,
    RecommendationEntity? recommendation,
  }) {
    return OnboardingState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isOffline: isOffline ?? this.isOffline,
      recommendation: recommendation ?? this.recommendation,
    );
  }
}