# Install required packages for R Markdown rendering
packages <- c('tidyverse', 'DT', 'plotly', 'hrbrthemes', 'viridis', 'lubridate')

cat("Installing required packages...\n")

for (pkg in packages) {
  cat("Installing", pkg, "...\n")
  tryCatch({
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
      install.packages(pkg, repos = 'https://cran.r-project.org')
      cat("✓", pkg, "installed successfully!\n")
    } else {
      cat("✓", pkg, "already installed!\n")
    }
  }, error = function(e) {
    cat("✗ Error installing", pkg, ":", e$message, "\n")
  })
}

cat("\nPackage installation completed!\n") 