#!/bin/bash

# 🚀 Automated GitHub Activity Update Script
# This script automatically copies files to trigger git activity

echo "🤖 Automated GitHub Activity Update"
echo "==================================="

# Function to randomly select a folder
select_random_folder() {
    folders=("ts-sprint" "racetrack" "javascript-sprint")
    random_index=$((RANDOM % ${#folders[@]}))
    folder="${folders[$random_index]}"
    echo "📁 Randomly selected: $folder"
}

# Function to copy 3 random files
copy_files() {
    local source_folder="to be update/$folder"
    local target_folder="activity_updates"
    
    # Create target folder if it doesn't exist
    mkdir -p "$target_folder"
    
    echo "📋 Copying 3 files from $folder..."
    
    # Get list of files (excluding .DS_Store, .git, node_modules)
    files=($(find "$source_folder" -type f -name "*.js" -o -name "*.ts" -o -name "*.md" -o -name "*.json" -o -name "*.html" | grep -v ".DS_Store" | grep -v ".git" | grep -v "node_modules"))
    
    if [ ${#files[@]} -eq 0 ]; then
        echo "❌ No suitable files found in $folder"
        return 1
    fi
    
    # Copy 3 random files
    copied_count=0
    for i in {1..3}; do
        if [ ${#files[@]} -gt 0 ]; then
            # Select random file
            random_index=$((RANDOM % ${#files[@]}))
            selected_file="${files[$random_index]}"
            
            # Get filename
            filename=$(basename "$selected_file")
            
            # Copy file
            cp "$selected_file" "$target_folder/$filename"
            echo "✅ Copied: $filename"
            
            # Remove from array to avoid duplicates
            unset files[$random_index]
            files=("${files[@]}")
            
            ((copied_count++))
        fi
    done
    
    echo "📊 Successfully copied $copied_count files"
}

# Function to commit and push
git_update() {
    echo "🚀 Updating git activity..."
    
    # Add all files
    git add .
    
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

# Main execution
main() {
    select_random_folder
    copy_files
    if [ $? -eq 0 ]; then
        git_update
        cleanup
        echo ""
        echo "🎉 Automated activity update complete!"
        echo "📈 Your GitHub activity is now positive"
    else
        echo "❌ Failed to copy files"
    fi
}

# Run main function
main
