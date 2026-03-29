import '../entities/recommendation_entity.dart';
import '../repositories/onboarding_repository.dart';

class GetRecommendationUseCase {
  final OnboardingRepository repository;

  GetRecommendationUseCase(this.repository);

  Future<RecommendationEntity> call(String petId) {
    return repository.getRecommendation(petId);
  }
}