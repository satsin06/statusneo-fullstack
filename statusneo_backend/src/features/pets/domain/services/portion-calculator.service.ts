export class PortionCalculatorService {
  calculateDailyPortionGrams(dailyCalories: number): number {
    const grams = dailyCalories / 4;
    return Math.round(grams);
  }
}