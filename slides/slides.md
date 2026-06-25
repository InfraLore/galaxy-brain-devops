---
title: "Galaxy Brain DevOps"
author: "Hardy Pottinger & John H. Robinson, IV"
---

<!-- Speaker: Both -->

# Galaxy Brain DevOps

Hardy Pottinger  
John H. Robinson, IV

### UC-Tech 2026

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
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

deploy: ## Deploy the current build to staging
	./scripts/deploy.sh staging

rollback: ## Roll back the last deployment safely
	./scripts/rollback.sh
```

Note:
  A Makefile is a collection of targets. Each target is a named command -- or
  a sequence of commands -- you can run. The `##` comment is a convention:
  it's what `make help` reads to tell you what each target does. A name, a
  description, and something to run.

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
  perfect. The Makefile remembered what the we forgot. That's **knowledge
  preservation**. Now let me show you **knowledge creation**.

---

<!-- Speaker: Hardy -->

# DEVEXP-309

- NVMe not mounting on all nodes
- Root EBS at 50-90%
- Should be under 5%

Note:
  Duration: ~45 seconds
  Beat: Set up the mystery. The devex-actions-cluster should be using NVMe for
  Docker storage. Root EBS should be nearly empty. It's not. Why?
  Source:
  transcripts/DEVEXP-309-NVMe-Mount-Investigation-and-Containerd-Root-Directory-Diagnosis.txt

---

# Investigate With the Makefile

- `debug-docker-storage`
- `debug-ephemeral-storage`
- `recycle-node`

Note:
  Duration: ~1 min
  Beat: Walk through the investigation using existing targets. Each one was
  added by someone who hit a similar problem before. The Makefile already knew
  how to look at this.
  Source:
  transcripts/DEVEXP-309-NVMe-Mount-Investigation-and-Containerd-Root-Directory-Diagnosis.txt

---

# Five Bugs Found

1. Older LT versions on some nodes
2. Userdata exits early (set -euo pipefail)
3. DirectoryOrCreate masks mount failures
4. blkid suppresses errors
5. grep device filter is fragile

Note:
  Duration: ~1 min
  Beat: The investigation turned up 5 distinct bugs in the launch template,
  userdata script, and values.yaml. This is the kind of layered complexity
  that only emerges through careful hands-on investigation.
  Beat: Key point: the ticket is still open. We found the bugs. We haven't
  fixed them yet. That's OK — that's where Act IX comes in.
  Transition: But here's what I want you to notice: the investigation grew the
  Makefile.
  Source:
  transcripts/DEVEXP-309-NVMe-Mount-Investigation-and-Containerd-Root-Directory-Diagnosis.txt

---

# Knowledge Was Created

- New diagnostics added
- New understanding captured
- Ticket still open — that's OK

Note:
  Duration: ~45 seconds
  Beat: The Makefile isn't a museum. It's a living system. The investigation
  added new targets, new diagnostics, new understanding. The problem isn't
  solved — but the project knows more than it did before.
  Transition: And speaking of that open ticket — we'd like your help with it.

---

<!-- Speaker: Both -->

# Your Turn

Note:
  Duration: ~30 seconds
  Beat: Both speakers. Hardy: "We're going to open the EKS project right now
  and let you guide us." John: "There's an open mystery — DEVEXP-309. We have
  the Makefile. You have questions. Let's see what we find."

---

# The Mystery Is Still Open

- `make help`
- You pick the path
- Discovery is the point

Note:
  Duration: ~7-8 min (live demo)
  Beat: This slide stays up during the live demo. Audience suggests
  investigation directions. Speakers run commands, narrate findings, add to
  the Makefile live if anything new emerges.
  Beat: Success condition: the audience sees the project teaching. Resolution
  is a bonus.
  Fallback: If demo environment is unavailable, walk through the DEVEXP-309
  transcript instead — the story is strong enough to carry without a live
  terminal.

---

<!-- Speaker: Hardy -->

# An Unexpected Observation

Note:
  Duration: ~30 seconds
  Beat: Hardy: "Something happened during these investigations that I didn't
  expect." Pause. Let the audience wonder what's coming. This act is short but
  lands a big idea.
  Source: resources/20-the_future_of_make_in_devops.md

---

# AI Agents Need What Humans Need

- Discoverability
- Clear vocabulary
- Executable intent

Note:
  Duration: ~1 min
  Beat: The observation: when Hardy brought Claude into the IMDS
  investigation, it worked because the Makefile gave the AI the same things it
  gives humans. A good Makefile is already a good AI interface. You don't need
  to do anything special.
  Source: resources/20-the_future_of_make_in_devops.md

---

# Make Amplifies Good Practices

- Strong executable knowledge → better human outcomes
- Strong executable knowledge → better AI outcomes
- The practices are the same

Note:
  Duration: ~1 min
  Beat: "Vibe engineering" — seasoned professionals using AI to accelerate
  while staying accountable. Make doesn't replace judgment. It creates the
  conditions where judgment, human or AI, can operate effectively.
  Transition: John's going to show you what that looks like when you push it
  to the limit.
  Source: resources/20-the_future_of_make_in_devops.md

---

<!-- Speaker: John -->

# One Instruction

Note:
  Duration: ~30 seconds
  Beat: John: "I want to tell you about Avalon." Short pause. "I gave Codex
  one prompt."

---

# Make This a Proper Prod Environment

- Use a Makefile
- Make me proud

Note:
  Duration: ~1 min
  Beat: Read the prompt aloud, slowly. Let it land. The audience should be
  skeptical — that's too vague to work, right? John: "First attempt."
  Source: transcripts/one-shotting-Avalon-with-MakefileSage-and-Codex.md

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

- The project already had executable knowledge
- Codex reasoned from what the project knew
- One instruction was enough

Note:
  Duration: ~1 min
  Beat: The thesis in action. Avalon already had a Rails structure, Docker
  conventions, existing compose files — executable knowledge the AI could
  reason from. The Makefile wasn't magic. It was the foundation that made the
  magic possible.
  Transition: Which brings us back to Sage.
  Source: transcripts/one-shotting-Avalon-with-MakefileSage-and-Codex.md

---

<!-- Speaker: Both -->

![](sage-after-make.png)

Note:

---

# Can Your System Teach the Next Person?

Note:
  Duration: ~1 min
  Beat: The question that lands the whole talk. Not "do you have
  documentation?" — "can your system teach?" There's a difference. Sit on it
  for a beat. Let the audience answer it internally.
  Beat: Hardy and John can share this slide — alternate the question with eye
  contact to the room.

---

# https://github.com/InfraLore

<!-- markdownlint-disable MD013 -->
- **[Make for DevOps](https://github.com/InfraLore/make_for_devops)** -- free book, BSD-0, PDF + epub
- **[Makefile Sage](https://github.com/InfraLore/makefile-sage)** -- Claude Code plugin
- **[Make Cheatsheet](https://github.com/InfraLore/make_cheatsheet)** -- coming soon
<!-- markdownlint-enable MD013 -->

Note:
  Duration: ~30 seconds
  Beat: Low-key. These are free. The book exists because we wrote it the same
  way we write Makefiles -- incrementally, out in the open.

---

# Questions?

---

# Acknowledgements
