#!/bin/bash

# Convert URL to markdown
curl --no-progress-meter $1 | html2markdown >> ~/.claude/resources/$2

# Get the title from filename (remove .md extension and convert underscores to spaces)
FILENAME=$2
TITLE=$(echo "$FILENAME" | sed 's/.md$//' | sed 's/_/ /g' | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1')

# Prompt for category
echo -n "Category (e.g., Music, Programming, Documentation): "
read CATEGORY

# Prompt for description
echo -n "Brief description: "
read DESCRIPTION

# Path to INDEX.md
INDEX_FILE="$HOME/.claude/resources/INDEX.md"

# Check if category exists in INDEX.md
if grep -q "^## $CATEGORY$" "$INDEX_FILE"; then
    # Category exists, append after the category header
    sed -i '' "/^## $CATEGORY$/a\\
- [$TITLE]($FILENAME): $DESCRIPTION
" "$INDEX_FILE"
else
    # Category doesn't exist, add new category section
    echo "" >> "$INDEX_FILE"
    echo "## $CATEGORY" >> "$INDEX_FILE"
    echo "" >> "$INDEX_FILE"
    echo "- [$TITLE]($FILENAME): $DESCRIPTION" >> "$INDEX_FILE"
fi

echo "✓ Added to knowledge base and indexed in INDEX.md"
