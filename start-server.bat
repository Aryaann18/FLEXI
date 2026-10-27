@echo off
title Student Management System - Server (Node.js + Express + MongoDB)
echo ========================================================
echo  Starting Server (Node.js + Express + MongoDB)
echo ========================================================
set PATH=C:\Users\aryan\AppData\Local\Programs\nodejs;%PATH%
cd /d "%~dp0server"
node server.js
pause
