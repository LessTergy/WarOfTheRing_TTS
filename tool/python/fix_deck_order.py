import json

file_path = './mod/src/WarOfTheRing/Shadow_Strategy_Event_Deck.6508fd.json'
card_id_block_name = "CardID"

def extract_number_from_card(card_name):
    folder_path = get_deck_folder_path()
    file_path = folder_path + card_name

    with open(file_path, "r+") as file:
        json_data = json.load(file)
        object_block = json_data["Object"]
        cardId = object_block[card_id_block_name]
        return cardId
    
def get_deck_folder_path():
    path_parts = file_path.split('.')
    folder_path = '.' + path_parts[1] + '/'
    return folder_path

def run():
    with open(file_path, 'r') as file:
        json_data = json.load(file)
        object_block = json_data["Object"]
        
        deck_ids = object_block.get('DeckIDs', [])
        deck_ids.sort()

        object_block['DeckIDs'] = deck_ids
        json_data["Object"] = object_block

        card_names = json_data.get('ContainedObjectPaths', [])
        sorted_file_names = sorted(card_names, key=extract_number_from_card)

        json_data['ContainedObjectPaths'] = sorted_file_names

        with open(file_path, 'w') as output_file:
            json.dump(json_data, output_file, indent=4)

run()
