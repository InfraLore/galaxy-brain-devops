# Plan: Draft Slides for Galaxy Brain DevOps (UC-Tech 2026)

## Context

The talk is a 45-minute slot on July 9, 2026 (about 4 weeks away). The outline is complete (11 acts + closing). The repo has rich source material: book chapters in `resources/`, real incident transcripts in `transcripts/`, and images in `images/`. No slides exist yet.

Constraint from `process.md`: using [mkslides](https://martenbe.github.io/mkslides/) as the slide framework. The todo list defines the sequence of work.

Act XI is now John's Avalon story (`transcripts/one-shotting-Avalon-with-MakefileSage-and-Codex.md`). The Closing adds a book reveal.

---

## Step 1: Set Up mkslides

- Install mkslides: add to `requirements.txt`
- Create a `slides/` directory at the repo root
- Create `slides/slides.md` as the main entry point (mkslides renders a single markdown file by default)
- Add two Makefile targets:
  - `make slides` — builds the deck (calls `mkslides build`)
  - `make slides-serve` — live preview (calls `mkslides serve`)
- Commit this skeleton before drafting content

**Key file to create:** `slides/slides.md`

---

## Step 2: Set Theme

Use the **Solarized** reveal.js theme (confirmed with John). Set this in the mkslides config from the start so both drafters see the same colors.

---

## Step 3: Slide Structure — One Section per Act

Total budget: ~45 minutes. Suggested timing and slide count per act.

**Speaker rationale:** Hardy holds the narrative thread — the Samvera 2017 story is *his* memory of being blown away, so he tells it. John brings credibility as the person who lived it, then takes over to explain the Make philosophy (Acts I-II, IV-V). Act III (Why Make?) is a collab: Hardy sets up the Samvera story and hands to John to elaborate. Hardy picks up again for the UCSF incident stories and AI observation. John closes out with his own Avalon story (Act XI) — one instruction, one session, a fully working production Makefile — the clearest demo that executable knowledge amplifies AI. The Closing brings it all back to Sage, then ends with the book reveal.

| Act | Title | Speaker | Time | ~Slides |
|-----|-------|---------|------|---------|
| Intro | Title + framing | Both | 1 min | 2 |
| I | The 3 A.M. Call (Sage) | John | 4 min | 4-5 |
| II | Why Documentation Isn't Enough | John | 3 min | 3-4 |
| III | Why Make? (Samvera 2017 origin) | Both (Hardy sets up, John elaborates) | 4 min | 4-5 |
| IV | Executable Knowledge | John | 4 min | 4-5 |
| V | Systems That Teach | John | 3 min | 3-4 |
| VI | A Real Project (EKS, `make help`) | Hardy | 3 min | 3 |
| VII | Knowledge Preservation (IMDS) | Hardy | 4 min | 4 |
| VIII | Knowledge Creation (DEVEXP-309) | Hardy | 3 min | 3-4 |
| IX | Mob Programming (LIVE) | Both | 8 min | 2 (framing only) |
| X | The Unexpected Observation (AI) | Hardy | 2 min | 2-3 |
| XI | One Instruction (Avalon / Codex) | John | 3 min | 3-4 |
| Closing | Return to Sage + book reveal | Both | 3 min | 3 |
| **Total** | | | **45 min** | **~44 slides** |

Act IX (Mob Programming) gets minimal slides — just framing text. The demo IS the slides.

**Act XI framing:** John gave Codex one prompt — "make this a proper prod environment, use a Makefile, and make me proud." The agent one-shotted a full production Docker Compose stack, Makefile with `make help`, env guards, Rails hardening, and tests. It worked because the project already had executable knowledge for the agent to reason from. Short, punchy, lands the thesis with John's own hands.

**Closing / book reveal:** Return to Sage, land the "Can your system teach the next person who shows up?" question, then pivot: "We've been writing a book about this." Show cover / title. Mention Hardy + John as co-authors, Claude as collaborator. Don't over-explain — let the room react.

---

## Step 4: Divide Sections Between Hardy and John

- **Both:** Intro, Act III (collab), Closing (including book reveal)
- **John:** Acts I, II, IV, V, XI — the Sage narrative, Make philosophy, and Avalon one-shot story
- **Hardy:** Acts VI, VII, VIII, IX setup, X — EKS project, incident stories, AI observation

Each person drafts their own acts as separate `##` sections within `slides/slides.md`. Use the horizontal rule `---` between acts and `----` for slide-within-act breaks.

---

## Step 5: Drafting Content

Source material already in the repo maps cleanly to acts:

| Act | Pull from |
|-----|-----------|
| I, II | `resources/01-why_make.md` (institutional knowledge crisis) |
| III, IV | `resources/01-why_make.md` (Make reframing) |
| IV, V | `resources/02-executable_readme.md` |
| VI | EKS project (live — no content needed in slides) |
| VII | `transcripts/a-partial-reconstruction-of-a-session-involving-a-Makefile.txt` |
| VIII | `transcripts/DEVEXP-309-NVMe-Mount-Investigation-and-Containerd-Root-Discovery-Diagnosis.txt` |
| X | `resources/20-the_future_of_make_in_devops.md` |
| XI | `transcripts/one-shotting-Avalon-with-MakefileSage-and-Codex.md` |
| Closing | `images/sage-before.png` + `images/sage-after.png` + `images/make-for-devops-cover.png` |

**Draft approach:** write sparse slides first — thesis sentence + bullet points. Speaker notes go in the `Note:` section (reveal.js convention, supported by mkslides). Do not write prose on slides.

---

## Step 6: Review Pass

Once both Hardy and John have first drafts:
- Run `make slides-serve` and walk through together
- Check transitions between speakers feel natural
- Verify Act IX framing slides give enough context for a cold audience

---

## Step 7: Rehearsal / Timing Check

- Run full deck with a timer
- Act IX live demo needs a separate dry run against the actual EKS project
- Confirm DEVEXP-309 transcript is still a "safe mystery" (ticket still open as of June 2026)

---

## Verification

End-to-end test: `make slides` produces a browsable deck with no errors, all 11 acts present, `make slides-serve` opens in a browser and navigates cleanly through all sections.

---

## Decisions Made

- **Theme:** Solarized (confirmed with John)
- **Speaker split:** see table above — John leads Acts I-II and IV-V, Hardy leads VI-XI, both share intro/Act III/closing
- **mkslides install:** `requirements.txt` + venv, managed via Makefile targets
