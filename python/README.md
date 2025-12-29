# Flywheel Python Scripts

Python scripts for interacting with Flywheel using the Flywheel SDK.

## Setup

### 1. Create a Virtual Environment

```bash
cd python
python -m venv fw_env
```

### 2. Activate the Virtual Environment

**macOS/Linux:**
```bash
source fw_env/bin/activate
```

**Windows:**
```bash
fw_env\Scripts\activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

Or install the Flywheel SDK directly:
```bash
pip install flywheel-sdk
```

### 4. Log into Flywheel

Get your API key from your Flywheel account (Profile → API Key), then run:

```bash
fw login stanford.flywheel.io:<YOUR_API_KEY>
```

Replace `<YOUR_API_KEY>` with your actual API key.  Include the stanfordlabs.flywheel.io part if you're using Stanford Flywheel.

## Scripts

### delete_project.py

Delete a Flywheel project and all its data.

```bash
python delete_project.py <group_id> <project_label>
```

**Example:**
```bash
python delete_project.py nklmpg showdes
```

### download_project.py

Download a Flywheel project as a ZIP file.

```bash
python download_project.py <group_id> <project_label> [output_path]
```

**Examples:**
```bash
python download_project.py nklmpg showdes                    # Downloads to ./showdes.zip
python download_project.py nklmpg showdes /tmp/backup.zip   # Downloads to specified path
```

## Finding Group IDs and Project Labels

Use the Flywheel CLI to find the required arguments:

| What you need    | Command                          |
|------------------|----------------------------------|
| Group ID         | `fw ls`                          |
| Project Label    | `fw ls <group_id>`               |
| Subject Label    | `fw ls <group_id>/<project>`     |

## Deactivating the Virtual Environment

When you're done, deactivate the virtual environment:

```bash
deactivate
```
