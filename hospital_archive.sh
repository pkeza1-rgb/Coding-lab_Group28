#!/bin/bash

# Create timestamp for unique archive names
timestamp=$(date +"%Y%m%d_%H%M")

# Ensure required directories exist
mkdir -p active_logs
mkdir -p archived_logs

echo "Starting archive process at $timestamp"

# Move and rename logs (fresh archive)
if [ -f active_logs/heart_rate.log ]; then
    mv active_logs/heart_rate.log archived_logs/heart_rate_${timestamp}.log
fi

if [ -f active_logs/temperature.log ]; then
    mv active_logs/temperature.log archived_logs/temperature_${timestamp}.log
fi

if [ -f active_logs/water_usage.log ]; then
    mv active_logs/water_usage.log archived_logs/water_usage_${timestamp}.log
fi

# Recreate empty logs for continuous system operation
touch active_logs/heart_rate.log
touch active_logs/temperature.log
touch active_logs/water_usage.log

echo "Archive completed successfully"
