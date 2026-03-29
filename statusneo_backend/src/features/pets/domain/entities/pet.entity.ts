export type PetSpecies = 'dog' | 'cat';
export type ActivityLevel = 'low' | 'medium' | 'high';

export interface Pet {
  id: string;
  name: string;
  species: PetSpecies;
  breed: string;
  ageYears: number;
  ageMonths: number;
  weightKg: number;
  activityLevel: ActivityLevel;
  allergies: string[];
  createdAt: string;
}