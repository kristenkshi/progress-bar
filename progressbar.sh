#!/bin/bash

# Function to draw the progress bar
draw_progress_bar() {
    local progress=$(( $1 * 100 / $2 )) # Calculate the percentage of progress
    local bar_length=50                 # Length of the progress bar
    local num_blocks=$(( bar_length * progress / 100 ))
    local bar="["

    # Add filled blocks
    for ((i = 0; i < num_blocks; i++)); do
        bar+="="
    done

    # Add remaining empty blocks
    for ((i = num_blocks; i < bar_length; i++)); do
        bar+=" "
    done

    bar+="]"

    # Print the progress bar
    echo -ne "\r$bar $progress%    "
}

# Example usage
total_steps=50

for ((step = 1; step <= total_steps; step++)); do
    # Simulate some work here...
    sleep 0.1
    draw_progress_bar $step $total_steps
done

echo "" # Print a new line after the progress bar is completed
