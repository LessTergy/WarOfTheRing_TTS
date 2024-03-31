import os

from add_files_to_json import write_to_json
from find_text_files_by_pattern import find_files_by_text
from remove_file_names_from_json import remove_file_names_from_json
from replace_files import replace_files

destination_directory = "./mod/src/WarOfTheRing/Dice"
pattern = '"Description": "Dice;'

source_directory = "./mod/src/WarOfTheRing"
files_extension = ".json"

main_json_path = "./mod/src/WarOfTheRing.json"
main_json_block_name = "ObjectPaths"

additional_path = "./" + os.path.basename(destination_directory) + "/"

file_paths = find_files_by_text(source_directory, pattern, files_extension)
replace_files(file_paths, destination_directory)

remove_file_names_from_json(main_json_path, destination_directory)
write_to_json(
    main_json_block_name, main_json_path, destination_directory, additional_path
)
