@echo off
title Push to GitHub
echo ========================================================
echo  Pushing Student Management System to GitHub
echo  Repository: https://github.com/Aryaann18/25070521273_Aryankhobragade_Flexi.git
echo ========================================================
cd /d "%~dp0"
git push -u origin main
echo.
if %errorlevel% equ 0 (
    echo ========================================================
    echo  SUCCESS! All files are now live on GitHub!
    echo ========================================================
) else (
    echo Failed to push. Please check your GitHub credentials.
)
pause
