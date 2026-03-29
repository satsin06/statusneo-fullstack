import { AppError } from '../../../core/errors/app-error';
import { ERROR_CODES } from '../../../core/errors/error-codes';
import {type Pet } from '../domain/entities/pet.entity';
import {type PetRepository } from '../infrastructure/repositories/pet.repository';

export class GetPetUseCase {
  constructor(private readonly petRepository: PetRepository) {}

  async execute(id: string): Promise<Pet> {
    const pet = await this.petRepository.findById(id);

    if (!pet) {
      throw new AppError('Pet not found', ERROR_CODES.NOT_FOUND, 404);
    }

    return pet;
  }
}