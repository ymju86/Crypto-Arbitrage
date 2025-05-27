# Set pandoc path for R
Sys.setenv(PATH = paste(Sys.getenv('PATH'), 'C:/Program Files/Pandoc', sep = ';'))

# Load required libraries
library(rmarkdown)
library(knitr)

# Check pandoc version
cat("Pandoc version:", as.character(pandoc_version()), "\n")

# Function to render with fallback
render_with_fallback <- function(file) {
  cat("\n=== Rendering", file, "===\n")
  
  # Try normal rendering first
  tryCatch({
    render(file)
    cat("✓", file, "rendered successfully!\n")
    return(TRUE)
  }, error = function(e) {
    cat("✗ Error rendering", file, ":", e$message, "\n")
    cat("Trying to render without code execution...\n")
    
    # Try rendering without executing R code
    tryCatch({
      render(file, output_options = list(eval = FALSE))
      cat("✓", file, "rendered without code execution!\n")
      return(TRUE)
    }, error = function(e2) {
      cat("✗ Failed to render", file, "even without code execution:", e2$message, "\n")
      return(FALSE)
    })
  })
}

# Try to render each file
files_to_render <- c("public_API.Rmd", "differences.Rmd", "definition.Rmd")

for (file in files_to_render) {
  render_with_fallback(file)
}

cat("\nRendering process completed!\n") 