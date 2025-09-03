package com.fifto.tv;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.WebSettings;
import android.webkit.WebChromeClient;
import android.view.KeyEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.graphics.Color;

public class MainActivity extends Activity {
    private WebView webView;
    private FrameLayout container;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        // Create container
        container = new FrameLayout(this);
        container.setBackgroundColor(Color.BLACK);
        setContentView(container);
        
        // Create WebView
        webView = new WebView(this);
        container.addView(webView);
        
        // Configure WebView
        setupWebView();
        
        // Load your JioTV interface
        webView.loadUrl("file:///android_asset/index.html");
    }
    
    private void setupWebView() {
        WebSettings settings = webView.getSettings();
        
        // Enable JavaScript
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        
        // Enable hardware acceleration
        settings.setRenderPriority(WebSettings.RenderPriority.HIGH);
        settings.setEnableSmoothTransition(true);
        
        // Cache settings
        settings.setCacheMode(WebSettings.LOAD_DEFAULT);
        settings.setAppCacheEnabled(true);
        settings.setAppCachePath(getCacheDir().getAbsolutePath());
        
        // Media settings for video streaming
        settings.setMediaPlaybackRequiresUserGesture(false);
        settings.setAllowFileAccess(true);
        settings.setAllowContentAccess(true);
        
        // WebView client
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                // Handle external links
                if (url.startsWith("http") || url.startsWith("https")) {
                    view.loadUrl(url);
                    return true;
                }
                return false;
            }
        });
        
        // Chrome client for better video support
        webView.setWebChromeClient(new WebChromeClient());
        
        // Enable focus for TV remote navigation
        webView.setFocusable(true);
        webView.setFocusableInTouchMode(true);
        webView.requestFocus();
    }
    
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        // Handle TV remote control navigation
        if (keyCode == KeyEvent.KEYCODE_DPAD_CENTER || 
            keyCode == KeyEvent.KEYCODE_ENTER) {
            // Simulate click on focused element
            webView.evaluateJavascript(
                "document.activeElement.click();", null);
            return true;
        }
        
        // Handle back button
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            if (webView.canGoBack()) {
                webView.goBack();
                return true;
            }
        }
        
        return super.onKeyDown(keyCode, event);
    }
    
    @Override
    protected void onPause() {
        super.onPause();
        webView.onPause();
    }
    
    @Override
    protected void onResume() {
        super.onResume();
        webView.onResume();
    }
    
    @Override
    protected void onDestroy() {
        webView.destroy();
        super.onDestroy();
    }
}
