const htmlTag = document.getElementsByTagName("html")[0];

const getCurrentTheme = () => {
  const storedTheme = getLocalStorageItem("theme");
  if (storedTheme) {
    return storedTheme;
  }
  
  const htmlTag = document.getElementsByTagName("html")[0];
  if (htmlTag.hasAttribute("data-theme")) {
    const themeAttr = htmlTag.getAttribute("data-theme");
    setLocalStorageItem("theme", themeAttr);
    return themeAttr;
  }
  
  // Return system theme preference
  const prefersDark = window.matchMedia && 
    window.matchMedia("(prefers-color-scheme: dark)").matches;
  const systemTheme = prefersDark ? "dark" : "light";
  setLocalStorageItem("theme", systemTheme);
  return systemTheme;
};

const toggleTheme = () => {
  const htmlTag = document.getElementsByTagName("html")[0];
  const newTheme = getCurrentTheme() === "dark" ? "light" : "dark";
  
  setLocalStorageItem("theme", newTheme);
  htmlTag.setAttribute("data-theme", newTheme);
};

const initializeTheme = () => {
  const elements = safeGetElementsById(["sunIcon", "moonIcon"]);
  const { sunIcon, moonIcon } = elements;

  if (getCurrentTheme() === "light") {
    const htmlTag = document.getElementsByTagName("html")[0];
    
    if (sunIcon && moonIcon) {
      sunIcon.classList.replace("swap-on", "swap-off");
      moonIcon.classList.replace("swap-off", "swap-on");
    }
    htmlTag.setAttribute("data-theme", "light");
  }
};

initializeTheme();

// Casting functionality
let castSession = null;
let castApi = null;

const initializeCast = () => {
  // Check if Cast API is available
  if (window.chrome && window.chrome.cast) {
    castApi = window.chrome.cast;
    const castButton = document.getElementById('castButton');
    if (castButton) {
      castButton.style.display = 'block';
    }
  } else {
    // Hide cast button if Cast API is not available
    const castButton = document.getElementById('castButton');
    if (castButton) {
      castButton.style.display = 'none';
    }
  }
};

const toggleCast = () => {
  if (!castApi) {
    alert('Casting is not available in this browser. Please use Chrome or a Chromium-based browser.');
    return;
  }

  if (castSession) {
    // Stop casting
    castSession.stop(() => {
      castSession = null;
      updateCastButton(false);
    });
  } else {
    // Start casting
    castApi.requestSession((session) => {
      castSession = session;
      updateCastButton(true);
      
      // Cast the current page
      const mediaInfo = new castApi.media.MediaInfo(window.location.href, 'text/html');
      const request = new castApi.media.LoadRequest(mediaInfo);
      session.loadMedia(request);
    }, (error) => {
      console.error('Cast error:', error);
      alert('Failed to start casting: ' + error.description);
    });
  }
};

const updateCastButton = (isCasting) => {
  const castButton = document.getElementById('castButton');
  if (castButton) {
    if (isCasting) {
      castButton.classList.add('text-green-400');
      castButton.classList.remove('text-yellow-400');
      castButton.title = 'Stop Casting';
    } else {
      castButton.classList.add('text-yellow-400');
      castButton.classList.remove('text-green-400');
      castButton.title = 'Cast to Device';
    }
  }
};

// Initialize casting when page loads
document.addEventListener('DOMContentLoaded', initializeCast);