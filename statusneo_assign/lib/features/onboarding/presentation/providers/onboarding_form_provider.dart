import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/pet_profile_entity.dart';

class OnboardingFormState {
  final String name;
  final String species;
  final String breed;
  final String ageYears;
  final String ageMonths;
  final String weight;
  final String activityLevel;
  final List<String> allergies;

  const OnboardingFormState({
    this.name = '',
    this.species = 'dog',
    this.breed = '',
    this.ageYears = '',
    this.ageMonths = '',
    this.weight = '',
    this.activityLevel = 'medium',
    this.allergies = const [],
  });

  OnboardingFormState copyWith({
    String? name,
    String? species,
    String? breed,
    String? ageYears,
    String? ageMonths,
    String? weight,
    String? activityLevel,
    List<String>? allergies,
  }) {
    return OnboardingFormState(
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      ageYears: ageYears ?? this.ageYears,
      ageMonths: ageMonths ?? this.ageMonths,
      weight: weight ?? this.weight,
      activityLevel: activityLevel ?? this.activityLevel,
      allergies: allergies ?? this.allergies,
    );
  }

  PetProfileEntity toEntity() {
    return PetProfileEntity(
      name: name,
      species: species,
      breed: breed,
      ageYears: int.parse(ageYears),
      ageMonths: int.parse(ageMonths),
      weightKg: double.parse(weight),
      activityLevel: activityLevel,
      allergies: allergies,
    );
  }
}

class OnboardingFormNotifier extends Notifier<OnboardingFormState> {
  @override
  OnboardingFormState build() => const OnboardingFormState();

  void updateName(String value) => state = state.copyWith(name: value);
  void updateSpecies(String value) => state = state.copyWith(species: value);
  void updateBreed(String value) => state = state.copyWith(breed: value);
  void updateAgeYears(String value) => state = state.copyWith(ageYears: value);
  void updateAgeMonths(String value) => state = state.copyWith(ageMonths: value);
  void updateWeight(String value) => state = state.copyWith(weight: value);
  void updateActivity(String value) =>
      state = state.copyWith(activityLevel: value);

  void toggleAllergy(String allergy) {
    final list = [...state.allergies];
    if (list.contains(allergy)) {
      list.remove(allergy);
    } else {
      list.add(allergy);
    }
    state = state.copyWith(allergies: list);
  }
}

final onboardingFormProvider =
    NotifierProvider<OnboardingFormNotifier, OnboardingFormState>(
  OnboardingFormNotifier.new,
);