import { z } from 'zod';

export const createPetSchema = z.object({
  name: z.string().min(1, 'Name is required'),
  species: z.enum(['dog', 'cat']),
  breed: z.string().min(1, 'Breed is required'),
  ageYears: z.number().min(0, 'Age years must be 0 or more'),
  ageMonths: z.number().min(0).max(11, 'Age months must be between 0 and 11'),
  weightKg: z.number().positive('Weight must be greater than 0'),
  activityLevel: z.enum(['low', 'medium', 'high']),
  allergies: z.array(z.string()).default([]),
});

export type CreatePetInput = z.infer<typeof createPetSchema>;