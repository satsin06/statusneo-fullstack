class PetProfileEntity {
  final String name;
  final String species;
  final String breed;
  final int ageYears;
  final int ageMonths;
  final double weightKg;
  final String activityLevel;
  final List<String> allergies;

  const PetProfileEntity({
    required this.name,
    required this.species,
    required this.breed,
    required this.ageYears,
    required this.ageMonths,
    required this.weightKg,
    required this.activityLevel,
    required this.allergies,
  });
}