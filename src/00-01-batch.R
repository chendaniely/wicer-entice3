# make sure you run this line

source('src/00-00-batch_setup.R')

###############################################################################

# if you just want one of the samples you can put the index in square brackets:
# e.g. pt_english_a1_ids <- c('Sample1', 'Sample4', 'Sample6')[3]
# will only use the 3rd item
# useful for testing

###############################################################################
# Enter patient ID and generate document
###############################################################################

#
# English
#
pt_english_a1_ids <- c('Sample1', 'Sample4', 'Sample6')
source('src/create_english_a1.R')

pt_english_a2_ids <- c('Sample1', 'Sample4', 'Sample6')
source('src/create_english_a2.R')

pt_english_b1_ids <- c('Sample1', 'Sample4', 'Sample6')
source('src/create_english_b1.R')

pt_english_b2_ids <- c('Sample1', 'Sample4', 'Sample6')
source('src/create_english_b2.R')

# English all figures
pt_english_all_ids <- c(pt_english_a1_ids, pt_english_a2_ids, pt_english_b1_ids, pt_english_b2_ids)[1]
source('src/create_english_figs_only.R')

# English all text and figures
pt_english_all_ids <- c(pt_english_a1_ids, pt_english_a2_ids, pt_english_b1_ids, pt_english_b2_ids)[1]
source('src/create_english_text_and_figs.R')


#
# Spanish
#
pt_spanish_a1_ids <- c('Sample2', 'Sample3', 'Sample5', 'Sample6')
source('src/create_spanish_a1.R')

pt_spanish_a2_ids <- c('Sample2', 'Sample3', 'Sample5', 'Sample6')
source('src/create_spanish_a2.R')

pt_spanish_b1_ids <- c('Sample2', 'Sample3', 'Sample5', 'Sample6')
source('src/create_spanish_b1.R')

pt_spanish_b2_ids <- c('Sample2', 'Sample3', 'Sample5', 'Sample6')
source('src/create_spanish_b2.R')

# Spanish all figures
pt_spanish_all_ids <- c(pt_spanish_a1_ids, pt_spanish_a2_ids, pt_spanish_b1_ids, pt_spanish_b2_ids)[1]
source('src/create_spanish_figs_only.R')

# Spanish all text and figures
pt_spanish_all_ids <- c(pt_spanish_a1_ids, pt_spanish_a2_ids, pt_spanish_b1_ids, pt_spanish_b2_ids)[1]
source('src/create_spanish_text_and_figs.R')
