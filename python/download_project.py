"""
download_project.py - Download a Flywheel project as a tar archive

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
  python download_project.py <group_id> <project_label> [output_path] [options]

Example:
  python download_project.py wandell achiasma
  python download_project.py wandell achiasma ./my_project.tar
  python download_project.py wandell achiasma --confirm
  python download_project.py wandell achiasma --timeout 3600

Options:
  --confirm          Ask for confirmation before downloading
  --timeout <secs>   Set request timeout in seconds (default: 3600)

To extract the downloaded tar file:
  tar -xvf <filename>.tar

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
python download_project.py <group_id> <project_label> [output_path] [options]
"""

import flywheel
import sys
import os

def main():
    # Check for --confirm flag
    confirm_flag = '--confirm' in sys.argv
    
    # Check for --timeout option (default 1 hour for large projects)
    timeout = 3600
    args = []
    i = 0
    while i < len(sys.argv):
        if sys.argv[i] == '--timeout' and i + 1 < len(sys.argv):
            try:
                timeout = int(sys.argv[i + 1])
            except ValueError:
                print(f"Error: Invalid timeout value '{sys.argv[i + 1]}'")
                sys.exit(1)
            i += 2
        elif sys.argv[i] == '--confirm':
            i += 1
        else:
            args.append(sys.argv[i])
            i += 1
    
    # Check if the user provided the correct number of arguments
    if len(args) < 3 or len(args) > 4:
        print()
        print("  Usage:   python download_project.py <group_id> <project_label> [output_path] [options]")
        print("  Example: python download_project.py wandell achiasma")
        print("  Example: python download_project.py wandell achiasma ./my_project.tar")
        print("  Example: python download_project.py wandell achiasma --timeout 7200")
        print()
        print("  To find group_id:      fw ls")
        print("  To find project_label: fw ls <group_id>")
        print()
        print("  Options:")
        print("    --confirm          Ask for confirmation before downloading")
        print("    --timeout <secs>   Set request timeout in seconds (default: 3600)")
        print()
        sys.exit(1)

    group_id = args[1]
    project_label = args[2]
    
    # Set output path (default to project_label.tar in current directory)
    if len(args) == 4:
        output_path = args[3]
    else:
        output_path = f"{project_label}.tar"

    try:
        # Connect using the credentials from your 'fw login'
        # Set timeout for large downloads (default 1 hour)
        fw = flywheel.Client(request_timeout=timeout)
        print(f"Connected to: {fw.get_config().site.id}")
        print(f"Request timeout: {timeout} seconds")
        
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
            overwrite = input(f"File '{output_path}' already exists. Overwrite? (y/n): ")
            if overwrite.lower() != 'y':
                print("Download cancelled by user.")
                sys.exit(0)
        
        # Confirm download if --confirm flag is set
        if confirm_flag:
            confirm = input(f"CONFIRM: Download project '{project.label}' as tar archive? (y/n): ")
            if confirm.lower() != 'y':
                print("Download cancelled by user.")
                return
        
        print(f"Downloading project '{project.label}'...")
        print("This may take a while depending on project size...")
        
        # Download the project as a tarball
        fw.download_tar(project, output_path)
        
        # Get file size for user feedback
        file_size = os.path.getsize(output_path)
        file_size_mb = file_size / (1024 * 1024)
        
        print("-" * 30)
        print(f"Download complete!")
        print(f"File: {output_path}")
        print(f"Size: {file_size_mb:.2f} MB")
        print("-" * 30)

    except flywheel.ApiException as e:
        print(f"Flywheel Error: Could not find project '{project_path}'.")
        print(f"Status: {e.status}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
