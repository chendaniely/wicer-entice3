# Detailed Installation and Setup Instructions

<!-- MarkdownTOC -->

- [Prerequisite Programs](#prerequisite-programs)
- [Setting up your R environment](#setting-up-your-r-environment)
- [Downloading (aka cloning) the Entice3 code](#downloading-aka-cloning-the-entice3-code)

<!-- /MarkdownTOC -->


## Prerequisite Programs

1. [R](https://cran.rstudio.com/)
2. [RStudio](https://www.rstudio.com/products/rstudio/download/preview/)
3. [LaTeX](https://latex-project.org/ftp.html)
4. [Git](https://git-scm.com/)

## Setting up your R environment

This project requires a few R packages. That do not come with base R.
To install these packages open up RStudio and in the console panel on the right and copy paste the following:

`install.packages(c("knitr", "ggplot2", "reshape2", "png", "grid", "gridExtra", "stringi", "testthat", "readr", "lubridate", "dplyr", "readxl"))`

It should look like this:

![](https://raw.githubusercontent.com/chendaniely/wicer-entice3/master/installation_and_setup_instructions/rstudio_console_install_packages.png)

## Downloading (aka cloning) the Entice3 code

Once you have the R environment all setup, we need to download the code to generate the documents.
To do so, we need to open up the `Git Bash` program (if you are in windows).  If you are on a Mac/Linux, open up a terminal.
It should look something like this:

![](https://raw.githubusercontent.com/chendaniely/wicer-entice3/master/installation_and_setup_instructions/git_bash_startup.png)
