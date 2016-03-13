###############################################################################
# spanish B1
###############################################################################
for (id in pt_spanish_b1_ids) {
    pt_id <- id
    pt_spanish <- id # pt name
    pt_english <- pt_spanish
    data_config_pt_language <- 'spanish'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/spanish/%s-B1.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-04-spanish-B1.Rnw', encoding = 'UTF-8')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/spanish')) {
        dir.create('output/spanish')
    }
    file.copy(from = 'src/01-04-spanish-B1.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}
