import '../../domain/entities/pet_profile_entity.dart';

class PetProfileLocalModel {
  static Map<String, dynamic> toMap(PetProfileEntity entity) {
    return {
      'name': entity.name,
      'species': entity.species,
      'breed': entity.breed,
      'ageYears': entity.ageYears,
      'ageMonths': entity.ageMonths,
      'weightKg': entity.weightKg,
      'activityLevel': entity.activityLevel,
      'allergies': entity.allergies,
    };
  }

  static PetProfileEntity fromMap(Map<dynamic, dynamic> map) {
    return PetProfileEntity(
      name: map['name'] ?? '',
      species: map['species'] ?? 'dog',
      breed: map['breed'] ?? '',
      ageYears: map['ageYears'] ?? 0,
      ageMonths: map['ageMonths'] ?? 0,
      weightKg: (map['weightKg'] as num?)?.toDouble() ?? 0,
      activityLevel: map['activityLevel'] ?? 'medium',
      allergies: List<String>.from(map['allergies'] ?? []),
    );
  }
}