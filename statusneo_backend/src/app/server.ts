import { createApp } from './app';
import { logger } from '../core/logger/logger';

const PORT = process.env.PORT || 3000;

export const startServer = () => {
  const app = createApp();

  app.listen(PORT, () => {
    logger.info(`🚀 Server running on http://localhost:${PORT}`);
  });
};