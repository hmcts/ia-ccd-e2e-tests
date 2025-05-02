// @ts-check

import eslint from '@eslint/js';
import tseslint from 'typescript-eslint';

export default [
    {
        ignores: [
            'node_modules/*',
            '.yarn/*',
        ]
    },
    ...[
        eslint.configs.recommended,
        ...tseslint.configs.recommended,
    ].map(conf => ({
        ...conf,
        files: ['**/*.ts'],
    })),
    {
        files: ['**/*.ts'],
        rules: {
            '@typescript-eslint/array-type': 'error',
            // ...
        },
    },
];
