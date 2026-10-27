@echo off
title Student Management System Launcher
echo ========================================================
echo  Launching EduFlex Full-Stack Application (Client + Server)
echo ========================================================
start "EduFlex Server (Port 5000)" cmd /k "%~dp0start-server.bat"
timeout /t 3 /nobreak >nul
start "EduFlex Client (Port 5173)" cmd /k "%~dp0start-client.bat"
echo.
echo Server running at:  http://localhost:5000
echo Client running at:  http://localhost:5173
echo MongoDB Compass URI: mongodb://127.0.0.1:27017/student_management_db
echo.
pause
