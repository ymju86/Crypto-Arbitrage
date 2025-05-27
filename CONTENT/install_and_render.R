# Install required packages
if (!require("rmarkdown", quietly = TRUE)) {
  install.packages("rmarkdown", repos = "https://cran.r-project.org")
}
if (!require("knitr", quietly = TRUE)) {
  install.packages("knitr", repos = "https://cran.r-project.org")
}

# Load libraries
library(rmarkdown)
library(knitr)

# Check pandoc installation
cat("Checking pandoc installation...\n")
pandoc_ver <- pandoc_version()
cat("Pandoc version:", as.character(pandoc_ver), "\n")

if (pandoc_ver == "0" || is.null(pandoc_ver)) {
  cat("Pandoc not found. Installing pandoc...\n")
  # Try to install pandoc
  if (!require("installr", quietly = TRUE)) {
    install.packages("installr", repos = "https://cran.r-project.org")
  }
  library(installr)
  
  # Install pandoc using installr
  tryCatch({
    install.pandoc()
    cat("Pandoc installed successfully!\n")
  }, error = function(e) {
    cat("Could not install pandoc automatically.\n")
    cat("Please install pandoc manually from: https://pandoc.org/installing.html\n")
    cat("Or use chocolatey: choco install pandoc\n")
    stop("Pandoc installation required")
  })
}

# Render all R Markdown files with error handling
render_file <- function(filename) {
  cat("Rendering", filename, "...\n")
  tryCatch({
    render(filename)
    cat("✓", filename, "rendered successfully!\n")
  }, error = function(e) {
    cat("✗ Error rendering", filename, ":", e$message, "\n")
  })
}

render_file("public_API.Rmd")
render_file("differences.Rmd")
render_file("definition.Rmd")
render_file("private_API.Rmd")

cat("\nRendering process completed!\n") 