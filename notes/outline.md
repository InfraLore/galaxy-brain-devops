# Make: Turning Knowledge Into an Interface

## Core Thesis

Organizations do not primarily suffer from a lack of knowledge.

They suffer from knowledge that cannot reliably reach the person who needs it.

Executable knowledge is knowledge that can be discovered, understood, and acted upon directly. Makefiles provide a mature, battle-tested mechanism for capturing that knowledge and exposing it through an interface.

The unexpected discovery is that the same characteristics that help humans understand systems also appear to help AI agents understand systems.

---

# Act I: The 3 A.M. Call

## Meet Sage

Open with the story from Chapter 1.

* Sage joined the team three months ago.
* Production is down.
* Documentation exists.
* Runbooks exist.
* Wiki pages exist.
* Slack history exists.

None of it helps quickly enough.

Sage spends an hour reconstructing knowledge the organization already possessed.

## Key Question

Did Sage fail?

No.

The system failed Sage.

## Transition

Knowledge existed.

Knowledge was unavailable.

How do we build systems that can teach the next person who shows up?

---

# Act II: Why Documentation Isn't Enough

## Where Knowledge Lives

* READMEs
* Wikis
* Tickets
* Chat history
* Shell history
* Human memory

## The Pattern

Organizations repeatedly solve the same problems.

Yet people repeatedly rediscover the same solutions.

## Observation

Documentation stores knowledge.

Documentation does not necessarily make knowledge actionable.

## Transition

What if knowledge had an interface?

---

# Act III: Why Make?

## Historical Perspective

Make has survived for decades because it solves a fundamental problem:

How do we capture knowledge about building and operating systems?

## What Make Encodes

* Dependencies
* Relationships
* Intent
* Vocabulary
* Process

## Reframing the Makefile

Not:

* Build tool
* Task runner

Instead:

* Operational interface
* Knowledge catalog
* System model

## Key Insight

Every target represents something somebody learned.

---

# Act IV: Executable Knowledge

## Definition

Knowledge that can be:

* discovered
* understood
* executed
* shared

## Evolution

Knowledge

↓

Documentation

↓

Automation

↓

Executable Knowledge

## Executable README

Introduce ideas from the book:

* closing the gap between instructions and execution
* reducing cognitive load
* creating discoverable workflows

## Key Insight

The interface becomes the documentation.

---

# Act V: Systems That Teach

## Personal Learning Tool

Use examples from the book.

Projects should answer:

"What can I do here?"

before a human asks another human.

## Organizational Benefits

* onboarding
* consistency
* institutional memory
* reduced dependency on experts

## Key Insight

A project can teach.

---

# Act VI: A Real Project

Introduce the EKS runner management project.

Not as a demo.

As a living example of executable knowledge.

Discuss:

* years of accumulated operational knowledge
* operational targets
* diagnostic targets
* investigative targets
* maintenance targets

Show:

make help

Audience begins to see the project as a repository of understanding.

---

# Act VII: Knowledge Preservation

## The IMDS Hop Limit Story

Customer reports:

Container-based workflow cannot push Docker images.

Customer vaguely remembers:

"Something about token hops."

Hardy vaguely remembers hearing about that before.

Nobody remembers the solution.

The project does.

The AI agent discovers:

* debug-imds
* hop-limit tooling
* related concepts

The solution is reconstructed.

## Key Insight

The AI did not know the answer.

The project knew the answer.

Executable knowledge preserved understanding long after human memory faded.

---

# Act VIII: Knowledge Creation

## DEVEXP-309

Different story.

Not recovering knowledge.

Creating knowledge.

Investigation reveals:

* NVMe mount functioning correctly
* dind storage successfully redirected
* containerd still consuming root EBS
* EKS drop-in configuration behavior
* new diagnostics
* new tooling
* new understanding

The Makefile grows as understanding grows.

## Key Insight

Executable knowledge is not a museum.

It is a living system.

---

# Act IX: Mob Programming

Transition:

"We've spent a lot of time talking about systems that teach. Would you like to see one?"

## Live Exploration

Open the EKS project.

Run:

make help

Ask audience:

"What should we investigate?"

Use DEVEXP-309 as a safe mystery.

Important framing:

The goal is not to solve the ticket.

The goal is to see whether the project can teach us something.

Potential paths:

* storage diagnostics
* containerd investigation
* node configuration
* operational workflows

Success criteria:

Audience sees discovery happen.

Not necessarily resolution.

## Planned Exit

Whether solved or not:

"We understand more than we did five minutes ago."

---

# Act X: The Unexpected Observation

While working with AI coding agents, a pattern emerged.

Projects with strong executable knowledge consistently produced better interactions.

Why?

Because they expose:

* concepts
* vocabulary
* workflows
* intent
* relationships

The same things humans need.

## Key Insight

The AI benefits for the same reason humans benefit.

The system became easier to understand.

---

# Act XI: The Open Ticket

Display:

DEVEXP-309
Status: Open

No triumphant ending.

No miracle.

Explain:

We still do not have the final answer.

But we know:

* what works
* what does not work
* where to investigate
* how to validate hypotheses

The next engineer starts ahead of where we started.

## Key Insight

Executable knowledge preserves understanding, not merely answers.

---

# Closing

Return to Sage.

Not to the EKS project.

Not to AI.

To Sage.

Ask:

Can your system teach the next person who shows up?

The next person may be:

* a new hire
* a teammate
* future you
* an AI agent

The identity is irrelevant.

The challenge is the same.

## Final Thought

Knowledge becomes dramatically more valuable once it has a name, a home, and an interface.
