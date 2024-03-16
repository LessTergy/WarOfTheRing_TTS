import os
import re


def process_files(directory_path, pattern):
    for root, _, files in os.walk(directory_path):
        for file_name in files:
            if not file_name.endswith(".json"):
                continue

            full_file_path = os.path.join(root, file_name)
            name = extract_name(file_name)
            type_in_description = extract_object_type_in_description(
                full_file_path, pattern
            )

            if type_in_description == "":
                continue

            new_file_name = name + "_" + type_in_description + ".json"
            new_file_path = os.path.join(root, new_file_name)

            os.rename(full_file_path, new_file_path)
            print("Комбинированная строка:", new_file_name)


def extract_name(file_name):
    name, _ = file_name.split(".", 1)
    return name


def extract_object_type_in_description(file_path, pattern):
    with open(file_path, "r") as file:
        content = file.read()
    match = re.search(pattern, content)
    if match:
        return match.group(1)
    return ""


character_pattern = r'"Description": "Character;(\w+);'
minion_pattern = r'"Description": "Minion;(\w+);'

# Пример использования
directory_path = "./mod/src/WarOfTheRing/Components_Bag/CharacterUnits"
process_files(directory_path, character_pattern)
process_files(directory_path, minion_pattern)
