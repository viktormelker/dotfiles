---
name: write-pr-description
description: >-
  Write pull request descriptions in Viktor's style and put that text in the
  PR body: a short # Background that says what is wrong and why, then # Changes
  as short verb-led bullets. Extra sections only when there is leftover work,
  a real test, or a tradeoff worth flagging. Use when opening a PR, updating a
  PR body, running gh pr create or gh pr edit, or when the user asks for a PR
  description. Use this instead of a Summary/Test plan template, a Release
  considerations section, or a low/medium/high risk rating.
argument-hint: "[optional: PR number, branch, ticket, or a short brief]"
allowed-tools:
  - Read
  - Bash
  - Glob
  - Grep
---

# Write PR descriptions

Write the description Viktor would write by hand. The title names the change. The body says why, then what we did. Match the length to the diff: a few lines of code get a sentence or two, and a design change can run long because the reasoning is the review.

When you open or update a pull request, this markdown is the PR body. Pass it to `gh pr create` or `gh pr edit`. Do not add a Summary, a Test plan, a risk rating, or a "Made with" footer. Cursor may wrap the body in `CURSOR_AGENT_PR_BODY` comments. Leave that wrapper as the tool adds it. The text inside it is still this description.

When the user only wants to read the description, print it and leave the PR alone.

## Gather context

- Read `git log` and `git diff` against the base branch. Describe what is in the diff.
- Take ticket keys from the branch name, the commits, or the user. Link a Linear, Sentry, Slack, or PR URL only when you have the real URL.
- If a body already exists, keep the prose he wrote. Drop `<!-- CURSOR_SUMMARY -->` blocks, `<!-- CURSOR_AGENT_PR_BODY_* -->` blocks, and "Made with Cursor" / "Generated with Claude" footers. Those are not the style.

## Shape

**The title already says it.** One or two sentences, no headings. Add the why the title left out. Do not repeat the title.

**The why needs a paragraph.** `#` headings, in this order:

```markdown
# Background

<why this exists>

# Changes

- <what we did>
```

### Background

What is wrong or missing, and why we want it fixed. Write as "we". Two to four sentences is the usual length. Add the history when the diff does not show it: we tried this before, a setting makes it impossible, one environment was missed.

Put each link in the sentence it belongs to. Skip a `# See also` block unless several related links would clutter the paragraph.

### Changes

Behaviors, not files. Bullets start with a verb: Add, Use, Remove, Change, Update, Set, Stop, Move. No trailing period. One bullet per behavior. Nest a bullet when one change has steps. A single change can be one sentence under the heading, with no bullet.

A `- [ ]` means that part is still open. Check it when it is done.

## Extra sections

Add one only when it has something to say. Same `#` heading.

- `# TODO` — still open before merge, as checkboxes.
- `# Testing` — a check that was run, or one still waiting. Name the environment and the id when there is one. Skip when nothing was tested and nothing is waiting.
- `# Caveats` — a limitation the reviewer would otherwise miss.
- `# Future work` — one concrete follow-up.
- `# Alternative solutions` — another approach, and why this one won.
- `# See also` — related PRs or docs that did not fit in Background.
- `# Pros` and `# Cons` — a migration or design PR where the tradeoff is the review.

## Voice

- "We", and the specific name in backticks: the event, the config key, the service.
- The reason stays in Background. Changes stays flat.
- When the conclusion changed, strike the old sentence and say what replaced it.
- Spoken and short. Not release notes.

## Do not add

These come from generated descriptions:

- `## Summary`, `## Test plan`, `## Validations`, `## Release considerations`
- "Ready to release", "Low risk", "Medium risk"
- A file-by-file changelog, a commit list, or a reviewer checklist
- A ticket, Sentry, or Slack link you do not actually have

## Examples

**Title carries the change:**

```markdown
Contains user specific commands
```

```markdown
In a previous PR we merged the wrong version numbers in the documentation. This PR fixes that.
```

**Ordinary change:**

```markdown
# Background

We need to set the kafka settings for the API deployment since it is producing kafka events.
When we added that we forgot to update this properly for fyndiq.

# Changes

- Use correct settings for bring api in fyndiq
- Add datadog spans on top level event handler functions
```

**The reason moved, and a check is still open:**

```markdown
# Background

We disallowed merchants from cancelling orders, but it can still happen when the fulfillment deadline is reached. ~~Therefore we must cancel the order in bring if it is canceled in qlty.~~
After discussing it with bring, cancelling is most likely not possible with the current configuration. This is still worth landing. Without it a cancelled order is silently ignored, and if the bring settings change later the cancel call is already here.

# Changes

- Handle the `OrderCanceled` event by saving it
- Call bring's cancel-order endpoint

# TODO

- [ ] Test in integration. Order `b300b604-1072-468b-b6a8-2a995d452fc9` is created, still waiting on an answer from bring
```
