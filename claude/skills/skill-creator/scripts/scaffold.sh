#!/bin/bash

set -euo pipefail

# Configuration
TEMPLATE_FILE="$HOME/.claude/skills/skill-creator/template.md"
SKILL_PATH=""

# Functions
print_usage() {
  cat >&2 << EOF
Usage: scaffold.sh --path <directory> <skill-name>

Options:
  -d, --path <directory>  Directory path where skill will be created (required)
  -h, --help              Show this help message

Examples:
  scaffold.sh --path ~/.claude/skills my-skill
  scaffold.sh --path ./.claude/skills my-skill
  scaffold.sh --path /custom/path/skills my-skill
EOF
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--path)
      if [[ $# -lt 2 ]]; then
        echo "Error: --path requires a directory argument" >&2
        print_usage
        exit 1
      fi
      SKILL_PATH="$2"
      shift 2
      ;;
    -h|--help)
      print_usage
      exit 0
      ;;
    -*)
      echo "Error: Unknown option '$1'" >&2
      print_usage
      exit 1
      ;;
    *)
      SKILL_NAME="$1"
      shift
      ;;
  esac
done

# Validate required arguments
if [[ -z "${SKILL_PATH:-}" ]]; then
  echo "Error: --path argument is required" >&2
  print_usage
  exit 1
fi

if [[ -z "${SKILL_NAME:-}" ]]; then
  echo "Error: Skill name is required" >&2
  print_usage
  exit 1
fi

# Verify template exists
if [[ ! -f "$TEMPLATE_FILE" ]]; then
  echo "Error: Template file not found at $TEMPLATE_FILE" >&2
  exit 1
fi

# Construct full skill path
FULL_SKILL_PATH="$SKILL_PATH/$SKILL_NAME"

# Check if skill already exists
if [[ -d "$FULL_SKILL_PATH" ]]; then
  echo "Error: Skill already exists at $FULL_SKILL_PATH" >&2
  exit 1
fi

# Create skill directories
mkdir -p "$FULL_SKILL_PATH/scripts"
mkdir -p "$FULL_SKILL_PATH/references"
mkdir -p "$FULL_SKILL_PATH/templates"

# Copy template
cp "$TEMPLATE_FILE" "$FULL_SKILL_PATH/SKILL.md"

echo "✓ Skill '$SKILL_NAME' scaffolded successfully"
echo "  Location: $FULL_SKILL_PATH"

