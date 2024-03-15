import os


def remove_lines_with_filenames(file_path, directory_path):
    filenames = []
    for root, _, files in os.walk(directory_path):
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

    updated_lines = [line for line in lines if line not in lines_to_remove]

    with open(file_path, "w") as file:
        file.writelines(updated_lines)

    print(f"Файл обновлен: {file_path}")


# Пример использования
json_file_path = "./mod/src/WarOfTheRing/Components_Bag.0e5fd1.json"
directory_path = "./mod/src/WarOfTheRing/Components_Bag/CharacterUnits"

remove_lines_with_filenames(json_file_path, directory_path)
