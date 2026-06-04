# Instructions
This project is a Hospital Monitoring System developed to simulate hospital operations including:
-Patient vital sign monitoring
-Critical alerts generation
-ICU water usage auditing
-System administration and security setup
-Log archiving and management
The order of execution being:
-Clone the repository
-Ensure scripts have execution permissions
-Start the hospital system
-Run system administration setup
-Run hospital analysis
-Run archive system
-Stop the system

### Project overview
Coding-lab_Group28/
│
├── hospital_system.py        # Start/stop system controller
├── hospital_admin.sh         # System setup and security
├── hospital_analysis.sh      # Critical vitals + water audit
├── hospital_archive.sh       # Log archiving system
│
├── active_logs/              # Live system logs
├── archived_logs/            # Archived logs
└── reports/                  # Generated reports

### Group Members and their roles
- Member 1(Write the initialize_system() and secure_data() functions)
- Member 2(Write the execution logic)
- Member 3(Write a function process_vitals())
- Member 4(Write a script that rotates the logs)
- Member 5(Write a function water_audit()to analyze resources)
