#!/bin/bash

# 🚀 Smart GitHub Activity Update Script
# This script intelligently copies files to trigger git activity

echo "🧠 Smart GitHub Activity Update"
echo "==============================="

# Function to randomly select a folder
select_random_folder() {
    folders=("ts-sprint" "racetrack" "javascript-sprint")
    random_index=$((RANDOM % ${#folders[@]}))
    folder="${folders[$random_index]}"
    echo "📁 Randomly selected: $folder"
}

# Function to copy files without git submodules
copy_files_smart() {
    local source_folder="to be update/$folder"
    local target_folder="activity_updates"
    
    # Create target folder if it doesn't exist
    mkdir -p "$target_folder"
    
    echo "📋 Copying files from $folder..."
    
    # Copy specific files based on folder type
    case $folder in
        "ts-sprint")
            # Copy TypeScript files
            find "$source_folder" -name "*.ts" -type f | head -3 | while read file; do
                if [ -f "$file" ]; then
                    filename=$(basename "$file")
                    cp "$file" "$target_folder/$filename"
                    echo "✅ Copied: $filename"
                fi
            done
            ;;
        "javascript-sprint")
            # Copy JavaScript files
            find "$source_folder" -name "*.js" -type f | head -3 | while read file; do
                if [ -f "$file" ]; then
                    filename=$(basename "$file")
                    cp "$file" "$target_folder/$filename"
                    echo "✅ Copied: $filename"
                fi
            done
            ;;
        "racetrack")
            # Copy documentation and config files
            find "$source_folder" -name "*.md" -o -name "*.json" -o -name "*.html" | head -3 | while read file; do
                if [ -f "$file" ]; then
                    filename=$(basename "$file")
                    cp "$file" "$target_folder/$filename"
                    echo "✅ Copied: $filename"
                fi
            done
            ;;
    esac
    
    # Check if we copied any files
    if [ -z "$(ls -A $target_folder 2>/dev/null)" ]; then
        echo "❌ No files were copied"
        return 1
    fi
    
    echo "📊 Successfully copied files from $folder"
}

# Function to commit and push
git_update() {
    echo "🚀 Updating git activity..."
    
    # Add only the activity_updates folder, not the entire to be update folder
    git add activity_updates/
    
    # Create commit message based on folder
    case $folder in
        "ts-sprint") commit_msg="🚀 Update: TypeScript sprint exercises and improvements";;
        "racetrack") commit_msg="🏁 Update: Racetrack network deployment and optimizations";;
        "javascript-sprint") commit_msg="⚡ Update: JavaScript sprint exercises and enhancements";;
        *) commit_msg="📝 Update: Code improvements and optimizations";;
    esac
    
    # Commit
    git commit -m "$commit_msg"
    
    # Push
    git push origin main
    
    echo "✅ Git activity updated successfully!"
}

# Function to clean up
cleanup() {
    echo "🧹 Cleaning up copied files..."
    rm -rf activity_updates
    echo "✅ Cleanup complete"
}

# Function to check git status
check_git_status() {
    if ! git status >/dev/null 2>&1; then
        echo "❌ Not in a git repository"
        return 1
    fi
    
    if ! git remote get-url origin >/dev/null 2>&1; then
        echo "❌ No remote repository configured"
        return 1
    fi
    
    echo "✅ Git repository ready"
}

# Main execution
main() {
    # Check git status first
    check_git_status
    if [ $? -ne 0 ]; then
        echo "❌ Git setup issues. Please configure git properly."
        exit 1
    fi
    
    select_random_folder
    copy_files_smart
    if [ $? -eq 0 ]; then
        git_update
        cleanup
        echo ""
        echo "🎉 Smart activity update complete!"
        echo "📈 Your GitHub activity is now positive"
    else
        echo "❌ Failed to copy files"
    fi
}

# Run main function
main
