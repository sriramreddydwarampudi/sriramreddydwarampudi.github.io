// Minimal service worker that does NOT interfere with auth
const CACHE_NAME = 'no-auth-cache-v1';
const OFFLINE_URL = '/offline.html';

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.add(OFFLINE_URL))
  );
});

self.addEventListener('fetch', (event) => {
  // Bypass ALL auth-related domains
  if ([
    'firebase',
    'googleapis',
    'gstatic',
    'firebaseapp.com',
    'accounts.google.com'
  ].some(domain => event.request.url.includes(domain))) {
    return; // Let browser handle normally
  }

  // Only handle offline page
  if (event.request.mode === 'navigate') {
    event.respondWith(
      fetch(event.request)
        .catch(() => caches.match(OFFLINE_URL))
    );
  }
});