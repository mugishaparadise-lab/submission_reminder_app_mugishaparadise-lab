#!/usr/bin/env bash
read -p "Enter your name: " name
base_dir="submission_reminder_$name"
echo "Creating the directory"
mkdir -p "$base_dir"
if [ -d "$base_dir" ]; then
echo "Congratulations ! directory successfully created"
else 
echo  "Failed to create the directory"
fi
mkdir -p "$base_dir/config"
mkdir -p "$base_dir/app"
mkdir -p "$base_dir/assets"
mkdir -p "$base_dir/modules"
echo -n "Processing"
for i in {1..5}; do
  echo -n "."
  sleep 0.5
done
echo " Done!"
echo "Sub-directory successfully created"
cat >> "$base_dir/config/config.env" << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
cat >> "$base_dir/app/reminder.sh" << 'EOF'
#!/usr/bin/env bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF
cat >> "$base_dir/modules/functions.sh" << 'EOF'
#!/usr/bin/env bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF
cat >> "$base_dir/assets/submissions.txt" << 'EOF'

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Noella, processes, not submitted
Stella,Signals, submitted
Claudia, Redirections, submitted
Monia, Filters, submitted
Maley, Parsing, not submitted
EOF
echo -n "Processing"
for i in {1..3}; do
echo -n "."
sleep 3
done
echo "Files moved to the subdirectories successfully"
touch "$base_dir/startup.sh"
cat >> "$base_dir/startup.sh" << 'EOF'
#!/bin/bash
echo "***********************************"
echo "Starting Submission Reminder App..."
echo "***********************************"
# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to app directory
cd "$SCRIPT_DIR"

# Check if required files exist
if [ -f "config/config.env" ]; then
    echo " config/config.env exists!"
else
    echo "Error"
    exit 1

fi

if [ -f "modules/reminder.sh" ]; then
    echo "app/reminder.sh exists"
else 
    echo "Error"
    exit 1
fi

if [ -f "modules/functions.sh" ]; then
    echo "modules/functions.sh exists"
else
    echo "Error"
    exit 1
fi

if [ -f "assets/submissions.txt" ]; then
    echo "assets/submissions.txt exists"
else 
    echo "Error"
    exit 1

fi

# Execute the reminder script
bash modules/reminder.sh
EOF
echo "Application finished."
find . "$base_dir" -type f -name '*.sh' -exec chmod +x {} \;
echo "Permission applied successfully"
echo "Your environment is ready to operate"
echo "*******READY TO START********"
