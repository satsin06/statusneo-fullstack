import type { NextFunction, Request, Response } from 'express';
import { AppError } from './app-error';
import { ERROR_CODES } from './error-codes';

export const errorHandler = (
  err: Error,
  _req: Request,
  res: Response,
  _next: NextFunction
) => {
  if (err instanceof AppError) {
    return res.status(err.statusCode).json({
      error: err.message,
      code: err.code,
    });
  }

  console.error('Unhandled Error:', err);

  return res.status(500).json({
    error: 'Something went wrong',
    code: ERROR_CODES.INTERNAL_SERVER_ERROR,
  });
};