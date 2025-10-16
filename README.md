# Submission Reminder app
# Application description
This application is used to alert student about upcoming assignment deadlines.
# Features
This application contains two scripts:
1. Create_environment.sh
2. copilot_shell_script.sh
# Operation of the scripts
1.create_environment.sh:
*That sets up the directory structure for an application called submission_reminder_app. 
*This script creates the necessary directories and files for a program that shows students who need to be reminded of their pending submissions
2. copilot_shell_script.sh
*Prompts the user to enter the assignment name, then the new input will replace the current name in config/config.env on the ASSIGNMENT value (row 2)@
*When the replacement is complete,it reruns startup.sh that will check the non-submission status of students for the new assignment that was saved in the config/config.env.

## How the Application Works

The Submission Reminder Application is a command-line tool that tracks student assignment submissions and identifies who needs reminders.

### Application Flow:

1. **Setup Phase:**
   - Run `create_environment.sh` to create a directory structure for each student
   - Each student gets their own folder containing configuration files, submission data, and application scripts

2. **Data Storage:**
   - Student submission records are stored in `assets/submissions.txt` with format: `student_name, assignment_name, submission_status`
   - Application settings (assignment name, deadline days) are stored in `config/config.env`

3. **Execution Phase:**
   - Run `copilot_shell_script.sh` to update the assignment you want to check
   - Select which student's directory to process
   - The `startup.sh` script initializes the application by:
     - Loading configuration from `config/config.env`
     - Importing helper functions from `modules/functions.sh`
     - Executing `app/reminder.sh`

4. **Processing:**
   - The application reads `submissions.txt` and filters records based on the current assignment name
   - It identifies students with "not submitted" status
   - Displays a list of students who need reminders for that specific assignment

5. **Output:**
   - Shows which students haven't submitted the assignment
   - Provides reminder notifications based on the configured deadline

**In essence:** The app automates the process of checking which students haven't submitted a specific assignment, saving time compared to manually reviewing submission records.


