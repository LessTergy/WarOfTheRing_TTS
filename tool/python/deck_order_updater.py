import json
import os

from find_text_files_by_pattern import find_files_by_text


def rename_card_files(files_folder) -> dict:
    deck_dict = dict()

    for filename in os.listdir(files_folder):
        print(f"File {filename}")
        file_name, file_extension = os.path.splitext(filename)

        # Приводим number2 к формату "00" если значение меньше 10
        current_value = extract_number(file_name, 0)
        new_value = extract_number(file_name, 1)
        deck_dict[current_value] = new_value

        new_filename = f"{new_value}{file_extension}"

        current_path = os.path.join(files_folder, filename)
        new_path = os.path.join(files_folder, new_filename)

        os.rename(current_path, new_path)
        print(f"File {filename} renamed to {new_filename}")

    return deck_dict


def extract_number(file_name, index) -> str:
    parts = file_name.split("_")
    number = int(parts[index]) - 1
    return f"{number:02}"


def change_number_in_json(block_name, file_paths, value_dict) -> dict:
    id_dict = dict()

    for file_path in file_paths:
        with open(file_path, "r+") as file:
            json_data = json.load(file)
            object_block = json_data["Object"]

            if block_name not in object_block:
                continue

            old_json_value = object_block[block_name]
            old_card_number = str(old_json_value)[-2:]
            new_card_number = value_dict[old_card_number]

            new_json_value = int(str(old_json_value)[:-2] + new_card_number)
            object_block[block_name] = new_json_value

            id_dict[old_json_value] = new_json_value

            json_data["Object"] = object_block
            file.seek(0)
            json.dump(json_data, file, indent=4)
            file.truncate()

            print(f"change_number_in_json - {old_json_value} -> {new_json_value}")

    return id_dict


def find_and_replace_old_values(block_name, file_paths, value_dict):
    for old_value, new_value in value_dict.items():
        for file_path in file_paths:
            with open(file_path, "r+") as file:
                json_data = json.load(file)
                object_block = json_data["Object"]

                if block_name not in object_block:
                    continue

                ids = object_block[block_name]

                if old_value not in ids:
                    continue

                index_to_replace = ids.index(old_value)
                ids[index_to_replace] = new_value

                object_block[block_name] = ids
                print(f"find_and_replace_old_values - {old_value} -> {new_value}")

                json_data["Object"] = object_block
                file.seek(0)
                json.dump(json_data, file, indent=4)
                file.truncate()


image_folder = "./../images"
deck_dict = rename_card_files(image_folder)

source_directory = "./mod/src/WarOfTheRing"
pattern = "т"
files_extension = ".json"

file_paths = find_files_by_text(source_directory, pattern, files_extension, True)

card_id_block_name = "CardID"
new_values_dict = change_number_in_json(card_id_block_name, file_paths, deck_dict)

deck_id_block_name = "DeckIDs"
find_and_replace_old_values(deck_id_block_name, file_paths, new_values_dict)
