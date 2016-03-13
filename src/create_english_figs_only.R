#
# Figures only
#
for (id in pt_english_all_ids) {
    pt_id <- id
    pt_english <- id # pt name
    data_config_pt_language <- 'english'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/english/%s-FIGS.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-01-english-figs.Rnw', compiler = 'xelatex')
    }, error = function(e){stop("Error")})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-01-english-figs.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}
