---
name: Skill Creator 
description: >
  Use when creating new skills, improving existing skills, or when a complex 
  repeatable task emerges that lacks documented expertise. Triggers: "create a skill", 
  "we should document this", "make this reusable", working on complex domain-specific 
  tasks without existing skill coverage (Django ORM, Kubernetes, API design, etc.)
---

# Skill Creator

## Overview

Maintains and grows the skill library by identifying opportunities for new skills and ensuring they follow proven patterns. Uses the docx skill as the gold standard for skill architecture.

IMPORTANT: ALWAYS PERFORM THESE STEPS
1. VALIDATE NEED - ONLY CONTINUE TO NEXT STEP IF NEEDED. SEE SECTION `Don't create skills for`
2. CHECK FOR EXISTING SKILLS - MOVE TO EDIT FLOW IF EXISTING SKILL EXISTS
3. SCAFFOLD
4. GATHER INTELLIGENCE
5. CUSTOMIZE THE SKILL

## Scaffold Script

Run the [scaffold script](./scripts/scaffold.sh) to create the new skill:

```bash
# For project skill
sh ~/.claude/skills/skill-doctor/scripts/scaffold.sh \
  --path .claude/skills \
  django-orm-optimization
```

This creates:
```
~/.claude/skills/django-orm-optimization/
├── SKILL.md              # Pre-filled template
├── scripts/              # Optional: for helper scripts
└── templates/            # Optional: for config templates
```

```bash
# For personal skill
sh ~/.claude/skills/skill-doctor/scripts/scaffold.sh \
  --path ~/.claude/skills \
  django-orm-optimization
```
## When to Use This Skill

**Automatic triggers:**
- User explicitly asks to create/improve a skill
- Working on complex task that will likely recur
- Domain-specific patterns emerge (ORM optimization, K8s debugging, API design)
- User says "we should document this" or "let's make this reusable"

**Judgment call triggers:**
- Task has non-obvious gotchas
- Requires specific tool chains or workflows
- Involves institutional knowledge worth preserving
- Team will benefit from standardized approach

**Don't create skills for:**
- One-off tasks
- Trivial operations
- Well-documented standard practices
- Personal preferences without technical substance

## Skill Quality Standards

Reference skill: Check `.claude/skills/` or ask user for path to best existing skill.

### Quality Principles

**From the docx skill gold standard:**

1. **Be prescriptive, not descriptive**
   - BAD: "You might want to consider using X"
   - GOOD: "Use X. Run `command here`"

2. **Front-load decision logic**
   - Decision tree at top saves context window
   - Reader knows immediately which path to follow

3. **Show anti-patterns**
   - BAD vs GOOD examples
   - Explain why the bad approach fails

4. **Mandate reading when complex**
   - "**MANDATORY - READ ENTIRE FILE**: Read `reference.md`"
   - Don't assume Claude will figure it out

5. **Operational wisdom**
   - Batch sizes that work well
   - Performance implications
   - When things break (and how)

6. **Concrete over abstract**
   - Actual bash commands
   - Real code snippets
   - Specific file paths

**What to AVOID:**
- Philosophical rambling about why things matter
- Excessive politeness ("please consider...")
- Hedging language ("maybe", "perhaps")
- Long prose without code
- Tutorial style - this is a runbook

## Workflow for Creating a New Skill

### Step 1: Validate Need

Ask the user:
````
I notice we're working on [DOMAIN]. This seems like good skill material because:
- [REASON 1: will recur / has gotchas / team benefit]
- [REASON 2]

Should we create a skill for this?
Suggested name: [domain-specific-name]
Location: .claude/skills/[name]/SKILL.md (project) or ~/.claude/skills/[name]/SKILL.md (personal)
````

### Step 2: Check for Existing Skills

Before creating, verify no overlap:
````bash
# Check project skills
ls -la .claude/skills/

# Check personal skills  
ls -la ~/.claude/skills/

# Search descriptions
find .claude/skills ~/.claude/skills -name "SKILL.md" -exec grep -l "keyword" {} \; 2>/dev/null
````

### Step 3: Scaffold the Skill

Run the [scaffold script](./scripts/scaffold.sh) to create the new skill:
```bash
# For project skill
sh ~/.claude/skills/skill-doctor/scripts/scaffold.sh \
  --path .claude/skills \
  django-orm-optimization
```

This creates:
```
~/.claude/skills/django-orm-optimization/
├── SKILL.md              # Pre-filled template
├── scripts/              # Optional: for helper scripts
└── templates/            # Optional: for config templates
```

```bash
# For personal skill
sh ~/.claude/skills/skill-doctor/scripts/scaffold.sh \
  --path ~/.claude/skills \
  django-orm-optimization
```

This creates:
```
.claude/skills/django-orm-optimization/
├── SKILL.md              # Pre-filled template
├── scripts/              # Optional: for helper scripts
└── templates/            # Optional: for config templates
```

### Step 4: Gather Intelligence

Extract from current work:
- What commands/tools are being used?
- What gotchas have we hit?
- What patterns emerged?
- What would we want to remember next time?


### Step 5: Customize the skill

Then edit `SKILL.md` to fill in:
- Description (YAML frontmatter)
- Domain-specific workflows
- Actual commands/code
- Gotchas discovered
- Examples from current work
