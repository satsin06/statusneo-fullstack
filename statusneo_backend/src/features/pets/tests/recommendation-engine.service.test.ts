import { describe, it, expect } from 'vitest';
import { RecommendationEngineService } from '../domain/services/recommendation-engine.service';
import { CalorieCalculatorService } from '../domain/services/calorie-calculator.service';
import { ProteinFilterService } from '../domain/services/protein-filter.service';
import { PortionCalculatorService } from '../domain/services/portion-calculator.service';
import { productsFixture } from '../infrastructure/fixtures/products.fixture';
import { type Pet } from '../domain/entities/pet.entity';

describe('RecommendationEngineService', () => {
  const service = new RecommendationEngineService(
    new CalorieCalculatorService(),
    new ProteinFilterService(),
    new PortionCalculatorService()
  );

  it('should generate a valid recommendation without allergic proteins', () => {
    const pet: Pet = {
      id: 'pet_1',
      name: 'Bruno',
      species: 'dog',
      breed: 'Labrador',
      ageYears: 3,
      ageMonths: 2,
      weightKg: 28.5,
      activityLevel: 'high',
      allergies: ['chicken'],
      createdAt: new Date().toISOString(),
    };

    const recommendation = service.generateRecommendation(pet, productsFixture);

    expect(recommendation.petId).toBe(pet.id);
    expect(recommendation.dailyKcal).toBeGreaterThan(0);
    expect(recommendation.dailyPortionGrams).toBeGreaterThan(0);
    expect(recommendation.products.length).toBeGreaterThan(0);

    const hasChickenProduct = recommendation.products.some(
      (product) => product.protein === 'chicken'
    );

    expect(hasChickenProduct).toBe(false);
  });
});