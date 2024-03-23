import os


def remove_file_names_from_json(file_path, directory_path):
    filenames = []
    for _, _, files in os.walk(directory_path):
        for file_name in files:
            filenames.append(file_name)

    lines_to_remove = []

    with open(file_path, "r") as file:
        lines = file.readlines()
        for line in lines:
            for filename in filenames:
                if filename in line:
                    print(line)
                    lines_to_remove.append(line)

    # Keep only lines, which doesn't match with lines_to_remove
    updated_lines = [line for line in lines if line not in lines_to_remove]

    with open(file_path, "w") as file:
        file.writelines(updated_lines)

    print(f"File updated: {file_path}")
