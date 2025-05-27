@echo off
echo ========================================
echo  Crypto Arbitrage - R Setup Script
echo ========================================
echo.
echo This script will:
echo 1. Install required R packages
echo 2. Install pandoc (if needed)
echo 3. Render all R Markdown files to HTML
echo.
echo Please run this batch file as Administrator for package installation.
echo.
pause

echo Installing R packages...
"C:\Program Files\R\R-4.5.0\bin\Rscript.exe" -e "if (!require('rmarkdown', quietly = TRUE)) { install.packages('rmarkdown', repos = 'https://cran.r-project.org') }"
"C:\Program Files\R\R-4.5.0\bin\Rscript.exe" -e "if (!require('knitr', quietly = TRUE)) { install.packages('knitr', repos = 'https://cran.r-project.org') }"

echo.
echo Checking pandoc installation...
pandoc --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Pandoc not found. Attempting to install...
    echo.
    echo Option 1: Installing via chocolatey...
    choco install pandoc -y >nul 2>&1
    if %errorlevel% neq 0 (
        echo Chocolatey not found or failed.
        echo.
        echo Please install pandoc manually:
        echo 1. Download from: https://pandoc.org/installing.html
        echo 2. Or install chocolatey first: https://chocolatey.org/install
        echo 3. Then run: choco install pandoc
        echo.
        pause
        exit /b 1
    )
    echo Pandoc installed successfully via chocolatey!
) else (
    echo Pandoc is already installed.
)

echo.
echo Rendering R Markdown files...
"C:\Program Files\R\R-4.5.0\bin\Rscript.exe" install_and_render.R

echo.
echo ========================================
echo  Setup completed!
echo ========================================
echo.
echo Your improved HTML files should now be available in the CONTENT folder.
echo.
pause 