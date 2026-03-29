import {type Pet } from '../entities/pet.entity';

export class CalorieCalculatorService {
  calculateDailyCalories(pet: Pet): number {
    const rer = 70 * Math.pow(pet.weightKg, 0.75);

    let activityFactor = 1.4;

    if (pet.activityLevel === 'low') activityFactor = 1.2;
    if (pet.activityLevel === 'medium') activityFactor = 1.4;
    if (pet.activityLevel === 'high') activityFactor = 1.8;

    const dailyCalories = rer * activityFactor;

    return Math.round(dailyCalories);
  }
}