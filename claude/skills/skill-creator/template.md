---
name: [SKILL_NAME]
description: >
  [BRIEF DESCRIPTION: What this skill does and when to use it. Include specific trigger scenarios.
  Example: "Django ORM optimization for N+1 queries and performance. Use when queries are slow,
  analyzing query counts, or implementing select_related/prefetch_related. Triggers: 'ORM slow',
  'too many queries', 'optimize database', 'N+1 problem'"]
---

# [SKILL_NAME] - [One-Line Purpose]

## Overview

[1-2 paragraphs explaining:
- What problem this solves
- Why it matters
- What domain/technology this covers

Example:
"Working with Django ORM often leads to N+1 query problems where a single query spawns hundreds 
of follow-up queries. This skill provides patterns for identifying, analyzing, and fixing query 
performance issues using Django's relationship loading strategies."]

## When to Use This Skill

- [Specific scenario 1 - be concrete]
- [Specific scenario 2 - include symptoms user would see]
- [Specific scenario 3 - mention specific tools/commands]

**Don't use this skill for:**
- [Anti-scenario 1 - when something else is better]
- [Anti-scenario 2 - when this is overkill]

## Prerequisites

[List dependencies, tools, configuration needed]

**Installation:**
```bash
# Add actual installation commands
pip install package --break-system-packages
sudo apt-get install tool
```

**Configuration:**
```bash
# Any setup steps required
export VARIABLE=value
```

## Decision Tree

[Optional but recommended: Add a decision tree for when there are multiple paths]

**Choose your workflow based on:**

1. **[Scenario A]** → Use [Workflow X]
   - When: [specific condition]
   - Best for: [use case]

2. **[Scenario B]** → Use [Workflow Y]
   - When: [specific condition]
   - Best for: [use case]

3. **[Scenario C]** → Use [Workflow Z]
   - When: [specific condition]
   - Best for: [use case]

## Workflow

### Step 1: [First Action]

[Brief explanation of what we're doing and why]

```bash
# Concrete command with inline comments explaining flags
command --flag value --option setting
```

**Expected output:**
```
[Show what the user should see]
```

**What this does:**
- [Explain the result]
- [Any side effects to be aware of]

### Step 2: [Second Action]

[Explanation of this step]

```python
# Actual code example - not pseudocode
import library

# Set up with specific parameters
result = library.do_thing(
    param1="value",  # What this param controls
    param2=True      # When to enable this
)

# Process result
for item in result:
    process(item)
```

**Key parameters:**
- `param1`: What it does and when to use different values
- `param2`: Boolean flag - enable when [condition]

**Common variations:**
```python
# Variation 1: When you need [different outcome]
library.alternative_approach(param=value)

# Variation 2: For [edge case]
library.edge_case_handler(special_param=value)
```

### Step 3: [Third Action]

[Continue the pattern - keep steps focused and actionable]

```bash
# Next command in the workflow
another_command | pipe_to_tool
```

### Step 4: [Final Action]

[Wrap up the workflow]

```bash
# Verification command
verify_command --check
```

## Common Gotchas

### Gotcha 1: [Problem Name]

**Symptom:** [What the user sees - error message, unexpected behavior, etc.]

**Cause:** [Why this happens - be specific about the underlying issue]

**Solution:**
```bash
# Fix command with explanation
fix_command --parameter value
```

**Prevention:** [How to avoid this in the future]

### Gotcha 2: [Another Problem]

**Symptom:** [What manifests]

**Cause:** [Root cause]

**Solution:**
```bash
# Another fix
```

### Gotcha 3: [Performance Issue]

**Symptom:** [Slowness, memory issues, etc.]

**Cause:** [Why it scales poorly]

**Solution:**
```bash
# Optimized approach
```

**Benchmarks:** [If applicable, show performance difference]

## Examples

### Example 1: [Common Use Case Name]

**Scenario:** [Describe a real-world situation where this applies]

**Setup:**
```bash
# Any initial state needed
setup_command
```

**Implementation:**
```bash
# Step-by-step working example
step1 --flag value
step2 --another-flag
step3
```

**Result:** [What this achieves and how to verify it worked]

```bash
# Verification
check_result_command
```

### Example 2: [Edge Case or Complex Scenario]

**Scenario:** [Describe a more complex situation]

**Challenge:** [What makes this tricky]

**Solution:**
```python
# More elaborate code example for complex case
import required_modules

# Handle the complexity
def solve_edge_case():
    """
    Handles [specific edge case] by [approach].
    """
    # Implementation with comments
    result = complex_operation()
    return process(result)
```

**Why this works:** [Explain the approach]

### Example 3: [Integration Example]

**Scenario:** [Show how this works with other tools/systems]

```bash
# Combined workflow showing integration
tool1 | this_skill_command | tool2
```

## Anti-Patterns

### ❌ BAD: [Common Mistake 1]

```python
# Code that looks right but fails
def wrong_approach():
    bad_pattern_here()
    return result
```

**Why it fails:** 
- [Reason 1 why this breaks]
- [Reason 2 about performance/correctness]
- [Consequence if someone does this]

### ✅ GOOD: [Correct Approach 1]

```python
# Correct implementation
def right_approach():
    good_pattern_here()
    return result
```

**Why it works:**
- [Reason 1 why this is better]
- [Reason 2 about benefits]

---

### ❌ BAD: [Common Mistake 2]

```bash
# Wrong command or flag usage
wrong_command --incorrect-flag
```

**Problem:** [What breaks and why]

### ✅ GOOD: [Correct Approach 2]

```bash
# Right way to do it
correct_command --proper-flag
```

**Benefit:** [What this achieves correctly]

## Troubleshooting

| Error | Cause | Fix |
|-------|-------|-----|
| `[Specific error message]` | [Root cause explanation] | `fix_command --flag` |
| `[Another error message]` | [Why this happens] | [Step-by-step fix] |
| `[Performance issue]` | [What's causing slowness] | [Optimization approach] |

**Debug mode:**
```bash
# Enable verbose output for troubleshooting
command --debug --verbose
```

**Log locations:**
- Main logs: `/path/to/logs`
- Error logs: `/path/to/error/logs`
- Debug output: `command 2>&1 | tee debug.log`

## Performance Considerations

**Scale factors:**
- [What limits performance - data size, connection count, etc.]
- [When you'll hit bottlenecks]

**Optimization tips:**
- [Tip 1 with specific threshold: "Use batch processing for >1000 items"]
- [Tip 2 with concrete advice: "Enable caching to reduce latency by 80%"]
- [Tip 3 about resource usage: "Each connection uses ~10MB RAM"]

**Benchmarks:**
```bash
# Performance testing command
time command --with-options

# Expected: ~500ms for 1000 items
# Scales: O(n log n)
```

## Advanced Usage

### Advanced Technique 1: [Name]

[When you'd need this]

```bash
# Advanced command with explanation
advanced_command --expert-flag --complex-option value
```

### Advanced Technique 2: [Name]

[Another power-user feature]

```python
# Advanced code pattern
def advanced_pattern():
    # Implementation
    pass
```

## Integration with Other Tools

**Works well with:**
- `[other-skill-name]`: Use together when [scenario]
- `[another-tool]`: Chain with `tool | this_command | tool2`

**Conflicts with:**
- `[incompatible-tool]`: Don't use together because [reason]

## Related Skills

- `other-skill-name` - Use for [related but different scenario]
- `another-skill` - Use when [different need but complementary]
- `third-skill` - Prerequisite for [advanced workflow]

## Additional Resources

[Optional: Only if absolutely necessary. Skills should be self-contained.]

**Supporting files in this skill:**
- `scripts/helper.py` - [What it does]
- `templates/config.yaml` - [Configuration template]

**External references:**
- [Official docs link] - For complete API reference
- [Community resource] - For additional examples

## Maintenance Notes

**Last updated:** [DATE]

**Known issues:**
- [Issue 1 and workaround]
- [Issue 2 and status]

**Planned improvements:**
- [Feature or fix planned]
- [Enhancement under consideration]

---

## Template Usage Notes

[Remove this section when creating a real skill]

**Fill in all bracketed placeholders:**
- `[SKILL_NAME]` - lowercase-with-dashes format
- `[BRIEF DESCRIPTION]` - Appears in YAML frontmatter
- `[One-Line Purpose]` - Concise value proposition
- All `[placeholder text]` throughout

**Quality checklist before saving:**
- [ ] Description has specific trigger keywords
- [ ] Overview explains the problem clearly
- [ ] "When to Use" has concrete scenarios
- [ ] Prerequisites list actual installation commands
- [ ] Workflow has numbered steps with real code
- [ ] At least 2 examples (common + edge case)
- [ ] Gotchas section with symptoms + solutions
- [ ] Anti-patterns show BAD vs GOOD code
- [ ] No philosophical rambling - stay concrete
- [ ] Prescriptive language ("Use X" not "Consider X")
- [ ] Under 500 lines (move extras to supporting files)
- [ ] All code examples are runnable, not pseudocode

**Style guidelines:**
- Be prescriptive: "Use X" not "You might consider X"
- Show concrete examples: actual commands, not concepts
- Document gotchas: things that will bite users
- Include anti-patterns: show what NOT to do
- Keep it scannable: headers, code blocks, tables
- No hedging: "This works" not "This should work"
