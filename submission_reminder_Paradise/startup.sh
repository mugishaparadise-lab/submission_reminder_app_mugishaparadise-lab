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
    echo "Error, config/config.env doesn't exists"
    exit 1

fi

if [ -f "app/reminder.sh" ]; then
    echo "app/reminder.sh exists"
else 
    echo "Error, app/reminder.sh exists"
    exit 1
fi

if [ -f "modules/functions.sh" ]; then
    echo "modules/functions.sh exists"
else
    echo "Error, modules/functions.sh doesn't exists"
    exit 1
fi

if [ -f "assets/submissions.txt" ]; then
    echo "assets/submissions.txt exists"
else 
    echo "Error, assest/submissions.txt doesn't exists"
    exit 1

fi

# Execute the reminder script
bash app/reminder.sh
