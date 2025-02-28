import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import ViteRails from 'vite-plugin-rails'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss(),
    ViteRails(),
  ],
})
