import subprocess
import datetime
import os

GREEN = '\033[0;32m'
YELLOW = '\033[1;33m'
RED = '\033[0;31m'
RESET = '\033[0m'

def backup_resources(resource_type, filter_keywords, backup_dir):
    """
    Backs up Kubernetes resources of a specific type, optionally filtering by keywords.

    Args:
        resource_type (str): The Kubernetes resource type (e.g., "statefulsets").
        filter_keywords (str): Keywords to filter resources, or "ff" for all.
        backup_dir (str): The directory to save the backups.
    """
    if filter_keywords == "ff":
        # If 'ff' is entered, back up all resources of that type, no filter applied
        try:
            command = ["kubectl", "get", resource_type, "--all-namespaces", "-o", "custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name", "--no-headers"]
            result = subprocess.run(command, capture_output=True, text=True, check=True)
            resources = result.stdout.strip()
        except subprocess.CalledProcessError as e:
            print(f"{RED}Error getting {resource_type} resources: {e}{RESET}")
            return
    else:
        # Otherwise, filter resources based on the input keyword(s)
        try:
            command = ["kubectl", "get", resource_type, "--all-namespaces", "-o", "custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name", "--no-headers"]
            grep_command = ["grep", "-i", filter_keywords]
            process1 = subprocess.Popen(command, stdout=subprocess.PIPE)
            process2 = subprocess.Popen(grep_command, stdin=process1.stdout, stdout=subprocess.PIPE, text=True)
            process1.stdout.close()
            stdout, stderr = process2.communicate()
            if stderr:
                print(f"{RED}Error filtering {resource_type} resources: {stderr}{RESET}")
                return
            resources = stdout.strip()
        except FileNotFoundError:
            print(f"{RED}Error: kubectl or grep command not found.{RESET}")
            return

    if not resources:
        if filter_keywords == "ff":
            print(f"{RED}No {resource_type} resources found in the cluster.{RESET}")
        else:
            print(f"{RED}No {resource_type} resources found matching '{filter_keywords}'.{RESET}")
    else:
        resource_folder = os.path.join(backup_dir, resource_type)
        os.makedirs(resource_folder, exist_ok=True)

        # Adjust message if 'ff' is used (no filter keyword)
        if filter_keywords == "ff":
            print(f"{YELLOW}Backing up all {resource_type} resources...{RESET}")
        else:
            print(f"{YELLOW}Backing up {resource_type} resources matching '{filter_keywords}'...{RESET}")

        # Loop through each resource and back it up
        for line in resources.splitlines():
            parts = line.split()
            if len(parts) == 2:
                namespace, name = parts
                try:
                    command = ["kubectl", "get", resource_type, name, "-n", namespace, "-o", "yaml"]
                    result = subprocess.run(command, capture_output=True, text=True, check=True)
                    with open(os.path.join(resource_folder, f"{name}.yaml"), "w") as f:
                        f.write(result.stdout)
                    print(f"{GREEN}Backup taken for {resource_type} {name} in namespace {namespace}{RESET}")
                except subprocess.CalledProcessError as e:
                    print(f"{RED}Error backing up {resource_type} {name} in namespace {namespace}: {e}{RESET}")

if __name__ == "__main__":
    filter_keywords = input("Enter keyword(s) to filter all resources (StatefulSets, Deployments, DaemonSets, ConfigMaps, Services, Ingress) or 'ff' to backup all resources: ")

    backup_folder_name = datetime.datetime.now().strftime("%d-%m-%y %H:%M")
    backup_dir = os.path.join("/Users/harivardhanreddy/BY-Folders", backup_folder_name)
    os.makedirs(backup_dir, exist_ok=True)
    print(f"{GREEN}Created backup folder: {backup_dir}{RESET}")

    resource_types = ["statefulsets", "deployments", "daemonsets", "configmaps", "services", "ingress"]

    if filter_keywords == "ff":
        print(f"{YELLOW}Backing up all resources in the cluster...{RESET}")
        for resource_type in resource_types:
            backup_resources(resource_type, filter_keywords, backup_dir)
    else:
        for resource_type in resource_types:
            backup_resources(resource_type, filter_keywords, backup_dir)

    print(f"{GREEN}Backup process completed.{RESET}")