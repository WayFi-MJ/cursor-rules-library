# 🎯 Cursor Rules Library

My personal collection of Cursor AI rules for different tech stacks and projects.

## 📁 Structure

```
├── base/                 # Foundation rules (always include)
│   └── global.cursorrules
├── frontend/             # Frontend frameworks
│   ├── react.cursorrules
│   ├── nextjs.cursorrules
│   └── vue.cursorrules
├── backend/              # Backend frameworks
│   ├── node.cursorrules
│   ├── python.cursorrules
│   └── supabase.cursorrules
├── mobile/               # Mobile development
│   └── react-native.cursorrules
├── infra/                # Infrastructure & DevOps
│   └── docker.cursorrules
└── combined/             # Pre-combined stacks
    ├── nextjs-supabase.cursorrules
    └── react-node.cursorrules
```

## 🚀 Quick Usage

### Option 1: Direct Download (Recommended)

```bash
# Download a single rule file
curl -o .cursorrules https://raw.githubusercontent.com/WayFi-MJ/cursor-rules-library/main/frontend/nextjs.cursorrules

# Or combine multiple
curl -s https://raw.githubusercontent.com/WayFi-MJ/cursor-rules-library/main/base/global.cursorrules > .cursorrules
curl -s https://raw.githubusercontent.com/WayFi-MJ/cursor-rules-library/main/backend/supabase.cursorrules >> .cursorrules
```

### Option 2: Clone & Copy

```bash
# Clone once
git clone https://github.com/WayFi-MJ/cursor-rules-library.git ~/cursor-rules

# Copy to your project
cp ~/cursor-rules/frontend/nextjs.cursorrules .cursorrules
```

### Option 3: Use the Helper Script

```bash
# Download the helper script
curl -o cursor-rules https://raw.githubusercontent.com/WayFi-MJ/cursor-rules-library/main/scripts/cursor-rules.sh
chmod +x cursor-rules

# Use it
./cursor-rules nextjs          # Single stack
./cursor-rules nextjs supabase  # Combined stacks
```

## 📝 Creating New Rules

1. Copy `_template.cursorrules` as your starting point
2. Add stack-specific rules
3. Test in a project
4. Commit back to this repo

## 🔄 Updating Rules

When you improve rules in a project, remember to:
1. Copy improvements back to this library
2. Commit with a descriptive message
3. Keep the library as your single source of truth

## 📚 Rule Writing Best Practices

- Be specific and concise
- Include code examples where helpful
- Group related rules under clear headers
- Avoid contradictory instructions
- Test rules before adding to library

---

Made with ❤️ for better AI-assisted coding
