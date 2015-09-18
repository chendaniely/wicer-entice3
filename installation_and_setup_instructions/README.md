# Detailed Installation and Setup Instructions

## Table of Contents
<!-- MarkdownTOC -->

- [Prerequisite Programs](#prerequisite-programs)
- [Setting up your R environment](#setting-up-your-r-environment)
- [Downloading (aka cloning) the Entice3 code](#downloading-aka-cloning-the-entice3-code)
- [Launching the project](#launching-the-project)

<!-- /MarkdownTOC -->

*******************************************************************************

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
From now on I will refer to `Git Bash` and the terminal as a "terminal", "command prompt", or "prompt".

It should look something like this:

![](https://raw.githubusercontent.com/chendaniely/wicer-entice3/master/installation_and_setup_instructions/git_bash_startup.png)

Next, we want to use the terminal to navigate to a folder we want to save the code to.  In this example I will use the `Desktop`.
In order to navigate to the `Desktop` we type `cd ~/Desktop` into the terminal.  Note that it is case-sensitive.

Next navigate to the website (repository) where the wicer-entice3 code is hosted:

https://github.com/chendaniely/wicer-entice3

and click the HTTPS link on the right panel, and copy the link into your clipboard.  You can either use the "Copy to clipboard" button on the website, select and right click the text and click `copy`, or use your operating system's `copy` keyboard shortcut.

Again, make sure it says `HTTPS` and not `SSH`.
You can click the blue `HTTPS` link to switch it to the correct URL.

The right panel should look something like this.

![](https://raw.githubusercontent.com/chendaniely/wicer-entice3/master/installation_and_setup_instructions/github_download_clone_link.png)

With the link copied onto your clipboard, you can clone the code onto your computer using the terminal by running the `git clone` command followed by the URL.  And hit `enter` or `return` on your keyboard.

The entire process should look something like this:

![](https://raw.githubusercontent.com/chendaniely/wicer-entice3/master/installation_and_setup_instructions/git_bash_cd_clone_repo.png)

## Launching the project

You can now look on your desktop for the `wicer-entice3` folder.  You will see a R Project file named `wicer-entice3-github`.
Double clicking this file should open RStudio and you should see the contents of the folder in the RStudio file pane on the bottom right corner.

![](https://raw.githubusercontent.com/chendaniely/wicer-entice3/master/installation_and_setup_instructions/explorer_selected_r_project.png)

![](https://raw.githubusercontent.com/chendaniely/wicer-entice3/master/installation_and_setup_instructions/rstudio_file_panel_root_dir.png)

**It is important that you open the project in this manner.  If you already have RStudio running before opening the project close it and open the project again using the methods described above**

If you already opened the RStudio project in the past you should be able to switch directly to the project by using the project switcher on the top right corner:

![](https://raw.githubusercontent.com/chendaniely/wicer-entice3/master/installation_and_setup_instructions/rstudio_project_selector.png)

The reason for this is that it will properly set the "Working Directory" for the project.
