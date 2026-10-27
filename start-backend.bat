@echo off
title Student Management System - Backend Server (Node.js + MongoDB)
echo ========================================================
echo  Starting EduFlex Backend Server (Express + MongoDB)
echo ========================================================
set PATH=C:\Users\aryan\AppData\Local\Programs\nodejs;%PATH%
cd /d "%~dp0server"
node server.js
pause
