import { defineConfig } from "vite"
import react from "@vitejs/plugin-react"
import { preloadPresentationAssets } from "@danielbiegler/react-slides/vite-plugin"

export default defineConfig({
  plugins: [react(), preloadPresentationAssets()],
})
