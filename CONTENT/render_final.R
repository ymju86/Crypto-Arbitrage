# Set pandoc path and user library
Sys.setenv(PATH = paste(Sys.getenv('PATH'), 'C:/Program Files/Pandoc', sep = ';'))
.libPaths(c(Sys.getenv('R_LIBS_USER'), .libPaths()))

# Load required libraries
library(rmarkdown)
library(knitr)

# Check pandoc version
cat("Pandoc version:", as.character(pandoc_version()), "\n")
cat("Library paths:", .libPaths(), "\n")

# Function to render with better error handling
render_improved <- function(file) {
  cat("\n=== Rendering", file, "===\n")
  
  tryCatch({
    render(file)
    cat("✓", file, "rendered successfully!\n")
    return(TRUE)
  }, error = function(e) {
    cat("✗ Error rendering", file, ":", e$message, "\n")
    return(FALSE)
  })
}

# Render all improved files
files_to_render <- c("public_API.Rmd", "differences.Rmd", "definition.Rmd", "private_API.Rmd")

success_count <- 0
for (file in files_to_render) {
  if (render_improved(file)) {
    success_count <- success_count + 1
  }
}

cat("\n=== SUMMARY ===\n")
cat("Successfully rendered:", success_count, "out of", length(files_to_render), "files\n")
cat("All improved HTML files are now available!\n") 