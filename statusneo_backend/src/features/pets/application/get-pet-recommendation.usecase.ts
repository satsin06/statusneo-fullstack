import { AppError } from '../../../core/errors/app-error';
import { ERROR_CODES } from '../../../core/errors/error-codes';
import {type Recommendation } from '../domain/entities/recommendation.entity';
import { CalorieCalculatorService } from '../domain/services/calorie-calculator.service';
import { PortionCalculatorService } from '../domain/services/portion-calculator.service';
import { ProteinFilterService } from '../domain/services/protein-filter.service';
import { RecommendationEngineService } from '../domain/services/recommendation-engine.service';
import { productsFixture } from '../infrastructure/fixtures/products.fixture';
import {type PetRepository } from '../infrastructure/repositories/pet.repository';

export class GetPetRecommendationUseCase {
  private readonly recommendationEngine: RecommendationEngineService;

  constructor(private readonly petRepository: PetRepository) {
    this.recommendationEngine = new RecommendationEngineService(
      new CalorieCalculatorService(),
      new ProteinFilterService(),
      new PortionCalculatorService()
    );
  }

  async execute(petId: string): Promise<Recommendation> {
    const pet = await this.petRepository.findById(petId);

    if (!pet) {
      throw new AppError('Pet not found', ERROR_CODES.NOT_FOUND, 404);
    }

    return this.recommendationEngine.generateRecommendation(pet, productsFixture);
  }
}