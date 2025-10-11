#!/usr/bin/env bash
read -p "Enter your name: " name
mkdir -p "submission_reminder_$name"
echo "Congratulations ! directory successfully created"
base_dir= /submission_reminder_$name
mkdir -p /base_dir/config
mkdir -p /base_dir/app
mkdir -p /base_dir/assets
mkdir -p /base_dir/modules
echo "Sub-directory successfully created"
cp config.env /base_dir/config 
cp submissions.txt /base_dir/assets
cp functions.sh /base_dir/modules
echo "Files moved to the subdirectories successfully"
touch base_dir/startup.sh
echo "Startup.sh created successfully"
chmod +x *.sh
echo "Permission applied successfully"
