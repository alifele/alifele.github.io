// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

export default defineConfig({
  site: 'https://alifele.github.io',
  integrations: [
    starlight({
      title: 'Research Documentation',
      social: [{ icon: 'github', label: 'GitHub', href: 'https://github.com/alifele' }],
      sidebar: [{ label: 'Overview', link: '/docs/' }, { label: 'DonorAcceptorMC', link: '/docs/donor-acceptor/' }],
    }),
  ],
});