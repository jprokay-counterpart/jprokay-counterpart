---
allowed-tools: Bash
description: Review the comments on a PR and propose fixes
argument-hint: [prId]
---

## Context

- Github ticket: !gh api repos/:owner/:repo/pulls/$ARGUMENTS/comments --jq '.[] | {author: .user.login, file: .path, line: .line, body: .body}'

## Your Task

1. Review all unresolved comments on the ticket against the current code
2. Update the code to address the comment. If there is code that already
addresses it, then continue. If unsure if a comment should be addressed,
ask for feedback
3. Use zen to review the changes against the comments to ensure they are
properly addressed
4. Output a report of the comment, the changes made that address the
comment, and any not addressed. Wait for feedback.
5. Create a conventional commit with the changes
6. Push the changes

