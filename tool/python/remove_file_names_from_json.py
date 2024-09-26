import os


def remove_folder_from_json(json_path, directory_path):
    filenames = []
    for _, _, files in os.walk(directory_path):
        for file_name in files:
            filenames.append(file_name)

    lines_to_remove = []

    with open(json_path, "r") as file:
        lines = file.readlines()
        for line in lines:
            for filename in filenames:
                if filename in line:
                    print(line)
                    lines_to_remove.append(line)

    # Keep only lines, which doesn't match with lines_to_remove
    updated_lines = [line for line in lines if line not in lines_to_remove]

    with open(json_path, "w") as file:
        file.writelines(updated_lines)

    print(f"File updated: {json_path}")

def remove_files_from_json(json_path, file_paths):
    lines_to_remove = []

    with open(json_path, "r") as file:
        lines = file.readlines()

        for line in lines:
            for path in file_paths:
                filename = os.path.basename(path)
                if filename in line:
                    print(line)
                    lines_to_remove.append(line)

    # Keep only lines, which doesn't match with lines_to_remove
    updated_lines = [line for line in lines if line not in lines_to_remove]

    with open(json_path, "w") as file:
        file.writelines(updated_lines)

    print(f"File updated: {json_path}")
