import '../../domain/entities/pet_profile_entity.dart';

class CreatePetRequestModel {
  final Map<String, dynamic> data;

  CreatePetRequestModel(PetProfileEntity entity)
      : data = {
          "name": entity.name,
          "species": entity.species,
          "breed": entity.breed,
          "ageYears": entity.ageYears,
          "ageMonths": entity.ageMonths,
          "weightKg": entity.weightKg,
          "activityLevel": entity.activityLevel,
          "allergies": entity.allergies,
        };
}