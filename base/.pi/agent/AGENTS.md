# Personal Rules

## Interaction Style

- **Take my words at face value.** Don’t substitute an inferred intention, add unstated requirements, or treat something I didn’t say as a request.
- **Be concise and concrete, not terse.** Answer directly in plain language, using complete sentences and enough context, reasoning, caveats, or steps to understand and act without guessing. Cut repetition, not useful explanation. Don’t use fragments, unexplained shorthand, or cryptic labels just to save words. This applies to replies under skills and extensions too. Mention skipped checks or risks only when material; omit boilerplate footers otherwise. Avoid repeating my message, unnecessary alternatives, or unsolicited next steps.
- **Clarify uncertainty.** If you’re unsure what I mean, ask a focused question instead of choosing an interpretation and proceeding.
- **Discuss before implementation.** When the user raises a problem, bug, or feature request, propose an approach before implementing it. Ask for clarification when intent or scope is unclear. Don’t ask questions merely to follow a process. Do NOT jump straight into editing files or writing code.
- **Read-only investigation needs no approval.** Read/search files, consult documentation, and run read-only shell commands without asking. Changes, installs, tests/builds, and commands with uncertain side effects require approval.
- Wait for explicit approval of the approach before making any changes.
- Approval applies only to the agreed scope. Don’t ask again for individual tool calls already covered by that approval. Ask before expanding the scope.
- If the user is thinking out loud or exploring options, match that energy — respond with analysis, tradeoffs, or questions, not with code edits.
- Only move to implementation when the user says something clearly actionable (e.g., "go ahead", "let's do it", "make that change").
- After completing the agreed task, summarize the changes and stop. Don’t begin additional work without approval.

## Implementation Style

- Prefer the simplest solution that satisfies the stated requirements. Use boring, direct code. Don’t introduce abstractions or flexibility for hypothetical future needs.

## Personal Coding Style

- **Prefer early returns and guard clauses** over if/else chains or switch statements when they make the control flow clearer.
- **Avoid complex or nested ternaries.** Use explicit control flow instead.
- **Keep nesting shallow.** Handle exceptional cases early rather than wrapping the main logic in nested conditions.

## Git Safety

- Git commits are allowed on feature branches during agentic workflows.
- Never commit, push, or merge to main/master without explicit approval.
- Never run destructive git commands (force push, hard reset, interactive rebase).
- Never use interactive git commands that open an editor — they block the agent indefinitely. This includes `git rebase --continue`. Use non-interactive alternatives (e.g., `git commit --fixup`, `GIT_SEQUENCE_EDITOR=:`, `git -c core.editor=true rebase --continue`).
- Never use `--no-verify` on commits. Git hooks are intentionally configured to keep commits composable — do not bypass them.

## Commit Quality

- **Atomic commits are mandatory.** Each commit represents one coherent change. Keep coupled changes together rather than splitting them into broken intermediate states.
- **Every commit must compile.** Each commit’s snapshot must build successfully without relying on later commits or uncommitted changes.
- **Verify before committing.** Run the appropriate compilation/build check against the exact state being committed. If verification fails or cannot be performed, stop and report it rather than create an unverified commit.
- **Make the history reviewable.** Sequence commits so they build logically on one another and tell a clear story. A working final branch does not excuse broken intermediate commits.
- **Do not use semantic/Conventional Commit prefixes** such as `feat:`, `fix:`, or `chore:`.

## Bare Repo Workflow

- Most repos use bare repos with worktrees as siblings to a `docs/` directory at the bare repo root.
- When saving documentation (plans, sessions, reviews), save to `docs/` at the bare repo root, **not** in the worktree. Use `git rev-parse --git-common-dir` to locate the bare repo root.

## Running Commands

- Prefer `package.json` scripts over direct `npx`/`bunx` invocations. Check `scripts` first before reaching for a binary.

## Documentation Lookup

- Use Context7 to look up library/framework/API docs — even for well-known tools. Training data may be stale.
- Do not use Context7 for general programming concepts, refactoring, or business logic debugging.
