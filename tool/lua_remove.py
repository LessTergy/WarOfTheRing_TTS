import os
import re


def search_and_replace(directory_path, pattern, replacement):
    for root, dirs, files in os.walk(directory_path):
        for file_name in files:
            file_path = os.path.join(root, file_name)
            with open(file_path, "r") as file:
                content = file.read()

            replaced_content = re.sub(pattern, replacement, content)

            with open(file_path, "w") as file:
                file.write(replaced_content)

            print(f"Файл обработан: {file_path}")


# Пример использования
directory_path = "./mod/src/WarOfTheRing/Components_Bag/CharacterUnits"
pattern = r'"LuaScript":\s+".*"'
replacement = '"LuaScript": ""'

search_and_replace(directory_path, pattern, replacement)
