"""
delete_project.py - Delete a Flywheel project

Setup:
  (a) Created a virtual environment in this directory:
        python -m venv fw_env
      Then activated it:
        source fw_env/bin/activate

  (b) Installed the Flywheel SDK:
        pip install flywheel-sdk

  (c) Logged into Flywheel using the CLI with my API key:
        fw login stanford.flywheel.io:<API_KEY>
      (Get API key from your account at stanford.flywheel.io)

Usage:
  python delete_project.py <group_id> <project_label>

Example:
  python delete_project.py nklmpg showdes

  FLYWHEEL HIERARCHY REFERENCE
---------------------------
To find the required arguments for this script, use the Flywheel CLI (fw):

1. Find Group IDs:
   $ fw ls
   
2. Find Project Labels (inside a group):
   $ fw ls <group_id>

3. (Optional) Find unique Project IDs:
   $ fw ls <group_id> --id

Example Mapping:
+-----------------------------------------------------------------------+
| LEVEL    | COMMAND                               | TARGET TO USE      |
|----------|---------------------------------------|--------------------|
| Group    | fw ls                                 | group_id           |
| Project  | fw ls <group_id>                      | project_label      |
| Subject  | fw ls <group_id>/<project_label>      | subject_label      |
+-----------------------------------------------------------------------+

Usage for this script:
python delete_project.py <group_id> <project_label>
"""

import flywheel
import sys

def main():
    # Check if the user provided the correct number of arguments
    if len(sys.argv) != 3:
        print("Usage: python delete_project.py <group_id> <project_label>")
        print("Example: python delete_project.py snl-rad 'My Project Name'")
        sys.exit(1)

    group_id = sys.argv[1]
    project_label = sys.argv[2]

    try:
        # Connect using the credentials from your 'fw login'
        fw = flywheel.Client()
        print(f"Connected to: {fw.get_config().site.id}")
        
        # Look up the project
        project_path = f"{group_id}/{project_label}"
        print(f"Searching for: {project_path}...")
        
        project = fw.lookup(project_path)
        
        print("-" * 30)
        print(f"TARGET FOUND:")
        print(f"Label: {project.label}")
        print(f"ID:    {project.id}")
        print("-" * 30)
        
        # Safety Confirmation
        confirm = input(f"CONFIRM: Delete project '{project.label}' and ALL its data? (y/n): ")
        
        if confirm.lower() == 'y':
            # Stanford instances usually require a reason for the audit log
            fw.delete_project(project.id)
            print("Project successfully deleted.")
        else:
            print("Deletion cancelled by user.")

    except flywheel.ApiException as e:
        print(f"Flywheel Error: Could not find project '{project_path}'.")
        print(f"Status: {e.status}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
