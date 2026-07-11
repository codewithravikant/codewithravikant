#!/bin/bash

# GitHub Profile Repository setup

echo "Setting up your GitHub Profile Repository"
echo "=========================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "Error: This directory is not a git repository"
    echo "Please run this script from your GitHub profile repository"
    exit 1
fi

echo ""
echo "Setup complete."
echo ""
echo "Next steps:"
echo "1. Edit README.md manually when you want to update your profile"
echo "2. Push this repository to GitHub"
echo "3. Make sure the repository is named exactly like your username: 'codewithravikant'"
echo ""
echo "Your profile: https://github.com/codewithravikant"
