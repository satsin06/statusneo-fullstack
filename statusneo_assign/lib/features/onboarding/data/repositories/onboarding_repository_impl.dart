import '../../domain/entities/pet_profile_entity.dart';
import '../../domain/entities/recommendation_entity.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_remote_data_source.dart';
import '../models/create_pet_request_model.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource remoteDataSource;

  OnboardingRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> createPet(PetProfileEntity pet) async {
    final request = CreatePetRequestModel(pet);
    return await remoteDataSource.createPet(request);
  }

  @override
  Future<RecommendationEntity> getRecommendation(String petId) async {
    return await remoteDataSource.getRecommendation(petId);
  }
}