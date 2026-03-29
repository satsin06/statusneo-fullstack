import {type Pet } from '../../domain/entities/pet.entity';
import {type PetRepository } from './pet.repository';

export class InMemoryPetRepository implements PetRepository {
  private pets: Pet[] = [];

  async create(pet: Pet): Promise<Pet> {
    this.pets.push(pet);
    return pet;
  }

  async findById(id: string): Promise<Pet | null> {
    const pet = this.pets.find((p) => p.id === id);
    return pet ?? null;
  }
}