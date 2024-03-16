import os
import shutil

from find_files_by_extension import find_files_by_extension


def process(json_files, lua_files):
    for json_file_path in json_files:
        filename = os.path.basename(json_file_path)
        lua_file_path = find_filepath_with_same_basename(filename, lua_files)

        if lua_file_path == "":
            continue

        # os.remove(lua_file_path)
        directory_path = os.path.dirname(json_file_path)
        lua_file_name = os.path.basename(lua_file_path)
        new_lua_file_path = os.path.join(directory_path, lua_file_name)
        shutil.move(lua_file_path, new_lua_file_path)


def find_filepath_with_same_basename(json_file: str, lua_files: list) -> str:
    json_name = os.path.splitext(json_file)[0]
    for lua_file_path in lua_files:
        lua_file_name = os.path.basename(lua_file_path)
        lua_name = os.path.splitext(lua_file_name)[0]

        if json_name == lua_name:
            return lua_file_path

    return ""


json_dir = "./mod/src/WarOfTheRing/Settlements"
lua_dir = "./mod/src/WarOfTheRing"
json_extension = ".json"
lua_extension = ".lua"

json_files = find_files_by_extension(json_dir, json_extension)
lua_files = find_files_by_extension(lua_dir, lua_extension)
process(json_files, lua_files)
