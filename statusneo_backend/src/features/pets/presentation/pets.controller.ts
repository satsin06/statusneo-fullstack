import type { Request, Response } from 'express';
import { CreatePetUseCase } from '../application/create-pet.usecase';
import { GetPetUseCase } from '../application/get-pet.usecase';

export class PetsController {
  constructor(
    private readonly createPetUseCase: CreatePetUseCase,
    private readonly getPetUseCase: GetPetUseCase
  ) {}

  createPet = async (req: Request, res: Response) => {
    const pet = await this.createPetUseCase.execute(req.body);

    return res.status(201).json(pet);
  };

  getPet = async (req: Request, res: Response) => {
    const pet = await this.getPetUseCase.execute(req.params.id as string);

    return res.status(200).json(pet);
  };
}