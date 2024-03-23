import os
import re

from find_text_files_by_pattern import find_files_by_text


def find_and_rename_file(directory_path, origin_name, new_name):
    for root, _, files in os.walk(directory_path):
        for file_name in files:
            if origin_name != file_name:
                continue

            full_file_path = os.path.join(root, file_name)
            new_file_path = os.path.join(root, new_name)

            os.rename(full_file_path, new_file_path)
            print("Renamed: " + full_file_path)


def rename_in_files(file_paths, origin_name, new_name):
    for file_path in file_paths:
        with open(file_path, "r") as file:
            content = file.read()
            replaced_content = re.sub(origin_name, new_name, content)

        with open(file_path, "w") as file:
            file.write(replaced_content)
            print("Replaced: " + file_path)


origin_name = "Theoden.19e479.json"
new_name = "Theoden_Token.json"

directory_path = "./mod/src/"
file_extension = ".json"

find_and_rename_file(directory_path, origin_name, new_name)
file_paths = find_files_by_text(directory_path, origin_name, file_extension)
rename_in_files(file_paths, origin_name, new_name)
