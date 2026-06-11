#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
  echo "Usage: ./new.sh <name>"
  exit 1
fi

NAME="$1"
DEST="presentations/$NAME"

if [ -d "$DEST" ]; then
  echo "Error: $DEST already exists"
  exit 1
fi

cp -r presentations/template "$DEST"

# Update package name
sed -i "s/\"name\": \"template\"/\"name\": \"$NAME\"/" "$DEST/package.json"

# Update deck title
sed -i "s/title=\"Test Deck\"/title=\"$NAME\"/" "$DEST/src/deck.tsx"

# Update index.html title
sed -i "s/<title>Test<\/title>/<title>$NAME<\/title>/" "$DEST/index.html"

bun install

echo "Created $DEST — run it with:"
echo "  cd $DEST && bun run dev"
