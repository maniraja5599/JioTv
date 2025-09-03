@echo off
echo 🚀 Building FiFTO TV Android TV APK...

REM Create assets directory
if not exist "app\src\main\assets" mkdir "app\src\main\assets"

REM Copy web files to assets
echo 📁 Copying web files to Android assets...
xcopy "..\..\web\views\*" "app\src\main\assets\" /E /I /Y
xcopy "..\..\web\static\*" "app\src\main\assets\" /E /I /Y

REM Create index.html from template
echo 📝 Creating index.html...
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo.    
echo     ^<!-- PWA Meta Tags --^>
echo     ^<meta name="theme-color" content="#667eea"^>
echo     ^<meta name="apple-mobile-web-app-capable" content="yes"^>
echo     ^<meta name="mobile-web-app-capable" content="yes"^>
echo     ^<meta name="application-name" content="FiFTO TV"^>
echo.    
echo     ^<title^>FiFTO TV - JioTV Streaming^</title^>
echo.    
echo     ^<!-- Include your CSS --^>
echo     ^<link href="styling.html" rel="stylesheet"^>
echo ^</head^>
echo ^<body^>
echo     ^<!-- Include your HTML templates --^>
echo     ^<div id="navbar-container"^>^</div^>
echo     ^<div id="main-container"^>^</div^>
echo.    
echo     ^<!-- Include your JavaScript --^>
echo     ^<script src="internal\utils.js"^>^</script^>
echo     ^<script src="internal\channels.js"^>^</script^>
echo     ^<script src="internal\common.js"^>^</script^>
echo.    
echo     ^<script^>
echo         // Load templates
echo         fetch^('navbar.html'^).then^(r =^> r.text^(^)^).then^(html =^> {
echo             document.getElementById^('navbar-container'^).innerHTML = html;
echo         }^);
echo.        
echo         fetch^('channel_list.html'^).then^(r =^> r.text^(^)^).then^(html =^> {
echo             document.getElementById^('main-container'^).innerHTML = html;
echo         }^);
echo.        
echo         // Initialize app
echo         document.addEventListener^('DOMContentLoaded', function^(^) {
echo             console.log^('FiFTO TV Android App Loaded!'^);
echo         }^);
echo     ^</script^>
echo ^</body^>
echo ^</html^>
) > "app\src\main\assets\index.html"

REM Build APK
echo 🔨 Building APK...
call gradlew.bat assembleDebug

if %ERRORLEVEL% EQU 0 (
    echo ✅ APK built successfully!
    echo 📱 APK location: app\build\outputs\apk\debug\app-debug.apk
    echo 🚀 Install on Android TV: adb install app\build\outputs\apk\debug\app-debug.apk
) else (
    echo ❌ APK build failed!
    pause
    exit /b 1
)

pause
