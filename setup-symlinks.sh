#!/bin/bash

# Enhanced script to create symlinks from ~/dotfiles/config/* to ~/.config/
# Now with recursive content comparison before creating backups

# Ensure ~/.config directory exists
mkdir -p ~/.config

# Get the absolute path to dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$DOTFILES_DIR/config"

# Check if the config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Error: $CONFIG_DIR does not exist!"
    exit 1
fi

# Check if rsync is installed
if ! command -v rsync &> /dev/null; then
    echo "Warning: rsync not found. Will fall back to simpler comparison."
    HAS_RSYNC=0
else
    HAS_RSYNC=1
fi

# Function to check if directories are different
# Returns 0 if different, 1 if same
dirs_are_different() {
    source_dir="$1"
    target_dir="$2"
    
    if [ $HAS_RSYNC -eq 1 ]; then
        # Use rsync's dry-run to check for differences
        # The --checksum option forces file checksum comparison instead of just size and mod-time
        rsync -rncq --delete "$source_dir/" "$target_dir/" &> /dev/null
        # rsync returns 0 if there are changes to be made, 1 if everything is in sync
        if [ $? -eq 0 ]; then
            return 0  # Different
        else
            return 1  # Same
        fi
    else
        # Fallback method using diff
        diff -rq "$source_dir" "$target_dir" &> /dev/null
        if [ $? -eq 0 ]; then
            return 1  # Same
        else
            return 0  # Different
        fi
    fi
}

# Function to create a symlink
create_symlink() {
    source="$1"
    target="$2"
    
    # Check if target already exists
    if [ -e "$target" ]; then
        # If it's already a symlink to our source, skip
        if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
            echo "✓ Symlink already exists: $target → $source"
            return
        fi
        
        # If target is a directory and not a symlink, check contents
        if [ -d "$target" ] && [ ! -L "$target" ]; then
            dirs_are_different "$source" "$target"
            if [ $? -eq 0 ]; then
                # Directories are different, create backup
                backup="$target.backup.$(date +%Y%m%d%H%M%S)"
                echo "! Contents differ, backing up existing $target to $backup"
                mv "$target" "$backup"
            else
                # Directories are the same, just remove and replace with symlink
                echo "! Contents are identical, replacing $target with symlink"
                rm -rf "$target"
            fi
        else
            # Target is a file or a symlink to something else, create backup
            backup="$target.backup.$(date +%Y%m%d%H%M%S)"
            echo "! Backing up existing $target to $backup"
            mv "$target" "$backup"
        fi
    fi
    
    # Create the symlink
    ln -s "$source" "$target"
    echo "✓ Created symlink: $target → $source"
}

echo "Creating symlinks from $CONFIG_DIR to ~/.config/"

# Loop through all directories in the config folder
for dir in "$CONFIG_DIR"/*; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        target="$HOME/.config/$dirname"
        
        create_symlink "$dir" "$target"
    fi
done

echo "Done! All symlinks created."
