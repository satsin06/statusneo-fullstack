import { describe, it, expect } from 'vitest';
import { CalorieCalculatorService } from '../domain/services/calorie-calculator.service';
import {type Pet } from '../domain/entities/pet.entity';

describe('CalorieCalculatorService', () => {
  const service = new CalorieCalculatorService();

  it('should calculate daily calories within an expected range', () => {
    const pet: Pet = {
      id: 'pet_1',
      name: 'Bruno',
      species: 'dog',
      breed: 'Labrador',
      ageYears: 3,
      ageMonths: 2,
      weightKg: 28.5,
      activityLevel: 'high',
      allergies: [],
      createdAt: new Date().toISOString(),
    };

    const calories = service.calculateDailyCalories(pet);

    expect(calories).toBeGreaterThan(1100);
    expect(calories).toBeLessThan(1700);
  });
});