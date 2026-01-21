import os


def replace_characters_in_filenames(directory_path, replacements):
    for root, _, files in os.walk(directory_path):
        for file_name in files:
            if not has_characters(file_name, replacements):
                continue

            original_file_path = os.path.join(root, file_name)
            replaced_file_name = replace_characters(file_name, replacements)
            replaced_file_path = os.path.join(root, replaced_file_name)
            os.rename(original_file_path, replaced_file_path)
            print(f"Файл переименован: {file_name} -> {replaced_file_name}")


def has_characters(line, replacements):
    for old_char, new_char in replacements.items():
        if old_char in line:
            return True
    return False


def replace_characters(line, replacements):
    for old_char, new_char in replacements.items():
        line = line.replace(old_char, new_char)
    return line


directory_path = "./mod"
replacements = {"é": "e", "ú": "u", "ó": "o"}

replace_characters_in_filenames(directory_path, replacements)
