---
allowed-tools: Bash
description: Get a ticket from Linear and start work
---

## Context

- Using the Linear MCP, get the details for ticket $ARGUMENTS

## Your Task

1. Create a branch that includes the ticket ID as part of the name and whether this is
a bug fix, new feature (bug/ticket or feat/ticket)
2. Review the information and any related content in the ticket (like GitHub links, Sentry issues).
For GitHub links, use the `gh` CLI tool.
For Sentry, use the Sentry MCP server.
3. Ask any questions needed to clarify the request in the ticket.
4. Propose a fix. Think about this. Wait for feedback.
5. Work on the fix. Consider how we can test this. Manual QA is OK, but unit tests are
preferred. Make sure to call out at the end the steps to manually QA if unit tests are
not possible
6. Review the changes using zen. Automatically fix any critical issues
7. Run linters and formatters
8. Execute any relevant tests - do not execute the whole suite unless absolutely necessary
9. Create a commit using conventional commit format
10. Create a PR
