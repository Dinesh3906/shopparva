@echo off
echo ========================================
echo Starting Shopping Aggregator Services
echo ========================================
echo.

echo [1/3] Starting Python Backend...
start "Python Backend" cmd /k "cd backend && python main_lite.py"
timeout /t 3 /nobreak >nul

echo [2/3] Starting Convex...
start "Convex Dev" cmd /k "D:\node.exe D:\node_modules\npm\bin\npx-cli.js convex dev"
timeout /t 10 /nobreak >nul

echo [3/3] Starting Frontend...
start "Frontend Dev" cmd /k "D:\node.exe D:\node_modules\npm\bin\npm-cli.js run dev"
timeout /t 5 /nobreak >nul

echo.
echo ========================================
echo All services started!
echo ========================================
echo.
echo Backend:  http://localhost:8000
echo Frontend: http://localhost:5173
echo.
echo Press any key to open the app in browser...
pause >nul
start http://localhost:5173
