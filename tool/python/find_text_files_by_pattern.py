import os


def find_files_by_text(source_dir, search_pattern, file_extension, recursively=False):
    matched_files = []

    for root, dirs, files in os.walk(source_dir):
        for file_name in files:
            if not file_name.endswith(file_extension):
                continue

            file_path = os.path.join(root, file_name)

            with open(file_path, "r") as file:
                content = file.read()

                if search_pattern in content:
                    print(f"find_files_by_text - {file_path}")
                    matched_files.append(file_path)

        if not recursively:
            break

    return matched_files
