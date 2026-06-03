#!/bin/bash

process_vitals() {

    echo "Analyzing patient vital signs..."

    mkdir -p reports

    echo "Timestamp | Device_ID | Value" > reports/critical_alerts.txt

    (
        grep "CRITICAL" active_logs/heart_rate_log.log
        grep "CRITICAL" active_logs/temperature_log.log
    ) | awk -F'|' '
    {
        gsub(/^ +| +$/, "", $1)
        gsub(/^ +| +$/, "", $2)
        gsub(/^ +| +$/, "", $3)

        printf "%s | %s | %s\n", $1, $2, $3
    }
    ' >> reports/critical_alerts.txt

    echo "Critical alerts report generated."
    echo "Report saved to reports/critical_alerts.txt"
}

process_vitals
