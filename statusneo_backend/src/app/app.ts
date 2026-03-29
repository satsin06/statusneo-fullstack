import express from 'express';
import cors from 'cors';

import { requestLogger } from '../core/middleware/request-logger';
import { notFoundHandler } from '../core/errors/not-found-handler';
import { errorHandler } from '../core/errors/error-handler';
import { setupSwagger } from '../docs/swagger';
import petsRoutes from '../features/pets/presentation/pets.routes';

export const createApp = () => {
  const app = express();

  app.use(cors());
  app.use(express.json());
  app.use(requestLogger);

  // Health route
  app.get('/health', (_req, res) => {
    res.status(200).json({
      status: 'ok',
      message: 'Server is running',
    });
  });

  app.use('/api/pets', petsRoutes);

  setupSwagger(app);

  app.use(notFoundHandler);
  app.use(errorHandler);

  return app;
};