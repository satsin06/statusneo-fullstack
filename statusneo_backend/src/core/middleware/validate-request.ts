import type { Request, Response, NextFunction } from 'express';
import type { ZodType } from 'zod';
import { AppError } from '../errors/app-error';
import { ERROR_CODES } from '../errors/error-codes';

export const validateRequest = (schema: ZodType) => {
  return (req: Request, _res: Response, next: NextFunction) => {
    const result = schema.safeParse(req.body);

    if (!result.success) {
      const firstError = result.error.issues[0];

      return next(
        new AppError(
          firstError?.message || 'Validation failed',
          ERROR_CODES.VALIDATION_ERROR,
          400
        )
      );
    }

    req.body = result.data;
    next();
  };
};