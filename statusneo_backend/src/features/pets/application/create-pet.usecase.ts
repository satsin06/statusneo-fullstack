import {type Pet } from '../domain/entities/pet.entity';
import {type PetRepository } from '../infrastructure/repositories/pet.repository';
import {type CreatePetInput } from '../presentation/pets.schema';

export class CreatePetUseCase {
  constructor(private readonly petRepository: PetRepository) {}

  async execute(input: CreatePetInput): Promise<Pet> {
    const pet: Pet = {
      id: `pet_${Date.now()}`,
      createdAt: new Date().toISOString(),
      ...input,
    };

    return this.petRepository.create(pet);
  }
}