import os

def change_extension(directory):
    for dirpath, _, filenames in os.walk(directory):
        for filename in filenames:
            if filename.endswith('.yaml') or filename.endswith('.yml'):
                old_path = os.path.join(dirpath, filename)
                new_path = os.path.splitext(old_path)[0] + '.sh'
                os.rename(old_path, new_path)
                print(f"Changed {old_path} to {new_path}")

# Replace 'directory_path' with the path to the directory containing your YAML files.
directory_path = 'C:\\Users\\KRISHNA HARI\\DevOps2023\\Shell-Scripts'
change_extension(directory_path)
