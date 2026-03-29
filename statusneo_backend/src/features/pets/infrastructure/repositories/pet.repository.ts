import {type Pet } from '../../domain/entities/pet.entity';

export interface PetRepository {
  create(pet: Pet): Promise<Pet>;
  findById(id: string): Promise<Pet | null>;
}