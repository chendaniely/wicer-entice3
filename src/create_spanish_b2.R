###############################################################################
# spanish B2
###############################################################################
for (id in pt_spanish_b2_ids) {
    tryCatch(expr = {
        pt_id <- id
        pt_english <- id # pt name
        data_config_pt_language <- 'spanish'
        print(id)
        print(pt_id)

        rnw_base_name <- '01-04-spanish-B2'
        rnw_file_name <- paste0(rnw_base_name, '.Rnw')
        copy_from <- (paste0('src/', rnw_base_name, '.pdf'))
        output_file_name <- sprintf('output/spanish/%s-B2.pdf', pt_id)

        setwd(global_create_documents_directory)
        cat(getwd(), '\n')
        cat('\nStarting: ', rnw_base_name, '\n')
        knit2pdf(input = rnw_file_name, encoding = 'UTF-8', compiler = 'xelatex')
        cat('\nFinished: ', rnw_base_name, '\n')
    }, error = {
        function(e){
            print(e)
        }
    }, finally = {
        setwd(global_working_directory)
        cat(getwd(), '\n')
    })

    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }

    file.copy(from = copy_from, to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}
