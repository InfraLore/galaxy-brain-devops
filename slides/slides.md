---
title: "Galaxy Brain DevOps"
author: "Hardy Pottinger & John H. Robinson, IV"
---

<!-- Speaker: Both -->

# Galaxy Brain DevOps

Hardy Pottinger  
John H. Robinson, IV

### UC-Tech 2026

[![CC BY 4.0](https://licensebuttons.net/l/by/4.0/88x31.png)](https://creativecommons.org/licenses/by/4.0/)

Note:
  Hey, I'm Hardy. I work on the Developer Experience team at UCSF. And I'm
  here with my friend and co-author John. John is a veteran Debian developer
  and Programmer Analyst at the UCLA Library, where he keeps complex academic
  library systems running -- infrastructure automation, container pipelines,
  config management. He bridges the gap between software development and
  systems administration, and he's way better at it than I am.

  *[John takes over]*

  And I'm John. He's being modest -- Hardy is the person at UCSF who makes
  sure developers have the tools and the environment they need to actually do
  their jobs. He's good at it. This talk is about something we've both been
  thinking about for a long time -- and writing about. The title is Galaxy
  Brain DevOps. We'll explain that as we go. But it starts with a problem.

---

# The Problem Is Not Knowledge

It is access.

Note:
  The problem is not knowledge. It is access. Most organizations already have
  the knowledge they need -- it just can't reach the person who needs it, at
  3 A.M., when everything is on fire. Let me tell you about Sage.

---

# Meet Sage

![](sage-before.png)

Note:
  John: It's 3 AM Saturday. Production is down. Sage -- who joined three
  months ago -- is frantically searching through Slack history, wiki pages,
  and a documentation site, trying to figure out how to roll back Friday's
  deployment. He finds five *unique* runbooks. Two mention scripts that no
  longer exist. One points to a Confluence page he doesn't have access to. The
  senior engineer who wrote most of this left four months ago, and took years
  of team lore with them.

  An hour later, the rollback works. But this wasn't an isolated incident.

  Sage isn't the problem. The system is.

---

# The Docs Exist

- Runbook :check_mark_button:
- Wiki :check_mark_button:
- Slack history :check_mark_button:

Note:
  John: Sage has resources: Runbooks, a wiki, two years of Slack history. The
  docs exist. They just aren't enough. Having documentation is not the same as
  having access to knowledge when you need it.

---

![](sage-after-page.png)

Note:
  John: right, Sage?

---

# Knowledge Without Access Is Not Knowledge

Note:
  John: Knowledge Without Access Is Not Knowledge. We invest all this time in
  writing documentation, and it fails us anyway. Not because it's wrong, but
  because it's not accessible in the moment of need. Why does this keep
  happening?

---

# Every Team Has a Sage Story

- New engineers take longer to reach confidence
- Teams without runbooks resolve incidents more slowly
- Senior engineers become the bottleneck

Note:
  John: There's all kinds of metrics to back this up -- DORA metrics will tell
  you this -- but you don't need metrics to know: new engineers take longer to
  reach confidence, teams without runbooks resolve incidents more slowly. So
  you write the runbooks, but they're impossible to keep current. Senior
  engineers become the bottleneck, because they hold the team lore, the mental
  model, the knowledge that the system is based on.

---

<!-- Speaker: John -->

# Why Documentation Sucks

Note:
  John: I've already hinted at some of the reasons, but let's dive into this.
  Why does documentation, even great documentation, suck? Hardy, do you know?

---

# Docs Drift

- Systems change faster than docs
- No compiler, no tests, no alarm

Note:
  Hardy: Systems change faster than docs. Every time someone updates a
  deployment script, changes a tool version, adds a new requirement -- all the
  related documentation should be updated. In practice, it rarely is. And
  here's the thing: code that drifts breaks CI. Docs that drift just quietly
  lie. There's no alarm, no failing test. You don't find out until someone
  follows the runbook and it doesn't work.

---

# Completeness Is the Enemy

- More complete = harder to maintain
- Harder to maintain = faster drift

Note:
  Hardy: So you try to write better documentation. More thorough, more
  complete. A 47-page deployment guide that covers every edge case. And now
  you have 47 pages of surface area for rot. Worse: when engineers find one
  outdated section, they stop trusting the whole document. Comprehensiveness
  doesn't solve the problem -- it makes it bigger. That's not even the worst
  of it, though, right?

---

# Engineers Don't Know What's Possible

- No discovery mechanism
- Team lore fills the gap

Note:
  John: Your docs don't even have to be wrong to fail. You've got smoke tests,
  load testing, debugging, observability. But if engineers don't know those
  capabilities exist, they'll either reinvent them poorly or not use them at
  all. Traditional documentation assumes engineers know what questions to ask.
  The most valuable knowledge is often the knowledge you don't know you need.
  So they ask a senior engineer instead -- and now you're back to team lore
  filling the gap.

---

# Team Lore Diverges From Docs

- What people actually do  
vs.
- What the docs say

Note:
  John: Over time, the real procedure and the documented procedure become two
  different things. Neither is wrong -- they just aren't the same anymore. New
  engineers learn the documented version. Senior engineers use the real one.
  Nobody reconciles them. And every time a new engineer asks how something
  works, a senior engineer has to stop what they're doing and explain. That's
  not mentorship -- that's a broken system. Before we suggest a solution,
  Hardy has a story for you.

---

# Samvera 2017

Note:
  Hardy: In 2017, at Samvera Connect in Evanston, Illinois, I proposed an
  unconference session on developer workspaces. Samvera is a library software
  community -- the kind of place where getting a development environment
  running was a steep, lore-driven affair. You needed a senior engineer
  looking over your shoulder for most of a day. I wanted to show off what
  Vagrant could do in that unconference. What I didn't expect was John.

---

# One Demo Changed Everything

- Live terminal
- Vagrant up
- Make targets
- [github.com/jhriv/vagrant-as-infrastructure](https://github.com/jhriv/vagrant-as-infrastructure)

Note:
  Hardy: John sat down and proceeded to ad-lib an entire development
  environment on the spot. He called a Make target. Then another. Vagrant spun
  up whatever he needed -- a database, a web server, a job queue -- pulling
  pieces from past projects, assembling them into something new. He wasn't
  following a script. He was composing. In minutes, he was working. I was
  blown away. I asked him for the Makefile afterward. Its README states the
  philosophy plainly: "Makefile is all you need. Everything else can be
  downloaded automatically." The link to it is on this slide. I poked at it,
  found it deeply weird, and set it aside. Then, gradually, I started noticing
  Makefiles everywhere. John: why Make?

---

# Make Is 50 Years Old

- Survived because it solves timeless problems
- Encodes dependencies, relationships, intent
- Available everywhere

Note:
  John: Make outlasted the tools it was invented to build. It's on every
  Unix-like system, no install required. The reason it survived isn't
  nostalgia — it's that **the problems it solves never went away**.

---

# `make help`

- Not a build tool
- An operational interface
- A knowledge catalog

Note:
  John: Most people think of Make as a build tool. Something you use to
  compile software. That's how it started, and that reputation stuck. But
  that's not what we're talking about. We want you to think of Make
  differently -- as an operational interface. A way to expose what a project
  knows how to do. Not a build tool. A knowledge catalog. When you run `make
  help`, you're not asking about compilation steps. You're asking the project:
  what can you do?

---

<!-- Speaker: John -->

# Executable Knowledge

- Commands that document AND perform
- The interface is the documentation
- No drift possible

Note:
  Executable knowledge. Not documentation *about* commands -- the commands
  themselves. When the interface IS the documentation, it can't drift from
  reality. It either works or it fails loudly. No silent rot. Think about what
  Sage needed at 3 AM Saturday -- he didn't need a wiki page. He needed
  something he could run. That's executable knowledge. That's Make.

---

# Static vs. Executable

| Static | Executable |
|--------|-----------|
| Describes | Does |
| Can drift | Self-validates |
| Requires interpretation | Runs directly |
| Silently wrong | Fails visibly |

Note:
  A static runbook can be wrong and no one knows. An executable one fails
  loudly the moment it drifts. That's the feedback loop docs never had. Make
  gives you that feedback loop.

---

# A Makefile

```makefile
.PHONY: help deploy rollback

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	  | awk '{printf "  %-20s %s\n", $$1, $$2}'

deploy: ## Deploy the current build to staging
	./scripts/deploy.sh staging

rollback: ## Roll back the last deployment safely
	./scripts/rollback.sh
```

Note:
  A Makefile is a collection of targets. Each target is a named command --
  or a sequence of commands -- you can run. That `.PHONY` line tells Make
  these aren't files -- just named actions. The double-hashtag comment is
  what that surprising grep in `make help` is looking for -- that's how
  each target gets its description.

---

# Write Targets Like You're Writing for Sage

- Clear intent
- Safe defaults
- Helpful output

Note:
  Hardy: We can't get too far into the weeds with how to write a Makefile, but
  here's the guiding principle for executable knowledge: write targets like
  you're writing for Sage. Make your intent clear, use defaults, and be a
  little verbose with the output.

---

# The Executable README

- `make help` as the entry point
- Every project answers the same first question
- What can I do here?

Note:
  Hardy: This might help. Think of the Makefile as an Executable README. A
  project that responds to `make help` with a clear list of operations has
  already answered the first question every new engineer asks, "what can I do
  with this?"

---

<!-- Speaker: John -->

# Systems That Teach

Note:
  John: A well-made Makefile doesn't just run commands — it teaches people
  what the project knows.

---

# `make help` Is Always the Answer

- One command, any project
- Reveals everything you can do
- No prior knowledge required

Note:
  John: `make help` is the universal entry point. It is the same in every
  project — once an engineer knows this pattern, they can onboard to any
  project that uses it. Knowledge becomes portable. Once you put this in
  action in a few projects, it becomes comfortable muscle memory. Even for
  familiar projects. It's like typing "print working directory" a million
  times a day: a reminder, I am here, this is what I can do.

---

# Build Knowledge As You Work

- Capture what you just figured out
- Name it for the problem, not the solution
- Start broad, refine later

Note:
  Hardy: You don't have to write a perfect Makefile up front, from scratch.
  Think of them as a way to collect things you've learned. Every time you
  search for the same command twice, that command belongs in your Makefile.
  The act of capturing it teaches you the tool better. And you don't have to
  look that command up again. A Makefile can start as your own personal
  runbook.

---

# Knowledge Flows From Personal to Team

- What you capture for yourself
- becomes what you share with your team
- becomes the project standard

Note:
  Hardy: Personal runbooks become team runbooks become operational standards.
  No policy required — it happens organically when the tooling makes sharing
  easy. Let me show you what this looks like.

---

<!-- Speaker: Hardy -->

# A Real Project

Note:
  Hardy: Here's a Makefile that grew organically: as I found commands that
  worked, I added them to the Makefile. It's the management harness for our
  self-hosted GitHub Actions runner, which is hosted on an AWS EKS cluster.
  It's a nice little project to demo, because it's mostly about making compute
  available to our GitHub Actions workflows on our on-prem GitHub Enterprise
  Server instance. As a Kubernetes cluster, is pretty resilient, we can deploy
  to it in the middle of the day without impacting our users. So, yes, this is
  prod. We won't burn it down. It will be OK.

---

# Years of Operational Knowledge

- `make help`

Note:
  Hardy: Run `make help`. Look at that output. Every section -- Setup, ARC,
  Node Management, Debugging -- represents a category of problems this project
  has solved. The debugging section alone has 20 targets. Each one was added
  the day I hit something I didn't want to hit again. `debug-imds` -- we'll
  come back to that one. `recycle-node`, `debug-ephemeral-storage`,
  `troubleshoot` -- every one of these has a story. This Makefile didn't come
  from a planning meeting. It grew.

---

# The Project Knows More Than We Do

> :robot:
> "Yes - it's there, though it's called 'IMDS hop limit' rather than
> 'Token hop limit.' These are the same thing... `debug-imds` target
> that checks hop limit on EKS nodes"

```
inner container (workflow step)
  → dind daemon pod
    → pod network
      → host NIC
        → IMDS
That's 3 hops, not 2.
```

Note:
  Hardy: I was helping a customer convert a GitHub Actions workflow to a
  container-based approach. As soon as he hit registry login failures, he was
  ready to abandon the whole thing. Then he remembered we'd fixed something
  about "hops" before -- but neither of us could remember the details. So I
  pulled up the Makefile, opened Claude, and asked it to look for anything
  about hops. Claude got very excited. Because the project remembered.

---

<!-- Speaker: Hardy -->

# The Project Remembered

- Permissions wall hit: pivoted
- Baked hop-limit 3 into launch template
- Recycled nodes

Note:
  Hardy: to recap: we hit a permissions wall so I increased the hop limit in
  the launch template, and ran the "tweak runner" target to deploy it, and our
  nodes came up at hop limit 3. My customer's workflows started working.
  Problem solved.Our shared memory was vague. The project's memory was
  perfect. The Makefile remembered what we forgot. That's **knowledge
  preservation**. Now let me show you **knowledge creation**.

---

# DEVEXP-306 -> DEVEXP-309

- NVMe not mounting on all nodes
- Root EBS at 50-90%
- Should be under 5%

> :robot:
> "`DirectoryOrCreate` will create the dir on root EBS if NVMe isn't
> mounted. The dind container starts fine, writes everything to root EBS,
> and no pod ever fails. The problem surfaces only via the Datadog monitor."

Note:
  Hardy: This one started as DEVEXP-306 -- root EBS filling up. We fixed
  that. The fix is holding. But in the process of investigating, we found
  a deeper mystery: NVMe isn't mounting on all nodes. When it doesn't,
  Docker falls back to root EBS. We've got about 5GB of root usage we
  could clean up if we pursue it. It's in the backlog. It's not worth the
  squeeze right now.

---

# Investigate With the Makefile

- `debug-docker-storage`
- `debug-ephemeral-storage`
- `recycle-node`

Note:
  Hardy: The Makefile already knew how to look at this. `debug-docker-storage`,
  `debug-ephemeral-storage`, `recycle-node` -- targets I added when I hit
  storage problems before. I didn't have to figure out how to investigate.
  The project told me where to start.

---

# Five Bugs Found

1. Older LT versions on some nodes
2. Userdata exits early (set -euo pipefail)
3. DirectoryOrCreate masks mount failures
4. blkid suppresses errors
5. grep device filter is fragile

Note:
  Hardy: What we found was layers. Not one bug -- five. Older launch template
  versions on some nodes. A userdata script that exits early on any error.
  A `DirectoryOrCreate` config that silently falls back to root EBS. A
  `blkid` call that suppresses errors. A device filter that's fragile if
  the instance type ever changes. Any one of them alone might look like
  bad luck. Together they explain exactly why some nodes mount and some
  don't. The ticket is still open. Our verdict: 306 contained root
  storage usage to about 5GB. We can live with that. 309 is in the
  backlog. The investigation created knowledge.

---

# Knowledge Was Created

- New diagnostics added
- New understanding captured
- Ticket still open — that's OK

Note:
  John: The investigation grew the Makefile. New diagnostic targets, new
  understanding captured. The ticket isn't fixed -- but the project knows
  more than it did before you started. That's **knowledge creation**.
  You know, Hardy, we have a whole room of engineers here. Maybe they
  have ideas for how to get that storage moved over to NVMe?

---

<!-- Speaker: Both -->

# Mob Programming!

- Solutions not required
- We are creating knowledge

Note:
  Hardy: What a great idea! Let me start up the project now.
  John: There's an open mystery — DEVEXP-309. We have
  the Makefile. You have questions. Let's see what we find.
  Hardy: I'll invite our robot friend.
  [demo]
  
---

# Retrospective

- `make help`
- You pick the path
- Discovery is the point

Note:
  John: Let's take a quick look back at what just happened.

  - *What was the first thing Claude did when I opened that project?*
    Ran `make help` -- same as any new engineer.
  - *What made the investigation targets findable?*
    The names. `debug-docker-storage`, `debug-ephemeral-storage` -- the
    intent is right there.
  - *If we hadn't had those targets, what would Claude have had to do?*
    Read the whole codebase and guess.
  - *So who did we actually write that Makefile for?*
    Sage. But it turns out...

---

<!-- Speaker: Hardy -->

# AI Agents Need What Humans Need

- Discoverability
- Clear vocabulary
- Executable intent

Note:
  Hardy: You just saw it. The same Makefile that helps Sage, helps Claude.
  Discoverability, clear vocabulary, executable intent -- those aren't AI
  features. They're good engineering. Make gives you all three.

---

# Make Amplifies Good Practices

- Strong executable knowledge → better human outcomes
- Strong executable knowledge → better AI outcomes
- The practices are the same

[Simon Willison, "Vibe engineering"](https://simonwillison.net/2025/Oct/7/vibe-engineering/)

Note:
  Hardy: Simon Willison coined the term "vibe engineering" -- seasoned
  professionals accelerating their work with LLMs while staying
  proudly and confidently accountable for the software they produce. His core
  observation: **AI tools amplify existing expertise**. Make gives that
  expertise somewhere to land. John's going to show you what that looks
  like when you push it to the limit.

---

<!-- Speaker: John -->

# Put Avalon in Production

Note:
  John: This is what I was asked to do. Avalon is an audio/visual
  repository built on top of Samvera, or some of you might know Samvera
  under its old name: Hydra. I'm an active member of the Samvera
  community, but I haven't looked at Avalon in years. Like many projects,
  their docs have drifted. There is no longer any current "here's how to
  run this in production" documentation. Hardy suggested that I try to
  get Codex to one-shot it. So I did.

---

# Make This a Proper Prod Environment

- Use a Makefile
- Make me proud

Note:
  This is the prompt. I'll skip the part where I leave you in suspense: it worked.

---

# First Attempt

- Production Docker Compose stack
- Full Makefile with `make help`
- Env guards, Rails hardening, secrets management, tests

Note:
  Duration: ~1 min
  Beat: Walk through what came back. Not a sketch — a complete,
  production-ready setup. Immutable containers, healthchecks, restart
  policies, proper secrets management. On the first try.
  Source: transcripts/one-shotting-Avalon-with-MakefileSage-and-Codex.md

---

# Why It Worked

- Existing Docker Compose + Rails structure gave Codex context
- Makefile Sage gave the project coherent structure
- The Makefile gave tests a natural home

Note:
  John: Avalon already had Docker Compose files, a Rails structure, existing
  conventions. Codex could reason from all of that. The instruction to use a
  Makefile triggered Makefile Sage, which gave the whole project a coherent
  structure and a discoverable interface. Two words later -- "add tests" --
  Codex looked at the existing RSpec suite, understood the conventions, and
  wrote tests that checked the Makefile's own contracts. The Makefile wasn't
  the output. It was the skeleton that made everything else snap into place.
  We'll tell you more about Makefile Sage at the end. Speaking of Sage,
  let's check in with him now that he's been working with Make for a while.

---

<!-- Speaker: Both -->

![](sage-after-make.png)

Note:
  John: Remember Sage? Three AM Saturday, alone with five runbooks that
  didn't help. That was the system failing him. Here's the thing about
  people like Sage -- they don't just survive that night. They fix the
  system. They add the target that would have saved them. They capture
  what they learned. The next time someone needs a rollback at 3 AM, the
  project remembers. Sage is in the office now. The knowledge he built
  is still running.

---

# Can Your System Teach the Next Person (or entity)?

Note:
  - Hardy: *Think about your project right now. If Sage joined your team tomorrow,
    what would he run first?*
  - Hardy: *Does `make help` tell him something useful? Or does he have to ask?*
  - John: *When you leave -- what does the project remember?*

  John: Can your system teach the next person?

---

# https://github.com/InfraLore

<!-- markdownlint-disable MD013 -->
- **[Make for DevOps](https://github.com/InfraLore/make_for_devops)** -- free book, BSD-0, PDF + epub
- **[Makefile Sage](https://github.com/InfraLore/makefile-sage)** -- Claude Code plugin
- **[Make Cheatsheet](https://github.com/InfraLore/make_cheatsheet)** -- coming soon
<!-- markdownlint-enable MD013 -->

Note:
  Hardy: We have some resources for you, at that GitHub organization
  linked on the slide. Including a book *Make for DevOps*, the Claude and
  Codex plugin *Makefile Sage* that we mentioned earlier, and a cheatsheet
  for Make. We hope you use them.

---

# Questions?

- https://github.com/InfraLore/galaxy-brain-devops
- https://github.com/InfraLore/
---

# Acknowledgements

- *Sage (original photo)*: [Nimi Diffa](https://unsplash.com/photos/man-smiling-lR0f4PSt52s),
  Unsplash
- *Sage (subsequent images)*: Gemini Flash-Lite, Google, 2025
- *Book cover*: GPT-5, OpenAI, 2025. CC0 1.0 Universal
- *"Vibe engineering"*: Simon Willison, simonwillison.net/2025/Oct/7/vibe-engineering/
- *"Vibe coding"*: Andrej Karpathy, 2025
- *Samvera and Avalon communities*: samvera.org
- *mkslides*: Martijn Saelens and contributors
- *reveal.js*: Hakim El Hattab and contributors
