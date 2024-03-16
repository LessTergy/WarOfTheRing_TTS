import os


def find_files_by_text(source_dir, search_pattern, file_extension):
    matched_files = []

    for root, _, files in os.walk(source_dir):
        for file_name in files:
            if not file_name.endswith(file_extension):
                continue

            file_path = os.path.join(root, file_name)

            with open(file_path, "r") as file:
                content = file.read()

                if search_pattern in content:
                    matched_files.append(file_path)

    return matched_files
