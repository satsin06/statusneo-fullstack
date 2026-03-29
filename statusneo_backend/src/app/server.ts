import { createApp } from './app';

const PORT = process.env.PORT || 3000;

export const startServer = () => {
  const app = createApp();

  app.listen(PORT, () => {
    console.log(`🚀 Server running on http://localhost:${PORT}`);
  });
};