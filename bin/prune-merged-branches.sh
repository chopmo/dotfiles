#!/bin/sh

# Simple script for pruning local branches already merged,
# and remove remote tracking branches that have been deleted

# Default to "origin" if no remote is passed
remote=${1-origin}

# Branches to keep, regardless of their current merge state
permanent_branches="develop|master|production|rentals"

# Remove local already merged branches
git branch --merged | grep -v -E "(\*|$permanent_branches)" | xargs -n 1 git branch -d

# Retry with whatever 'git remote' outputs
git remote prune $remote || git remote prune `git remote`
