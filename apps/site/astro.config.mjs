// @ts-check
import { defineConfig } from 'astro/config';

import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
    site: 'https://alifele.github.io',
    integrations: [
        starlight(
          {
            title: "Ali Fele Paranj - Software Documentation"
          })
    ]

});