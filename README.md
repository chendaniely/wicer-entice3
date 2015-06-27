# wicer-entice3
An Interdisciplinary Communication Tool to Support the Process of Generating Tailored Infographics From Electronic Health Data Using EnTICE3

<!-- MarkdownTOC -->

- Installation and Setup
	- Setting up the environment
	- Downloading the code
- Generating Documents
	- Single Document
	- Multiple Documents

<!-- /MarkdownTOC -->


# Installation and Setup
## Setting up the environment
You will need to have [R](http://cran.rstudio.com/) and a [LaTeX](http://www.latex-project.org/) installed.
Having [RStudio](http://www.rstudio.com/products/rstudio/download/preview/) is highly recommended as it will make compiling and editing the code much easier.

Within the R or RStudio console, you will need to execute the following command to install the necessary packages:

`install.packages(c("knitr", "ggplot2", "reshape2", "png", "grid", "gridExtra", "stringi", "testthat", "readr", "lubridate", "dplyr", "readxl"))`
## Downloading the code
There are 2 ways you can download the code in this repository:

1.  Click the "Download Zip" button on the right, unzip the file into a folder
2.  Use the HTTPS link on the right and `git clone URL` the link to download it directly to your computer
    1.  `git clone https://github.com/chendaniely/wicer-entice3.git`

# Generating Documents

First step in generating the documents is opening the project.
This is typically accomplished by double-clicking the `wicer-entice3-github.Rproj`.
This should open Rstudio in the correct working directory.
You can check the working directory by typing `getwd()` in the R console,
and it should return the directory where you either cloned or unziped this repository.

## Single Document
### English
The single English document can you run by opening `01-01-english.Rnw` and clicking `compile PDF` in RStudio.

## Multiple Documents
