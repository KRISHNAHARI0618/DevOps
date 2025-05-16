import os
import subprocess
from datetime import datetime

# Get all folders in current directory
folders = [f for f in os.listdir('.') if os.path.isdir(f)]

def run_git_command(command, cwd):
    result = subprocess.run(command, shell=True, cwd=cwd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"⚠️  Error in {cwd}: {command}\n{result.stderr}")
    else:
        print(f"✅ {cwd}: {command}\n{result.stdout.strip()}")

def sync_git_repo(repo_path):
    print(f"\n🔄 Syncing {repo_path}")
    run_git_command("git pull", repo_path)
    run_git_command("git add .", repo_path)
    commit_msg = f"Auto-sync: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}"
    run_git_command(f'git commit -m "{commit_msg}"', repo_path)
    run_git_command("git push", repo_path)

def main():
    print("🚀 Auto Git Sync Starting...\n")
    for folder in folders:
        if os.path.isdir(os.path.join(folder, ".git")):
            sync_git_repo(folder)
        else:
            print(f"⏩ Skipping {folder}: Not a Git repo")
    print("\n✅ All done.")

if __name__ == "__main__":
    main()
