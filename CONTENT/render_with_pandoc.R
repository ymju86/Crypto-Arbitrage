# Set pandoc path for R
Sys.setenv(PATH = paste(Sys.getenv('PATH'), 'C:/Program Files/Pandoc', sep = ';'))

# Load required libraries
library(rmarkdown)
library(knitr)

# Check pandoc version
cat("Pandoc version:", as.character(pandoc_version()), "\n")

# Render all files
files_to_render <- c("public_API.Rmd", "differences.Rmd", "definition.Rmd", "private_API.Rmd")

for (file in files_to_render) {
  cat("Rendering", file, "...\n")
  tryCatch({
    render(file)
    cat("✓", file, "rendered successfully!\n")
  }, error = function(e) {
    cat("✗ Error rendering", file, ":", e$message, "\n")
  })
}

cat("\nAll files processed!\n") 