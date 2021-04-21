# =============================================================================
# source_rmd
# 2021-04-17
# =============================================================================

# This function allows me to source Rmd files in the same way you might source
# an R script.

# Helpful URL
# https://community.rstudio.com/t/prevent-rmarkdown-document-from-creating-any-output-file/81871/5

source_rmd <- function(file, ...) {
  tmp_file = tempfile(fileext=".R")
  on.exit(unlink(tmp_file), add = TRUE)
  knitr::purl(file, output=tmp_file)
  source(file = tmp_file, ...)
}