import { Router } from 'express';
import { PetsController } from './pets.controller';
import { CreatePetUseCase } from '../application/create-pet.usecase';
import { GetPetUseCase } from '../application/get-pet.usecase';
import { GetPetRecommendationUseCase } from '../application/get-pet-recommendation.usecase';
import { InMemoryPetRepository } from '../infrastructure/repositories/in-memory-pet.repository';
import { asyncHandler } from '../../../core/middleware/async-handler';
import { validateRequest } from '../../../core/middleware/validate-request';
import { createPetSchema } from './pets.schema';

const router = Router();

const petRepository = new InMemoryPetRepository();

const createPetUseCase = new CreatePetUseCase(petRepository);
const getPetUseCase = new GetPetUseCase(petRepository);
const getPetRecommendationUseCase = new GetPetRecommendationUseCase(petRepository);

const petsController = new PetsController(
  createPetUseCase,
  getPetUseCase,
  getPetRecommendationUseCase
);

/**
 * @swagger
 * /api/pets:
 *   post:
 *     summary: Create a new pet
 *     tags: [Pets]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - name
 *               - species
 *               - breed
 *               - ageYears
 *               - ageMonths
 *               - weightKg
 *               - activityLevel
 *             properties:
 *               name:
 *                 type: string
 *               species:
 *                 type: string
 *                 enum: [dog, cat]
 *               breed:
 *                 type: string
 *               ageYears:
 *                 type: number
 *               ageMonths:
 *                 type: number
 *               weightKg:
 *                 type: number
 *               activityLevel:
 *                 type: string
 *                 enum: [low, medium, high]
 *               allergies:
 *                 type: array
 *                 items:
 *                   type: string
 *     responses:
 *       201:
 *         description: Pet created successfully
 */

router.post(
  '/',
  validateRequest(createPetSchema),
  asyncHandler(petsController.createPet)
);

/**
 * @swagger
 * /api/pets/{id}:
 *   get:
 *     summary: Get pet by ID
 *     tags: [Pets]
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Pet retrieved successfully
 *       404:
 *         description: Pet not found
 */
router.get('/:id', asyncHandler(petsController.getPet));

/**
 * @swagger
 * /api/pets/{id}/recommendation:
 *   get:
 *     summary: Get pet recommendation
 *     tags: [Pets]
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Recommendation generated successfully
 *       404:
 *         description: Pet not found
 */
router.get('/:id/recommendation', asyncHandler(petsController.getRecommendation));

export default router;