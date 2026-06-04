#!/bin/bash

process_vitals() {

    echo "===== KNH CRITICAL VITALS ANALYSIS ====="
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
    echo "Report saved in reports/critical_alerts.txt"
}

process_vitals


# ==============================
# Member 6 - Facility Auditor
# ====================
water_audit() {
    echo "Running ICU Water Audit..."

    file=$(find active_logs -type f -iname "*water*" | head -1)

    if [ -z "$file" ]; then
        echo "Water log file not found!"
        return 1
    fi

    # Correct parsing using | as delimiter
    total=$(awk -F"|" '
        $2 ~ /ICU_WATER_RESERVE/ {
            gsub(/ /, "", $3);
            sum += $3;
            count++
        }
        END {print sum}
    ' "$file")

    count=$(awk -F"|" '
        $2 ~ /ICU_WATER_RESERVE/ {
            count++
        }
        END {print count+0}
    ' "$file")
count=${count:-0}
    if [ "$count" -eq 0 ]; then
        echo "No ICU water data found."
        return
    fi

    avg=$(echo "scale=2; ${total:-0} / $count" | bc)

    printf "\n===== ICU WATER AUDIT REPORT =====\n"
    printf "Total ICU Water Usage: %s\n" "$total"
    printf "Number of Records: %s\n" "$count"
    printf "Average Usage: %s L/min\n" "$avg"
}
water_audit

