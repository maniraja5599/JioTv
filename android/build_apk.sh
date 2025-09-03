#!/bin/bash

echo "🚀 Building FiFTO TV Android TV APK..."

# Create assets directory
mkdir -p app/src/main/assets

# Copy web files to assets
echo "📁 Copying web files to Android assets..."
cp -r ../../web/views/* app/src/main/assets/
cp -r ../../web/static/* app/src/main/assets/

# Create index.html from template
echo "📝 Creating index.html..."
cat > app/src/main/assets/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- PWA Meta Tags -->
    <meta name="theme-color" content="#667eea">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="application-name" content="FiFTO TV">
    
    <title>FiFTO TV - JioTV Streaming</title>
    
    <!-- Include your CSS -->
    <link href="styling.html" rel="stylesheet">
</head>
<body>
    <!-- Include your HTML templates -->
    <div id="navbar-container"></div>
    <div id="main-container"></div>
    
    <!-- Include your JavaScript -->
    <script src="internal/utils.js"></script>
    <script src="internal/channels.js"></script>
    <script src="internal/common.js"></script>
    
    <script>
        // Load templates
        fetch('navbar.html').then(r => r.text()).then(html => {
            document.getElementById('navbar-container').innerHTML = html;
        });
        
        fetch('channel_list.html').then(r => r.text()).then(html => {
            document.getElementById('main-container').innerHTML = html;
        });
        
        // Initialize app
        document.addEventListener('DOMContentLoaded', function() {
            console.log('FiFTO TV Android App Loaded!');
        });
    </script>
</body>
</html>
EOF

# Build APK
echo "🔨 Building APK..."
./gradlew assembleDebug

if [ $? -eq 0 ]; then
    echo "✅ APK built successfully!"
    echo "📱 APK location: app/build/outputs/apk/debug/app-debug.apk"
    echo "🚀 Install on Android TV: adb install app/build/outputs/apk/debug/app-debug.apk"
else
    echo "❌ APK build failed!"
    exit 1
fi
