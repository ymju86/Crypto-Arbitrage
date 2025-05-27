# Setup Instructions for Crypto Arbitrage Project

## Prerequisites
- R 4.5.0 (already installed)
- Pandoc (required for R Markdown rendering)

## Quick Setup (Recommended)

### Option 1: Automated Setup
1. **Right-click** on `setup_r.bat` 
2. **Select "Run as administrator"**
3. Follow the prompts

### Option 2: Manual Pandoc Installation

#### Method A: Using Chocolatey (Recommended)
1. **Install Chocolatey** (if not already installed):
   - Open PowerShell as Administrator
   - Run: 
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```

2. **Install Pandoc**:
   ```powershell
   choco install pandoc
   ```

#### Method B: Direct Download
1. Go to: https://pandoc.org/installing.html
2. Download the Windows installer
3. Run the installer as Administrator
4. Restart your command prompt/PowerShell

#### Method C: Using R (Alternative)
```r
# In R console
install.packages("installr")
library(installr)
install.pandoc()
```

## Verify Installation
```powershell
pandoc --version
```
Should show pandoc version (e.g., "pandoc 3.x.x")

## Render Files
After pandoc is installed:
```powershell
cd CONTENT
& "C:\Program Files\R\R-4.5.0\bin\Rscript.exe" install_and_render.R
```

## Troubleshooting

### Issue: "Pandoc not found"
- Ensure pandoc is installed and in your PATH
- Restart PowerShell after installation
- Try running as Administrator

### Issue: "Package installation failed"
- Run PowerShell/batch file as Administrator
- Check internet connection
- Try installing packages manually in R console

### Issue: "Permission denied"
- Run as Administrator
- Check if antivirus is blocking installation

## Expected Output
After successful setup, you should have:
- `public_API.html`
- `differences.html` 
- `definition.html`
- `private_API.html`

All with improved, professional content and styling.

## Support
If you encounter issues:
1. Check that R is properly installed
2. Verify pandoc installation with `pandoc --version`
3. Ensure you're running as Administrator
4. Check internet connectivity for package downloads 