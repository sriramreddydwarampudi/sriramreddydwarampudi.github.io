const CACHE_NAME = 'offline-cache-v5';
const OFFLINE_URL = '/offline.html';
const NO_CACHE_PATHS = [
  '/auth',
  '/login',
  '/__/auth/',
  'firebase',
  'googleapis',
  'gstatic',
  'firebaseapp.com',
  'accounts.google.com',
  'securetoken.googleapis.com'
];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll([
        '/',
        OFFLINE_URL,
        '/css/main.css',
        '/js/main.js'
      ].filter(asset => 
        !NO_CACHE_PATHS.some(path => asset.includes(path))
      ))
      .then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys()
      .then(keys => Promise.all(
        keys.map(key => key !== CACHE_NAME && caches.delete(key))
      ))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  // Bypass SW completely for auth-related requests
  if (NO_CACHE_PATHS.some(path => 
    event.request.url.includes(path) ||
    (event.request.referrer && event.request.referrer.includes(path))
  )) {
    event.respondWith(fetch(event.request));
    return;
  }

  // Network-first for HTML pages
  if (event.request.mode === 'navigate') {
    event.respondWith(
      fetch(event.request)
        .then(response => {
          // Cache the page but don't intercept future requests
          const clone = response.clone();
          caches.open(CACHE_NAME).then(cache => cache.put(event.request, clone));
          return response;
        })
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

self.addEventListener('message', (event) => {
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    clients.matchAll().then(clients => {
      clients.forEach(client => client.postMessage('reload'));
    });
  }
});