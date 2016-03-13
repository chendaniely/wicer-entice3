###############################################################################
# ENGLISH B1
###############################################################################
for (id in pt_english_b1_ids) {
    pt_id <- id
    pt_english <- id # pt name
    data_config_pt_language <- 'english'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/english/%s-B1.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-02-english-B1.Rnw')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-02-english-B1.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}
