import os
import shutil


def analyze_json_files(source_dir, destination_dir):
    matched_files = []
    pattern = '"Description": "Character;Token;'

    # Проверяем каждый файл и папку в указанной директории
    for root, _, files in os.walk(source_dir):
        for file_name in files:
            if file_name.endswith(".json"):
                file_path = os.path.join(root, file_name)

                with open(file_path, "r") as file:
                    content = file.read()

                    if pattern in content:
                        matched_files.append(file_path)

        for file_path in matched_files:
            if file_path != destination_dir:
                destination_path = os.path.join(
                    destination_dir, os.path.basename(file_path)
                )
                shutil.move(file_path, destination_path)
                print(f"Файл перемещен: {file_path} -> {destination_path}")


# Пример использования
source_directory = "./mod"
destination_directory = "./mod/src/WarOfTheRing"

analyze_json_files(source_directory, destination_directory)
