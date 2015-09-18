library(knitr)

clean_images <- function() {
    dirs <- list.dirs(path = 'src', recursive = FALSE)
    temp_files <- sapply(X = dirs, FUN = list.files, pattern = '*.png', full.names = TRUE)
    temp_files <- unlist(temp_files)
    sapply(X = temp_files, file.remove)
    unlink('figure/', recursive = TRUE)
}

clean_knitr <- function(language){
    extensions <- c(".aux", ".log", ".pdf", ".tex")
    if (language == 'english') {
        files <- sprintf("src/01-01-english%s", extensions)
    } else if (language == 'spanish') {
        files <- sprintf("src/01-03-spanish%s", extensions)
    }
    file.remove(files)
}

# # data_config_pt_language <- "english"
pt_englishs <- c('Sample1', 'Sample4') # person's name
pt_ids <- c('Sample1', 'Sample4') # person's ID

# pt_ids <- pt_ids[2]
# pt_englishs <- pt_englishs[2]

for (id in pt_ids) {
    pt_id <- id
    pt_english <- id # pt name
    data_config_pt_language <- 'english'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/english/%s.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-01-english.Rnw')
    }, error = function(e){})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-01-english.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}

pt_englishs <- c('Sample2', 'Sample3', 'Sample5') # person's name
pt_ids <- c('Sample2', 'Sample3', 'Sample5') # person's ID

# pt_ids <- pt_ids[2]
# pt_englishs <- pt_englishs[2]

for (id in pt_ids) {
    pt_id <- id
    pt_english <- id
    data_config_pt_language <- 'spanish'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/spanish/%s.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-03-spanish.Rnw')
    }, error = function(e){})

    setwd('../')
    if (!dir.exists('output/spanish')) {
        dir.create('output/spanish')
    }
    file.copy(from = 'src/01-03-spanish.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}
