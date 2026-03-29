import { Router } from 'express';
import { PetsController } from './pets.controller';
import { CreatePetUseCase } from '../application/create-pet.usecase';
import { GetPetUseCase } from '../application/get-pet.usecase';
import { InMemoryPetRepository } from '../infrastructure/repositories/in-memory-pet.repository';
import { asyncHandler } from '../../../core/middleware/async-handler';
import { validateRequest } from '../../../core/middleware/validate-request';
import { createPetSchema } from './pets.schema';

const router = Router();

const petRepository = new InMemoryPetRepository();

const createPetUseCase = new CreatePetUseCase(petRepository);
const getPetUseCase = new GetPetUseCase(petRepository);

const petsController = new PetsController(createPetUseCase, getPetUseCase);

router.post(
  '/',
  validateRequest(createPetSchema),
  asyncHandler(petsController.createPet)
);

router.get('/:id', asyncHandler(petsController.getPet));

export default router;