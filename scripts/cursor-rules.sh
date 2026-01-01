#!/bin/bash

# Cursor Rules Helper Script
# Downloads rules from your library and combines them

BASE_URL="https://raw.githubusercontent.com/WayFi-MJ/cursor-rules-library/main"

show_help() {
  echo "Usage: cursor-rules [OPTIONS] <stack> [additional-stacks...]"
  echo ""
  echo "Available stacks:"
  echo "  Frontend: react, nextjs, vue"
  echo "  Backend:  node, python, supabase"
  echo "  Mobile:   react-native"
  echo "  Infra:    docker"
  echo "  Combined: nextjs-supabase, react-node"
  echo ""
  echo "Options:"
  echo "  -g, --with-global    Include global base rules (recommended)"
  echo "  -o, --output FILE    Output file (default: .cursorrules)"
  echo "  -h, --help           Show this help"
  echo ""
  echo "Examples:"
  echo "  cursor-rules nextjs                    # Just Next.js rules"
  echo "  cursor-rules -g nextjs supabase        # Global + Next.js + Supabase"
  echo "  cursor-rules -o rules.md react         # Output to custom file"
}

# Map stack names to file paths
get_path() {
  case $1 in
    react)          echo "frontend/react.cursorrules" ;;
    nextjs)         echo "frontend/nextjs.cursorrules" ;;
    vue)            echo "frontend/vue.cursorrules" ;;
    node)           echo "backend/node.cursorrules" ;;
    python)         echo "backend/python.cursorrules" ;;
    supabase)       echo "backend/supabase.cursorrules" ;;
    react-native)   echo "mobile/react-native.cursorrules" ;;
    docker)         echo "infra/docker.cursorrules" ;;
    nextjs-supabase) echo "combined/nextjs-supabase.cursorrules" ;;
    react-node)     echo "combined/react-node.cursorrules" ;;
    global)         echo "base/global.cursorrules" ;;
    *)              echo "" ;;
  esac
}

# Default values
OUTPUT=".cursorrules"
WITH_GLOBAL=false
STACKS=()

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      show_help
      exit 0
      ;;
    -g|--with-global)
      WITH_GLOBAL=true
      shift
      ;;
    -o|--output)
      OUTPUT="$2"
      shift 2
      ;;
    *)
      STACKS+=("$1")
      shift
      ;;
  esac
done

if [ ${#STACKS[@]} -eq 0 ]; then
  echo "Error: No stack specified"
  show_help
  exit 1
fi

# Clear output file
> "$OUTPUT"

# Add global rules if requested
if [ "$WITH_GLOBAL" = true ]; then
  echo "Downloading: global..."
  curl -sL "$BASE_URL/base/global.cursorrules" >> "$OUTPUT"
  echo -e "\n\n" >> "$OUTPUT"
fi

# Download and combine stacks
for stack in "${STACKS[@]}"; do
  path=$(get_path "$stack")
  if [ -z "$path" ]; then
    echo "Warning: Unknown stack '$stack', skipping"
    continue
  fi
  echo "Downloading: $stack..."
  curl -sL "$BASE_URL/$path" >> "$OUTPUT"
  echo -e "\n\n" >> "$OUTPUT"
done

echo "✅ Rules saved to $OUTPUT"