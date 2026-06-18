# Working With the Slide Deck

Everything lives in one file: `slides/slides.md`. mkslides renders the whole deck from that single file.

## The Three Things You Need to Know

`---` on its own line = new slide. That is how you move forward through the deck.

`Note:` at the bottom of a slide = speaker notes. Everything after `Note:` on that slide is hidden from the audience, visible in speaker view (hit `S` in the browser).

Images go in the `slides/` folder and you reference them with just the filename: `![](sage-before.png)`.

## Your Workflow

1. Run `make slides-serve` in a terminal (from inside `make slides-shell` if needed)
2. Open http://localhost:6767 in your browser
3. Edit `slides/slides.md` in your editor — the browser live-reloads on save
4. Hit `S` in the browser to open speaker view in a second window while you work

## Finding Your Slides

Each slide starts with a `#` heading. Search for the heading text in `slides/slides.md` to jump to the right spot. The `<!-- Speaker: John -->` and `<!-- Speaker: Hardy -->` comments mark where each act starts.

## What a Finished Slide Looks Like vs. a Stub

The stubs have placeholder text and `Note:` blocks with hints. When you draft a slide:

- Replace the placeholder bullets with your real content — short imperative phrases, no periods
- Rewrite the `Note:` block in your own voice as if you are talking to yourself before you walk on stage

## Makefile Targets

| Target | What it does |
|--------|-------------|
| `make slides-init` | Set up the Python venv (run once) |
| `make slides-shell` | Drop into a shell with the venv active |
| `make slides` | Build the deck to `site/` |
| `make slides-serve` | Live-preview at http://localhost:6767 |
