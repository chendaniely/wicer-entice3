###############################################################################
# spanish A2
###############################################################################
for (id in pt_spanish_a2_ids) {
    pt_id <- id
    pt_spanish <- id # pt name
    pt_english <- pt_spanish
    data_config_pt_language <- 'spanish'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/spanish/%s-A2.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-04-spanish-A2.Rnw', encoding = 'UTF-8')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/spanish')) {
        dir.create('output/spanish')
    }
    file.copy(from = 'src/01-04-spanish-A2.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}
