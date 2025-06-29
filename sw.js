const CACHE_NAME = 'offline-cache-v3';
const OFFLINE_URL = '/offline.html';
const NO_CACHE_PATHS = [
  '/auth',
  '/login',
  '/__/auth/',
  'firebase-auth.js',
  'www.gstatic.com/firebasejs',
  'firebaseapp.com'
];

// Install - Cache only essential non-auth assets
self.addEventListener('install', event => {
  const assetsToCache = [
    '/',
    OFFLINE_URL,
    '/js/register-sw.js',
    '/js/update-handler.js'
  ].filter(asset => !NO_CACHE_PATHS.some(path => asset.includes(path)));

  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(assetsToCache))
      .then(() => self.skipWaiting()) // Force immediate activation
  );
});

// Activate - Clean old caches and claim clients
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys()
      .then(keys => Promise.all(
        keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k))
      )
      .then(() => self.clients.claim()) // Control all pages immediately
  );
});

// Fetch - Bypass cache for auth and dynamic content
self.addEventListener('fetch', event => {
  // Skip caching for auth-related requests
  if (NO_CACHE_PATHS.some(path => event.request.url.includes(path))) {
    event.respondWith(fetch(event.request));
    return;
  }

  // Network-first for HTML pages
  if (event.request.mode === 'navigate') {
    event.respondWith(
      fetch(event.request)
        .catch(() => caches.match(OFFLINE_URL))
    );
    return;
  }

  // Cache-first for other assets
  event.respondWith(
    caches.match(event.request)
      .then(cached => cached || fetch(event.request))
  );
});

// Handle skipWaiting messages
self.addEventListener('message', event => {
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    clients.matchAll().then(clients => {
      clients.forEach(client => client.postMessage('reload'));
    });
  }
});