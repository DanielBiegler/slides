# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Package manager

Use **Bun** exclusively. Do not use npm, yarn, or pnpm.

## Monorepo structure

This is a Bun workspace monorepo. Presentations live under `presentations/`. Each presentation is an independent Vite app that inherits the root `tsconfig.json`.

## Creating a new presentation

```sh
./scaffold.sh <name>
```

This copies the template, renames identifiers, and runs `bun install`.

## Dev server

```sh
cd presentations/<name> && bun run dev
```

## Build

Build all presentations from the repo root:

```sh
bun run build
```

Build a single presentation:

```sh
cd presentations/<name> && bun run build
```

## Preview (production)

```sh
cd presentations/<name> && bun run preview
```

## Key dependency

`@danielbiegler/react-slides` (public npm) provides the `Deck`/`Slide` React components and the `preloadPresentationAssets()` Vite plugin used in every presentation's `vite.config.ts`. Its CSS must be imported explicitly: `@danielbiegler/react-slides/style.css`.

