clean_images <- function() {
    dirs <- list.dirs(path = 'src', recursive = FALSE)
    temp_files <- sapply(X = dirs, FUN = list.files, pattern = '*.png$|*.tex$', full.names = TRUE)
    temp_files <- unlist(temp_files)
    sapply(X = temp_files, file.remove)
    unlink('figure/', recursive = TRUE)
}

clean_knitr <- function(language){
    # extensions <- c(".aux", ".log", ".pdf", ".tex")
    # if (language == 'english') {
    #     files <- sprintf("src/01-02-english%s", extensions)
    # } else if (language == 'spanish') {
    #     files <- sprintf("src/01-03-spanish%s", extensions)
    # }
    files <- list.files(path = 'src/', full.names = TRUE, recursive = TRUE,
                        pattern = '*.aux$|*.log$|*.pdf$|*.tex$')
    file.remove(files)
}

generate_document <- function(id_number, language, base_rnw_file_name){

}
