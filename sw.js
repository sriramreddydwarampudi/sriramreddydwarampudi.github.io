const CACHE_NAME = 'offline-cache-v2'; // Incremented version
const OFFLINE_URL = '/offline.html';
const NO_CACHE_PATHS = ['/login', '/auth', '/api']; // Add login-related paths here

// Cache core assets
self.addEventListener('install', event => {
  const assetsToCache = [
    '/',
    OFFLINE_URL,
    '/js/register-sw.js',
    '/js/update-handler.js',
    // Explicitly exclude login-related assets
  ].filter(asset => !NO_CACHE_PATHS.some(path => asset.includes(path)));

  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => cache.addAll(assetsToCache))
  );
  self.skipWaiting();
});

// Clean up old caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys =>
      Promise.all(
        keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k))
      )
    )
  );
  self.clients.claim();
});

// Handle requests
self.addEventListener('fetch', event => {
  // Bypass cache for login-related requests and dynamic content
  if (NO_CACHE_PATHS.some(path => event.request.url.includes(path))) {
    event.respondWith(fetch(event.request));
    return;
  }

  if (event.request.mode === 'navigate') {
    event.respondWith(
      fetch(event.request)
        .then(response => {
          // Update cache with fresh page
          const responseClone = response.clone();
          caches.open(CACHE_NAME).then(cache => cache.put(event.request, responseClone));
          return response;
        })
        .catch(() => caches.match(OFFLINE_URL))
    );
  } else {
    event.respondWith(
      caches.match(event.request).then(response => response || fetch(event.request))
    );
  }
});

// Force refresh when new content is available
self.addEventListener('message', event => {
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
  }
});