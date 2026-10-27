@echo off
title Seed Student Database
echo ========================================================
echo  Seeding Sample Student & User Records into MongoDB
echo ========================================================
set PATH=C:\Users\aryan\AppData\Local\Programs\nodejs;%PATH%
cd /d "%~dp0backend"
node seed/seedData.js
pause
