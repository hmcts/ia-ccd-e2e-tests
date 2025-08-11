import { defineConfig } from 'eslint-define-config';
import neostandard from 'neostandard';

export default defineConfig({
  ...neostandard({
    ignores: neostandard.resolveIgnoresFromGitignore(),
    ts: true,
  }),
});
