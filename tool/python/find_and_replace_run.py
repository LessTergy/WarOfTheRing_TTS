from find_text_files_by_pattern import find_files_by_text
from replace_files import replace_files

source_directory = "./mod"
destination_directory = "./mod/src/WarOfTheRing/Components_Bag/CharacterUnits"
pattern = '"Description": "Minion;'
files_extension = ".json"

file_paths = find_files_by_text(source_directory, pattern, files_extension)
replace_files(file_paths, destination_directory)
