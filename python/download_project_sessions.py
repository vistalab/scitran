"""
download_project_sessions.py - Download a Flywheel project in session chunks.

Usage:
  python download_project_sessions.py <group_id> <project_label> [output_dir] [options]

Example:
  python download_project_sessions.py wandell ISETAutoEval20200108 ./downloads --batch-size 25

Options:
  --batch-size <n>   Number of sessions per tar file (default: 25)
  --timeout <secs>   Set request timeout in seconds (default: 3600)
"""

import flywheel
import sys
import os
import math

def main():
    # Defaults
    timeout = 3600
    batch_size = 25
    
    # Parse args manually to handle flags
    args = []
    i = 0
    while i < len(sys.argv):
        arg = sys.argv[i]
        if arg == '--timeout':
            if i + 1 < len(sys.argv):
                try:
                    timeout = int(sys.argv[i + 1])
                    i += 1
                except ValueError:
                    print(f"Error: Invalid timeout '{sys.argv[i+1]}'")
                    sys.exit(1)
            else:
                print("Error: --timeout requires a value")
                sys.exit(1)
        elif arg == '--batch-size':
            if i + 1 < len(sys.argv):
                try:
                    batch_size = int(sys.argv[i + 1])
                    i += 1
                except ValueError:
                    print(f"Error: Invalid batch-size '{sys.argv[i+1]}'")
                    sys.exit(1)
            else:
                print("Error: --batch-size requires a value")
                sys.exit(1)
        else:
            args.append(arg)
        i += 1
    
    if len(args) < 3 or len(args) > 4:
        print(__doc__)
        sys.exit(1)
        
    group_id = args[1]
    project_label = args[2]
    output_dir = args[3] if len(args) == 4 else os.getcwd()
    
    # Create output directory if it doesn't exist
    if not os.path.exists(output_dir):
        try:
            os.makedirs(output_dir)
        except OSError as e:
            print(f"Error creating directory {output_dir}: {e}")
            sys.exit(1)
            
    try:
        # Connect
        fw = flywheel.Client(request_timeout=timeout)
        print(f"Connected to: {fw.get_config().site.id}")
        print(f"Request timeout: {timeout} seconds")
        
        # Find Project
        project_path = f"{group_id}/{project_label}"
        print(f"Searching for: {project_path}...")
        project = fw.lookup(project_path)
        print(f"Found project: {project.label} (ID: {project.id})")
        
        # Get Sessions
        print("Fetching session list (this may take a moment)...")
        sessions = project.sessions()
        # Ensure list
        if not isinstance(sessions, list):
            sessions = list(sessions)
            
        total_sessions = len(sessions)
        print(f"Total sessions: {total_sessions}")
        
        if total_sessions == 0:
            print("No sessions found.")
            sys.exit(0)
            
        num_batches = math.ceil(total_sessions / batch_size)
        print(f"Processing in {num_batches} batches of {batch_size} sessions each.")
        print(f"Output directory: {os.path.abspath(output_dir)}")
        
        for i in range(num_batches):
            start_idx = i * batch_size
            end_idx = min((i + 1) * batch_size, total_sessions)
            batch = sessions[start_idx:end_idx]
            
            part_num = i + 1
            filename = f"{project_label}_part{part_num:03d}.tar"
            output_path = os.path.join(output_dir, filename)
            
            print(f"[{part_num}/{num_batches}] Downloading sessions {start_idx+1}-{end_idx} to {filename}...")
            
            try:
                fw.download_tar(batch, output_path)
                
                if os.path.exists(output_path):
                    size_mb = os.path.getsize(output_path) / (1024 * 1024)
                    print(f"  - Success: {size_mb:.2f} MB")
                else:
                    print("  - Warning: File not created.")
                    
            except flywheel.ApiException as e:
                if e.status == 504:
                    print(f"  - Error: 504 Gateway Timeout for batch {part_num}.")
                    print("    Try reducing --batch-size.")
                else:
                    print(f"  - Flywheel Error: {e}")
            except Exception as e:
                print(f"  - Error: {e}")
                
        print("Done.")

    except flywheel.ApiException as e:
        if e.status == 404:
            print(f"Flywheel Error: Could not find project '{project_path}'.")
        else:
            print(f"Flywheel Error: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
