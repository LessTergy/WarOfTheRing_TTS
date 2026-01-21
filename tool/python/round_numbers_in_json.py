import json
import os


def round_numbers_in_json_files(folder_path):
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if not file.endswith(".json"):
                continue

            file_path = os.path.join(root, file)
            with open(file_path, "r") as json_file:
                try:
                    data = json.load(json_file)
                    rounded_data = round_numbers(data)
                    with open(file_path, "w") as modified_file:
                        json.dump(rounded_data, modified_file, indent=4)
                    print(f"Modified file: {file_path}")
                except json.JSONDecodeError:
                    print(f"Error parsing JSON file: {file_path}")


def round_numbers(data):
    if isinstance(data, list):
        return [round_numbers(item) for item in data]
    elif isinstance(data, dict):
        return {key: round_numbers(value) for key, value in data.items()}
    elif isinstance(data, (float)):
        num = round(data, 2)
        if abs(num) < 0.01:
            num = 0
        return num
    else:
        return data


folder_path = "./mod/src/"
round_numbers_in_json_files(folder_path)
