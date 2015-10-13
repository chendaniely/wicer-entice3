library(knitr)

rm(list = ls())

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

###############################################################################
# ENGLISH A1
###############################################################################
# # data_config_pt_language <- "english"
pt_englishs <- c('Sample1', 'Sample4') # person's name
pt_ids <- c('Sample1', 'Sample4') # person's ID

pt_ids <- pt_ids[2]
pt_englishs <- pt_englishs[2]

for (id in pt_ids) {
    pt_id <- id
    pt_english <- id # pt name
    data_config_pt_language <- 'english'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/english/%s-A1.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-02-english-A1.Rnw')
    }, error = function(e){})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-02-english-A1.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}

###############################################################################
# ENGLISH B2
###############################################################################

# # data_config_pt_language <- "english"
pt_englishs <- c('Sample1', 'Sample4') # person's name
pt_ids <- c('Sample1', 'Sample4') # person's ID

pt_ids <- pt_ids[2]
pt_englishs <- pt_englishs[2]

for (id in pt_ids) {
    pt_id <- id
    pt_english <- id # pt name
    data_config_pt_language <- 'english'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/english/%s-B2.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-02-english-B2.Rnw')
    }, error = function(e){})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-02-english-B2.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}
