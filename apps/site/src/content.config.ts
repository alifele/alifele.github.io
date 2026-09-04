import { defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';

const docs = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/docs' }),
});

const i18n = defineCollection({
  loader: glob({ pattern: '**/*.json', base: './src/content/i18n' }),
});

export const collections = { docs, i18n };
