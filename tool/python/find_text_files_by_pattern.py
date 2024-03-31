import os


def find_files_by_text(source_dir, search_pattern, file_extension):
    matched_files = []

    with os.scandir(source_dir) as entries:
        for entry in entries:
            if not entry.is_file():
                continue

            file_name = entry.name
            if not file_name.endswith(file_extension):
                continue

            with open(entry.path, "r") as file:
                content = file.read()

                if search_pattern in content:
                    matched_files.append(entry.path)

    return matched_files
