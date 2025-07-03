#!/usr/bin/env bash

set -e

FILES="$@"
RESULTS=""
ERRORS=0

if [ -z "$FILES" ]; then
  echo "No YAML files to check ✅"
  echo "message=No YAML files to check ✅" >> $GITHUB_OUTPUT
  exit 0
fi

for file in $FILES; do
  echo "▶ Validating $file"
  FILE_RESULT=""

  # Simple validation
  SIMPLE_OUTPUT=$(tooka validate "$file" 2>&1)
  SIMPLE_EXIT=$?
  if [ $SIMPLE_EXIT -ne 0 ]; then
    FILE_RESULT+="❌ **$file** failed validation\n\`\`\`\n$SIMPLE_OUTPUT\n\`\`\`\n"
    ((ERRORS++))
  else
    FILE_RESULT+="✅ **$file** passed simple validation\n"
  fi

  # Deep validation
  DEEP_OUTPUT=$(tooka validate "$file" --deep 2>&1)
  DEEP_EXIT=$?
  if [ $DEEP_EXIT -ne 0 ]; then
    FILE_RESULT+="⚠️ **$file** has validation issues\n\`\`\`\n$DEEP_OUTPUT\n\`\`\`\n"
    ((ERRORS++))
  else
    FILE_RESULT+="✅ **$file** passed deep validation\n"
  fi

  RESULTS+="$FILE_RESULT\n"
done

# Output result
echo -e "$RESULTS"
echo "message<<EOF" >> $GITHUB_OUTPUT
echo -e "$RESULTS" >> $GITHUB_OUTPUT
echo "EOF" >> $GITHUB_OUTPUT

if [ "$ERRORS" -gt 0 ]; then
  exit 1
fi
