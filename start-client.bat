@echo off
title Student Management System - Client (React.js)
echo ========================================================
echo  Starting Client (React.js Frontend)
echo ========================================================
set PATH=C:\Users\aryan\AppData\Local\Programs\nodejs;%PATH%
cd /d "%~dp0client"
npm run dev
pause
