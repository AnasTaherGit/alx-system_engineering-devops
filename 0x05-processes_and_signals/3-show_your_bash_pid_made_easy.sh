#!/usr/bin/env bash
# Iterate over all pid directories in /proc

for pid_dir in /proc/[0-9]*; do
    # If cmdline file exists
    if [[ -f $pid_dir/cmdline ]]; then
        # Get the process command line
        cmdline=$(tr '\0' ' ' < "$pid_dir/cmdline")
        # If command line contains bash
        if [[ $cmdline == *"bash"* ]]; then
            # Extract the pid from the directory name and print it with the command line
            pid=$(basename "$pid_dir")
            echo "$pid $cmdline"
        fi
    fi
done
