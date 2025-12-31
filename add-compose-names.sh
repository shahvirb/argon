#!/usr/bin/env bash

# Find all docker-compose.yaml files, excluding .git directories
find . -type f -name "docker-compose.yaml" ! -path "*/.git/*" | while read -r compose_file; do
    # Get the directory name
    dir_path=$(dirname "$compose_file")
    dir_name=$(basename "$dir_path")
    
    # Check if this file is inside a git repository (skip if it is)
    check_path="$dir_path"
    is_git_repo=false
    while [[ "$check_path" != "." && "$check_path" != "/" ]]; do
        if [[ -d "$check_path/.git" ]]; then
            is_git_repo=true
            break
        fi
        check_path=$(dirname "$check_path")
    done
    
    if [[ "$is_git_repo" == true ]]; then
        echo "Skipping $compose_file - inside a git repository"
        continue
    fi
    
    # Expected name line
    name_line="name: ${dir_name}_argon"
    
    # Check if the file already has a name: line
    if grep -q "^name:" "$compose_file"; then
        echo "Skipping $compose_file - already has a name line"
    else
        echo "Adding name to $compose_file"
        
        # Check if first line is a comment
        first_line=$(head -n 1 "$compose_file")
        
        if [[ "$first_line" == \#* ]]; then
            # First line is a comment, insert name on line 2
            temp_file=$(mktemp)
            head -n 1 "$compose_file" > "$temp_file"
            echo "$name_line" >> "$temp_file"
            echo "" >> "$temp_file"  # Add blank line
            tail -n +2 "$compose_file" >> "$temp_file"
            mv "$temp_file" "$compose_file"
        else
            # No comment, insert at the top
            temp_file=$(mktemp)
            echo "$name_line" > "$temp_file"
            echo "" >> "$temp_file"  # Add blank line
            cat "$compose_file" >> "$temp_file"
            mv "$temp_file" "$compose_file"
        fi
    fi
done

echo "Done!"
