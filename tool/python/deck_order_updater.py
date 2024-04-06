import json
import os

from find_text_files_by_pattern import find_files_by_text

deck_dict = {
    "00": "22",
    "01": "19",
    "02": "10",
    "03": "36",
    "04": "34",
    "05": "12",
    "06": "04",
    "07": "29",
    "08": "02",
    "09": "32",
    "10": "25",
    "11": "03",
    "12": "33",
    "13": "35",
    "14": "28",
    "15": "23",
    "16": "31",
    "17": "16",
    "18": "09",
    "19": "27",
    "20": "18",
    "21": "15",
    "22": "26",
    "23": "07",
    "24": "24",
    "25": "08",
    "26": "05",
    "27": "11",
    "28": "13",
    "29": "21",
    "30": "17",
    "31": "00",
    "32": "01",
    "33": "20",
    "34": "30",
    "35": "14",
    "36": "06",
}


def rename_card_files(files_folder, dict):
    for filename in os.listdir(files_folder):
        print(f"File {filename}")
        file_name, file_extension = os.path.splitext(filename)

        # Приводим number2 к формату "00" если значение меньше 10
        current_value = extract_number(file_name)
        new_value = dict[current_value]

        new_filename = f"{new_value}{file_extension}"

        current_path = os.path.join(files_folder, filename)
        new_path = os.path.join(files_folder, new_filename)

        os.rename(current_path, new_path)
        print(f"File {filename} renamed to {new_filename}")


def extract_number(file_name) -> str:
    parts = file_name.split("_")
    number = int(parts[1]) - 1
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
rename_card_files(image_folder, deck_dict)

source_directory = "./mod/src/WarOfTheRing"
pattern = "http://cloud-3.steamusercontent.com/ugc/1836922259142892350/88A32BDC33FAA7E2548BD9486900884D8A7D252A/"
files_extension = ".json"

file_paths = find_files_by_text(source_directory, pattern, files_extension, True)

card_id_block_name = "CardID"
new_values_dict = change_number_in_json(card_id_block_name, file_paths, deck_dict)

deck_id_block_name = "DeckIDs"
find_and_replace_old_values(deck_id_block_name, file_paths, new_values_dict)
