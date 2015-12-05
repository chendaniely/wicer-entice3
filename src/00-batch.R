library(knitr)

rm(list = ls())

source('src/helper-00-batch.R')
# Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

###############################################################################
#
# SETUP
#
###############################################################################

pt_english_a1_ids <- c('Sample1', 'Sample4')
pt_english_a2_ids <- c('Sample1', 'Sample4')
pt_english_b1_ids <- c('Sample1', 'Sample4')
pt_english_b2_ids <- c('Sample1', 'Sample4')
pt_english_all_ids <- c(pt_english_a1_ids, pt_english_a2_ids, pt_english_b1_ids, pt_english_b2_ids)

pt_spanish_a1_ids <- c('Sample2', 'Sample3', 'Sample5')
pt_spanish_a2_ids <- c('Sample2', 'Sample3', 'Sample5')
pt_spanish_b1_ids <- c('Sample2', 'Sample3', 'Sample5')
pt_spanish_b2_ids <- c('Sample2', 'Sample3', 'Sample5')
pt_spanish_all_ids <- c(pt_spanish_a1_ids, pt_spanish_a2_ids, pt_spanish_b1_ids, pt_spanish_b2_ids)


















###############################################################################
# ENGLISH A1
###############################################################################
for (id in pt_english_a1_ids) {
    pt_id <- id
    pt_english <- id # pt name
    data_config_pt_language <- 'english'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/english/%s-A1.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-02-english-A1.Rnw')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-02-english-A1.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}

###############################################################################
# ENGLISH A2
###############################################################################
for (id in pt_english_a2_ids) {
    pt_id <- id
    pt_english <- id # pt name
    data_config_pt_language <- 'english'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/english/%s-A2.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-02-english-A2.Rnw')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-02-english-A2.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}

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

###############################################################################
# ENGLISH B2
###############################################################################
for (id in pt_english_b2_ids) {
    pt_id <- id
    pt_english <- id # pt name
    data_config_pt_language <- 'english'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/english/%s-B2.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-02-english-B2.Rnw')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-02-english-B2.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}



















###############################################################################
# spanish A1
###############################################################################
for (id in pt_spanish_a1_ids) {
    pt_id <- id
    pt_spanish <- id # pt name
    pt_english <- pt_spanish
    data_config_pt_language <- 'spanish'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/spanish/%s-A1.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-04-spanish-A1.Rnw', encoding = 'UTF-8')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/spanish')) {
        dir.create('output/spanish')
    }
    file.copy(from = 'src/01-04-spanish-A1.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}

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

###############################################################################
# spanish B2
###############################################################################
for (id in pt_spanish_b2_ids) {
    pt_id <- id
    pt_spanish <- id # pt name
    pt_english <- pt_spanish
    data_config_pt_language <- 'spanish'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/spanish/%s-B2.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-04-spanish-B2.Rnw', encoding = 'UTF-8')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/spanish')) {
        dir.create('output/spanish')
    }
    file.copy(from = 'src/01-04-spanish-B2.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}

#
# all
#
# for (id in pt_english_all_ids) {
#     pt_id <- idpt_spanish_all_ids
#     pt_english <- id # pt name
#     data_config_pt_language <- 'english'
#     print(id)
#     print(pt_id)
#     output_file_name <- sprintf('output/english/%s-ALL.pdf', pt_id)
#     setwd('src/')
#
#     tryCatch({
#         knit2pdf(input = '01-01-english-all.Rnw')
#     }, error = function(e){print(e)})
#
#     setwd('../')
#     if (!dir.exists('output/english')) {
#         dir.create('output/english')
#     }
#     file.copy(from = 'src/01-01-english-all.pdf', to = output_file_name, overwrite = TRUE)
#     clean_images()
#     clean_knitr(data_config_pt_language)
# }


# for (id in pt_spanish_all_ids) {
#     pt_id <- id
#     pt_spanish <- id # pt name
#     pt_english <- pt_spanish
#     data_config_pt_language <- 'spanish'
#     print(id)
#     print(pt_id)
#     output_file_name <- sprintf('output/spanish/%s-ALL.pdf', pt_id)
#     setwd('src/')
#
#     tryCatch({
#         knit2pdf(input = '01-03-spanish-all.Rnw', encoding = 'UTF-8')
#     }, error = function(e){print(e)})
#
#     setwd('../')
#     if (!dir.exists('output/spanish')) {
#         dir.create('output/spanish')
#     }
#     file.copy(from = 'src/01-03-spanish-all.pdf', to = output_file_name, overwrite = TRUE)
#     clean_images()
#     clean_knitr(data_config_pt_language)
# }

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
        knit2pdf(input = '01-01-english-figs.Rnw')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/english')) {
        dir.create('output/english')
    }
    file.copy(from = 'src/01-01-english-figs.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}


for (id in pt_spanish_all_ids) {
    pt_id <- id
    pt_spanish <- id # pt name
    pt_english <- pt_spanish
    data_config_pt_language <- 'spanish'
    print(id)
    print(pt_id)
    output_file_name <- sprintf('output/spanish/%s-FIGS.pdf', pt_id)
    setwd('src/')

    tryCatch({
        knit2pdf(input = '01-03-spanish-figs.Rnw', encoding = 'UTF-8')
    }, error = function(e){print(e)})

    setwd('../')
    if (!dir.exists('output/spanish')) {
        dir.create('output/spanish')
    }
    file.copy(from = 'src/01-03-spanish-figs.pdf', to = output_file_name, overwrite = TRUE)
    clean_images()
    clean_knitr(data_config_pt_language)
}
