import express from 'express';
import cors from 'cors';

export const createApp = () => {
  const app = express();

  // Middlewares
  app.use(cors());
  app.use(express.json());

  // Health route
  app.get('/health', (_req, res) => {
    res.status(200).json({
      status: 'ok',
      message: 'Server is running',
    });
  });

  return app;
};