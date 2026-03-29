import '../entities/pet_profile_entity.dart';
import '../repositories/onboarding_repository.dart';

class CreatePetUseCase {
  final OnboardingRepository repository;

  CreatePetUseCase(this.repository);

  Future<String> call(PetProfileEntity pet) {
    return repository.createPet(pet);
  }
}