# Plinko Slot Machine

## Run locally (no server, no localhost)

1. **One-time setup:** Double-click **download-libs.bat** (or right-click **download-libs.ps1** → Run with PowerShell). This downloads the game libraries into the `lib` folder.
2. **Play:** Double-click **standalone.html**. The game runs in your browser from the file — no server or localhost needed.

## Or: TypeScript + Vite version

```bash
npm install
npm run dev
```

Then open **http://localhost:5173**.

## Controls

- **DROP** — Release a ball (costs 10 credits). Ball falls through Plinko pegs and lands in one of 9 pockets.
- Pockets influence the slot outcome: edge pockets (0, 8) have higher multipliers and slightly biased weights toward rare symbols.

## Testing

RNG is seedable for deterministic tests. In `Game.ts`, change:
```ts
this.rng = new RNG(12345); // fixed seed
```
