import type { Request, Response, NextFunction } from 'express';
import { AppError } from './app-error';
import { ERROR_CODES } from './error-codes';

export const notFoundHandler = (
  _req: Request,
  _res: Response,
  next: NextFunction
) => {
  next(new AppError('Route not found', ERROR_CODES.NOT_FOUND, 404));
};