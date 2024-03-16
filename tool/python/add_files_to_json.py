import json
import os


def write_to_json(block_name, json_file_path, directory_path, additional_path):
    data = get_file_paths(directory_path, additional_path)

    with open(json_file_path, "r+") as file:
        json_data = json.load(file)

        if block_name in json_data:
            json_data[block_name].extend(data)
        else:
            json_data[block_name] = data

        file.seek(0)
        json.dump(json_data, file, indent=4)
        file.truncate()


def get_file_paths(directory_path, additional_path):
    paths = []
    for _, _, files in os.walk(directory_path):
        for file_name in files:
            full_path = additional_path + file_name
            paths.append(full_path)

    return paths


main_json_block_name = "ObjectPaths"
main_json_path = "./mod/src/WarOfTheRing.json"

secondary_json_block_name = "ContainedObjectPaths"
json_file_path = "./mod/src/WarOfTheRing/Components_Bag.0e5fd1.json"

directory_path = "./mod/src/WarOfTheRing/Settlements"
additional_path = "./Settlements/"

write_to_json(main_json_block_name, main_json_path, directory_path, additional_path)
