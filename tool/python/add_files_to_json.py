import json
import os


def write_to_json(block_name, json_file_path, file_paths, additional_path):
    data = get_file_paths(file_paths, additional_path)

    with open(json_file_path, "r+") as file:
        json_data = json.load(file)

        if block_name in json_data:
            json_data[block_name].extend(data)
        else:
            json_data[block_name] = data

        file.seek(0)
        json.dump(json_data, file, indent=4)
        file.truncate()


def get_file_paths(file_paths, additional_path):
    paths = []

    for path in file_paths:
        file_name = os.path.basename(path)
        full_path = additional_path + file_name
        paths.append(full_path)

    return paths
