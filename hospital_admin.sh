#!/bin/bash

initialize_system() {
    echo "Initializing KNH system environment..."

    for dir in active_logs archived_logs reports; do
        if [ -d "$dir" ]; then
            echo "Directory '$dir' already exists. Skipping."
        else
            echo "Creating $dir directory..."
            mkdir "$dir"
        fi
    done

    echo "Directory structure is ready."
}

secure_data() {
    echo "Securing the active_logs directory..."

    if [ ! -d active_logs ]; then
        echo "Error: active_logs directory not found. Run initialize_system first."
        return 1
    fi

    chmod 700 active_logs
    chmod 600 active_logs/*.log 2>/dev/null

    echo "Permissions updated. Current state of active_logs:"
    ls -ld active_logs
    ls -l active_logs
}
