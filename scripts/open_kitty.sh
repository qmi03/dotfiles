#!/usr/bin/env bash

# Detects if kitty is running in the current session namespace
if ! pgrep -af kitty --ns $$ > /dev/null 2>&1; then
    # No kitty running, start a new instance
    open -a kitty
else
    # Try to create a new window using kitty's own command-line interface
    if ! kitty @ new-window --no-response > /dev/null 2>&1; then
        # If that fails, try osascript as fallback
        script='tell application "kitty" to create window with default profile'
        if ! osascript -e "${script}" > /dev/null 2>&1; then
            # If both methods fail, restart kitty
            while IFS="" read -r pid; do
                # Send SIGTERM to each kitty process
                kill -15 "${pid}"
            done < <(pgrep -af kitty --ns $$)
            
            # Wait briefly for processes to terminate
            sleep 0.5
            
            # Start a new kitty instance
            open -a kitty
        fi
    fi
fi
