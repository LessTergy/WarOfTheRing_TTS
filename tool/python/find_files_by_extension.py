import os


def find_files_by_extension(source_dir, file_extension):
    file_paths = []

    for root, _, files in os.walk(source_dir):
        for file_name in files:
            if not file_name.endswith(file_extension):
                continue

            file_path = os.path.join(root, file_name)
            file_paths.append(file_path)

    return file_paths
