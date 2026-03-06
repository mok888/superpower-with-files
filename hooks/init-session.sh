#!/bin/bash
# Initialize planning files for a new session
# Usage: ./init-session.sh [project-name]

set -e

PROJECT_NAME="${1:-project}"
DATE=$(date +%Y-%m-%d)

echo "Initializing planning files for: $PROJECT_NAME"

MEM_DIR=".superpower-with-files"
mkdir -p "$MEM_DIR"

echo "Initializing planning files in: $MEM_DIR/ for $PROJECT_NAME"

# Create task_plan.md if it doesn't exist
if [ ! -f "$MEM_DIR/task_plan.md" ]; then
    cat > "$MEM_DIR/task_plan.md" << 'EOF'
# Task Plan: [Brief Description]

## Goal
[One sentence describing the end state]

## Current Phase
Phase 1

## Phases

### Phase 1: Requirements & Discovery
- [ ] Understand user intent
- [ ] Identify constraints
- [ ] Document in findings.md
- **Status:** in_progress

### Phase 2: Planning & Structure
- [ ] Define approach
- [ ] Create project structure
- **Status:** pending

### Phase 3: Implementation
- [ ] Execute the plan
- [ ] Write to files before executing
- **Status:** pending

### Phase 4: Testing & Verification
- [ ] Verify requirements met
- [ ] Document test results
- **Status:** pending

### Phase 5: Delivery
- [ ] Review outputs
- [ ] Deliver to user
- **Status:** pending

## Decisions Made
| Decision | Rationale |
|----------|-----------|

## Errors Encountered
| Error | Resolution |
|-------|------------|
EOF
    echo "Created $MEM_DIR/task_plan.md"
else
    echo "$MEM_DIR/task_plan.md already exists, skipping"
fi

# Create findings.md if it doesn't exist
if [ ! -f "$MEM_DIR/findings.md" ]; then
    cat > "$MEM_DIR/findings.md" << 'EOF'
# Findings & Decisions

## Requirements
-

## Research Findings
-

## Technical Decisions
| Decision | Rationale |
|----------|-----------|

## Issues Encountered
| Issue | Resolution |
|-------|------------|

## Resources
-
EOF
    echo "Created $MEM_DIR/findings.md"
else
    echo "$MEM_DIR/findings.md already exists, skipping"
fi

# Create progress.md if it doesn't exist
if [ ! -f "$MEM_DIR/progress.md" ]; then
    cat > "$MEM_DIR/progress.md" << EOF
# Progress Log

## Session: $DATE

### Current Status
- **Phase:** 1 - Requirements & Discovery
- **Started:** $DATE

### Actions Taken
-

### Test Results
| Test | Expected | Actual | Status |
|------|----------|--------|--------|

### Errors
| Error | Resolution |
|-------|------------|
EOF
    echo "Created $MEM_DIR/progress.md"
else
    echo "$MEM_DIR/progress.md already exists, skipping"
fi

echo ""
echo "Planning files initialized!"
echo "Files: task_plan.md, findings.md, progress.md"
