import json
from functools import partial

from find_text_files_by_pattern import find_files_by_text

source_directory = "./mod/src/WarOfTheRing"
files_extension = ".json"
card_id_block_name = "CardID"

def extract_number_from_card(card_name, deck_file_path):
    folder_path = get_deck_folder_path(deck_file_path)
    file_path = folder_path + card_name

    with open(file_path, "r+") as file:
        json_data = json.load(file)
        object_block = json_data["Object"]
        cardId = object_block[card_id_block_name]
        return cardId
    
def get_deck_folder_path(deck_file_path):
    path_parts = deck_file_path.split('.')
    folder_path = '.' + path_parts[1] + '/'
    return folder_path

def run():
    pattern = '"DeckIDs": ['
    file_paths = find_files_by_text(source_directory, pattern, files_extension, True)

    for file_path in file_paths:
        with open(file_path, 'r') as file:
            json_data = json.load(file)
            object_block = json_data["Object"]
            
            deck_ids = object_block.get('DeckIDs', [])
            deck_ids.sort()

            object_block['DeckIDs'] = deck_ids
            json_data["Object"] = object_block

            card_names = json_data.get('ContainedObjectPaths', [])
            key_function = partial(extract_number_from_card, deck_file_path=file_path)
            sorted_file_names = sorted(card_names, key=key_function)

            json_data['ContainedObjectPaths'] = sorted_file_names

            with open(file_path, 'w') as output_file:
                json.dump(json_data, output_file, indent=4)

run()
