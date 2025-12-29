"""
download_project.py - Download a Flywheel project as a ZIP file

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
  python download_project.py <group_id> <project_label> [output_path]

Example:
  python download_project.py nklmpg showdes
  python download_project.py nklmpg showdes /path/to/output.zip

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
python download_project.py <group_id> <project_label> [output_path]
"""

import flywheel
import sys
import os

def main():
    # Check if the user provided the correct number of arguments
    if len(sys.argv) < 3 or len(sys.argv) > 4:
        print()
        print("  Usage:   python download_project.py <group_id> <project_label> [output_path]")
        print("  Example: python download_project.py nklmpg showdes")
        print("  Example: python download_project.py nklmpg showdes ./my_project.zip")
        print()
        print("  To find group_id:      fw ls")
        print("  To find project_label: fw ls <group_id>")
        print()
        sys.exit(1)

    group_id = sys.argv[1]
    project_label = sys.argv[2]
    
    # Set output path (default to project_label.zip in current directory)
    if len(sys.argv) == 4:
        output_path = sys.argv[3]
    else:
        output_path = f"{project_label}.zip"

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
        
        # Get absolute path for output
        output_path = os.path.abspath(output_path)
        print(f"Output file: {output_path}")
        
        # Check if file already exists
        if os.path.exists(output_path):
            confirm = input(f"File '{output_path}' already exists. Overwrite? (y/n): ")
            if confirm.lower() != 'y':
                print("Download cancelled by user.")
                sys.exit(0)
        
        # Confirm download (projects can be large)
        confirm = input(f"CONFIRM: Download project '{project.label}' as ZIP? (y/n): ")
        
        if confirm.lower() == 'y':
            print(f"Downloading project '{project.label}'...")
            print("This may take a while depending on project size...")
            
            # Download the project as a ZIP file
            fw.download_tar(project, output_path, include_types=['input', 'output', 'analysis'])
            
            # Get file size for user feedback
            file_size = os.path.getsize(output_path)
            file_size_mb = file_size / (1024 * 1024)
            
            print("-" * 30)
            print(f"Download complete!")
            print(f"File: {output_path}")
            print(f"Size: {file_size_mb:.2f} MB")
            print("-" * 30)
        else:
            print("Download cancelled by user.")

    except flywheel.ApiException as e:
        print(f"Flywheel Error: Could not find project '{project_path}'.")
        print(f"Status: {e.status}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
