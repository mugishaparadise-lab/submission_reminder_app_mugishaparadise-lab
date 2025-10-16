#!/bin/bash
echo "We are launching the Reminder App"
if [-f "reminder.sh"]; then
./reminder.sh
else 
echo "reminder.sh not found"
exit 1
fi
'EOF' 
echo "Startup.sh created successfully"

find . "$base_dir" -type f -name '*.sh' -exec chmod +x {} \;
echo "Permission applied successfully"
echo "Your environment is ready to operate"
