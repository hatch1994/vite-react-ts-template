import { defineConfig } from 'vite';
import reactRefresh from '@vitejs/plugin-react-refresh';

// https://vitejs.dev/config/
export default defineConfig({
  base: '/vite-react-ts-template/',
  plugins: [reactRefresh()],
});
