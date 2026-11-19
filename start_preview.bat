@echo off
chcp 65001 >nul
title Teacher Coco 英文冒險教室 預覽伺服器
echo ========================================================
echo   正在啟動 Teacher Coco 英文冒險家教網站...
echo   啟動後將自動開啟瀏覽器 (http://localhost:5173)
echo ========================================================
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1"
pause
