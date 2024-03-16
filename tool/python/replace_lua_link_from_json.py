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

            print(f"File updated: {file_path}")


directory_path = "./mod/src/WarOfTheRing/ControlMarkers"
pattern = r'"LuaScript":\s+".*"'
replacement = '"LuaScript": "#include ../../includes/SettlementsControlMarker.ttslua"'

search_and_replace(directory_path, pattern, replacement)
