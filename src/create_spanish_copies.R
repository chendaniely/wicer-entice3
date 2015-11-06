library(stringr)
dirs <- list.dirs('src', recursive = TRUE, full.names = TRUE)

base_files <- lapply(dirs, FUN = list.files, pattern = 'spanish_.*.Rnw', full.names = TRUE)
base_files <- unlist(base_files)


for(base_file in base_files){
    # print(base_file)
    image_file_name <- str_replace(base_file, '.Rnw', '_image.Rnw')
    text_file_name <- str_replace(base_file, '.Rnw', '_text.Rnw')
    # print(c(base_file, image_file_name, text_file_name))
    file.copy(base_file, image_file_name)
    file.copy(base_file, text_file_name)
}
