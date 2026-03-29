import '../entities/pet_profile_entity.dart';
import '../entities/recommendation_entity.dart';

abstract class OnboardingRepository {
  Future<String> createPet(PetProfileEntity pet);
  Future<RecommendationEntity> getRecommendation(String petId);
}