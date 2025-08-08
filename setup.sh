#!/bin/bash

# 🚀 GitHub Profile Setup Script
# This script helps set up your auto-updating GitHub profile

echo "🎯 Setting up your GitHub Profile Repository"
echo "=============================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: This directory is not a git repository"
    echo "Please run this script from your GitHub profile repository"
    exit 1
fi

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 is not installed"
    echo "Please install Python 3 and try again"
    exit 1
fi

# Install Python dependencies
echo "📦 Installing Python dependencies..."
pip3 install -r requirements.txt

# Make the update script executable
echo "🔧 Making scripts executable..."
chmod +x scripts/update_profile.py

# Test the profile updater
echo "🧪 Testing profile updater..."
python3 scripts/update_profile.py

# Check if GitHub Actions directory exists
if [ ! -d ".github/workflows" ]; then
    echo "📁 Creating GitHub Actions directory..."
    mkdir -p .github/workflows
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Push this repository to GitHub"
echo "2. Make sure the repository is named exactly like your username: 'codewithravikant'"
echo "3. The GitHub Actions workflow will automatically run daily at 00:00 UTC"
echo "4. You can also manually trigger the workflow from the Actions tab"
echo ""
echo "🔗 Your profile will be available at: https://github.com/codewithravikant"
echo ""
echo "💡 To manually update your profile, run:"
echo "   python3 scripts/update_profile.py"
echo ""
echo "🎉 Your GitHub profile is now set up for auto-updates!"
