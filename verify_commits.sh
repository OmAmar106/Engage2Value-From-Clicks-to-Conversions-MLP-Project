#!/bin/bash

# Commit Verification Script
# This script analyzes commits in the local repository to verify authorship

echo "=== Repository Commit Analysis (Local) ==="
echo "Repository: $(git remote get-url origin)"
echo "Analysis Date: $(date)"
echo "Current Branch: $(git branch --show-current)"
echo ""

echo "=== All Commits with Author Information (Current Branch) ==="
git log --all --pretty=format:"%h - %an <%ae> - %ad - %s" --date=short

echo ""
echo ""
echo "=== Summary by Author ==="
git log --all --pretty=format:"%an <%ae>" | sort | uniq -c | sort -nr

echo ""
echo ""
echo "=== Email Addresses Used ==="
git log --all --pretty=format:"%ae" | sort | uniq

echo ""
echo ""
echo "=== Commit Count by Author ==="
git shortlog --all -sn

echo ""
echo ""
echo "=== IMPORTANT NOTE ==="
echo "This local analysis may not show all commits if:"
echo "- You're on a specific branch (like the current copilot branch)"
echo "- The repository has been shallow cloned"
echo "- Some branches haven't been fetched locally"
echo ""
echo "For complete analysis, see the COMMIT_ANALYSIS_REPORT.md file"
echo "which contains GitHub API data showing ALL 21 commits in the repository."

echo ""
echo "=== GitHub Profile Troubleshooting ==="
echo "If commits don't appear in your GitHub profile:"
echo "1. Verify email addresses (bt23cse106@iiitn.ac.in and emailomamar@gmail.com) in GitHub Settings → Emails"
echo "2. Check your profile privacy settings"
echo "3. Ensure contribution graph includes private repositories if needed"
echo "4. Look at the correct date range: May 2025 - August 2025"