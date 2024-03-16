import os
import shutil


def replace_files(file_paths, destination_dir):
    for file_path in file_paths:
        if file_path == destination_dir:
            continue

        destination_path = os.path.join(destination_dir, os.path.basename(file_path))
        shutil.move(file_path, destination_path)
        print(f"File replaced: {file_path} -> {destination_path}")
