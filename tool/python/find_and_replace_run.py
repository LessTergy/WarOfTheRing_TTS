from find_text_files_by_pattern import find_files_by_text
from replace_files import replace_files

source_directory = "./mod/src/WarOfTheRing"
destination_directory = "./mod/src/WarOfTheRing/ControlMarkers"
pattern = '"Description": "SettlementControlMarker;'
files_extension = ".json"

file_paths = find_files_by_text(source_directory, pattern, files_extension)
replace_files(file_paths, destination_directory)
