import {type Pet } from '../entities/pet.entity';
import {type Recommendation } from '../entities/recommendation.entity';
import {type Product } from '../entities/product.entity';
import {type CalorieCalculatorService } from './calorie-calculator.service';
import {type ProteinFilterService } from './protein-filter.service';
import {type PortionCalculatorService } from './portion-calculator.service';

export class RecommendationEngineService {
  constructor(
    private readonly calorieCalculator: CalorieCalculatorService,
    private readonly proteinFilter: ProteinFilterService,
    private readonly portionCalculator: PortionCalculatorService
  ) {}

  generateRecommendation(pet: Pet, products: Product[]): Recommendation {
    const dailyKcal = this.calorieCalculator.calculateDailyCalories(pet);
    const recommendedProteins = this.proteinFilter.getAllowedProteins(pet.allergies);
    const dailyPortionGrams =
      this.portionCalculator.calculateDailyPortionGrams(dailyKcal);

    const recommendedProducts = products.filter((product) =>
      recommendedProteins.includes(product.protein.toLowerCase())
    );

    const primaryProtein = recommendedProteins[0] ?? 'balanced';
    const planName = `${this.getPlanPrefix(pet)} — ${this.capitalize(primaryProtein)} Plan`;

    return {
      petId: pet.id,
      planName,
      dailyKcal,
      dailyPortionGrams,
      recommendedProteins,
      products: recommendedProducts.slice(0, 3),
    };
  }

  private getPlanPrefix(pet: Pet): string {
    if (pet.ageYears < 1) return 'Growth Support';
    if (pet.activityLevel === 'high') return 'Active Adult';
    if (pet.activityLevel === 'low') return 'Weight Care';
    return 'Balanced Adult';
  }

  private capitalize(value: string): string {
    return value.charAt(0).toUpperCase() + value.slice(1);
  }
}