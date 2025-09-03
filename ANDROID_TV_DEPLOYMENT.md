# 🚀 FiFTO TV - Android TV Deployment Guide

## **Overview**
This guide explains how to deploy your customized JioTV project to Android TV as a Progressive Web App (PWA).

## **What We've Built**
- ✅ **Custom FiFTO TV Interface** with favorites at the top
- ✅ **Progressive Web App (PWA)** ready for installation
- ✅ **Auto-browser opening** when server starts
- ✅ **Offline support** via service worker
- ✅ **TV-optimized** landscape orientation

## **🚀 Quick Start - Deploy to Android TV**

### **Step 1: Start Your Server**
```bash
cd jiotv_go
go run main.go serve --host 0.0.0.0 --port 5001
```

### **Step 2: Access from Android TV**
1. **Open Chrome/Edge on Android TV**
2. **Navigate to**: `http://YOUR_COMPUTER_IP:5001`
3. **Install as PWA**: Look for "Install" or "Add to Home Screen"

### **Step 3: Enjoy FiFTO TV on Android TV!**
- App appears in your app drawer
- Works like a native Android TV app
- Favorites at the top of each category
- Smooth streaming experience

## **📱 PWA Features**

### **Installation**
- **Automatic prompt** appears in supported browsers
- **Add to Home Screen** option available
- **App-like experience** with full-screen mode

### **Offline Support**
- **Service Worker** caches essential resources
- **Background sync** for better performance
- **Offline-first** approach

### **TV Optimization**
- **Landscape orientation** by default
- **Large touch targets** for remote control
- **High contrast** colors for TV viewing

## **🔧 Advanced Deployment Options**

### **Option 1: Local Network (Recommended)**
```bash
# Make accessible on your local network
go run main.go serve --host 0.0.0.0 --port 5001

# Find your computer's IP address
ipconfig  # Windows
ifconfig  # Mac/Linux
```

### **Option 2: Public Internet (Advanced)**
```bash
# Expose to internet (use with caution!)
go run main.go serve --public --port 5001

# Or use reverse proxy (nginx, Caddy)
```

### **Option 3: Docker Deployment**
```bash
# Build and run with Docker
docker build -t fifto-tv .
docker run -p 5001:5001 fifto-tv
```

## **📺 Android TV Setup**

### **Prerequisites**
- Android TV device (or Android TV emulator)
- Chrome browser or Edge browser
- Network access to your server

### **Installation Steps**
1. **Open browser** on Android TV
2. **Navigate** to your server URL
3. **Look for install prompt** or menu option
4. **Install PWA** to home screen
5. **Launch** from app drawer

### **Alternative Installation**
If no install prompt appears:
1. **Open browser menu** (three dots)
2. **Select "Add to Home Screen"**
3. **Choose "Install"**
4. **App appears in app drawer**

## **🎯 PWA Manifest Features**

### **App Information**
- **Name**: FiFTO TV Go
- **Short Name**: FiFTO TV
- **Description**: Stream JioTV with custom interface
- **Theme Color**: #667eea (Blue-Purple)

### **Shortcuts**
- **Favorites**: Quick access to favorite channels
- **Tamil**: Direct to Tamil language channels
- **English**: Direct to English language channels

### **Display Mode**
- **Standalone**: Full-screen app experience
- **Landscape**: Optimized for TV viewing
- **No browser UI**: Clean, app-like interface

## **🔍 Troubleshooting**

### **Common Issues**

#### **1. Can't Access from Android TV**
- **Check firewall**: Ensure port 5001 is open
- **Verify IP address**: Use correct computer IP
- **Test locally**: Try `localhost:5001` first

#### **2. Install Prompt Not Appearing**
- **Check HTTPS**: Some browsers require secure connection
- **Clear cache**: Clear browser data and cookies
- **Update browser**: Use latest Chrome/Edge version

#### **3. App Not Working Offline**
- **Check service worker**: Look for errors in console
- **Verify manifest**: Ensure manifest.json is accessible
- **Clear cache**: Remove old cached data

### **Debug Commands**
```bash
# Check if server is running
netstat -an | findstr :5001  # Windows
netstat -an | grep :5001     # Mac/Linux

# Test local access
curl http://localhost:5001

# Check PWA status in browser
# Open DevTools > Application > Manifest
```

## **🚀 Next Steps**

### **Immediate Actions**
1. **Test local deployment** with `go run main.go serve`
2. **Access from Android TV** browser
3. **Install as PWA** to home screen
4. **Test all features** (favorites, categories, streaming)

### **Future Enhancements**
- **Custom app icons** for better branding
- **Push notifications** for new content
- **Background sync** for offline viewing
- **Native Android app** wrapper (advanced)

## **📞 Support**

### **Getting Help**
- **Check logs**: Look for error messages in terminal
- **Browser console**: Check for JavaScript errors
- **Network issues**: Verify connectivity and firewall

### **Useful Commands**
```bash
# Start server with debug logging
go run main.go serve --host 0.0.0.0 --port 5001

# Check PWA installation
# Browser > DevTools > Application > Service Workers

# Test offline functionality
# Disconnect network and refresh app
```

---

## **🎉 Congratulations!**
You now have a **custom FiFTO TV interface** that can be installed on **Android TV** as a **Progressive Web App**!

**Key Benefits:**
- ✅ **Favorites at top** of each category
- ✅ **Custom FiFTO branding**
- ✅ **TV-optimized interface**
- ✅ **Offline support**
- ✅ **App-like experience**

**Next**: Start your server and install on Android TV! 🚀📺
