#!/bin/bash
echo "Welcome to copilot shell script"
# Path to  the config file
CONFIGURE="$submission_reminder_$name/config/config.env"
# Checking the existence of the config file
if [[ ! -f "$CONFIGURE" ]]; then
   echo "Config file not found at $CONFIGURE"
   exit 1
fi
# Prompt for new assignment name
read -p "Enter the assignment name: " new_assignment

# Validate input
if [[ -z "$new_assignment" ]]; then
    echo "Ooops, Assignment name cannot be empty."
    exit 1
fi

# Update ASSIGNMENT in line 2 of config/config.env
   sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$CONFIGURE"
# Confirmation message
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Assignment name changed successfully"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "New assignment: $new_assignment"
# Run startup.sh
echo "Running startup.sh ..."
echo "Select a student directory:"
select dir in submission_reminder_*/; do
    if [ -n "$dir" ] && [ -f "$dir/startup.sh" ]; then
        ./"$dir/startup.sh"
        break
    fi
done
echo ""
