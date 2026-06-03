#!/bin/bash
#
# hospital_admin.sh - KNH Digital Infrastructure: Permissions & Setup

# -----------------------------------------------------------------------------
# Member 1 (The Architect): initialize_system()
# -----------------------------------------------------------------------------
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

# -----------------------------------------------------------------------------
# Member 2 (The Security Lead): secure_data()
# -----------------------------------------------------------------------------
secure_data() {
    echo "Securing the active_logs directory..."

    # Guard against running before the directory has been created.
    if [ ! -d active_logs ]; then
        echo "Error: active_logs directory not found. Run initialize_system first."
        return 1
    fi

    # Restrict the directory itself to the owner only.
    chmod 700 active_logs

    # Restrict each individual log file to owner read/write only.
    # The 2>/dev/null avoids a noisy error if no .log files exist yet.
    chmod 600 active_logs/*.log 2>/dev/null

    echo "Permissions updated. Current state of active_logs:"
    ls -ld active_logs
    ls -l active_logs
}

# -----------------------------------------------------------------------------
# Member 3 (The Orchestrator): execution logic
# -----------------------------------------------------------------------------
# TODO (Member 3): Call initialize_system and secure_data in order, then print
# a "System Environment Secured" message that includes the current date
# (hint: use the `date` command).
