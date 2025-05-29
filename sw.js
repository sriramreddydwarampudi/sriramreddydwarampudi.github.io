const CACHE_NAME = 'mkdocs-v3';
const OFFLINE_URL = '/offline.html';
const PRECACHE_URLS = [
  '/',
  '/index.html',
  '/assets/stylesheets/main.css',
  '/assets/javascripts/bundle.js',
  OFFLINE_URL
];

// Install - Cache core assets
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(PRECACHE_URLS))
      .then(() => self.skipWaiting())
  );
});

// Activate - Clean old caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheName !== CACHE_NAME) {
            return caches.delete(cacheName);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

// Fetch - Cache-first strategy
self.addEventListener('fetch', event => {
  // Skip non-GET requests
  if (event.request.method !== 'GET') return;
  
  // Handle navigation requests
  if (event.request.mode === 'navigate') {
    event.respondWith(
      fetch(event.request)
        .catch(() => caches.match(OFFLINE_URL))
    );
    return;
  }

  // Cache-first for other requests
  event.respondWith(
    caches.match(event.request)
      .then(cached => {
        // Serve from cache if available
        if (cached) return cached;
        
        // Otherwise fetch and cache
        return fetch(event.request).then(response => {
          // Clone to cache and return
          const responseClone = response.clone();
          caches.open(CACHE_NAME)
            .then(cache => cache.put(event.request, responseClone));
          return response;
        });
      })
  );
});

// Background sync
self.addEventListener('sync', event => {
  if (event.tag === 'content-sync') {
    event.waitUntil(syncContent());
  }
});

// Content update logic
async function syncContent() {
  const cache = await caches.open(CACHE_NAME);
  const cachedRequests = await cache.keys();
  
  await Promise.all(cachedRequests.map(async request => {
    try {
      const fresh = await fetch(request);
      await cache.put(request, fresh.clone());
    } catch (e) {
      console.log(`Update failed for ${request.url}`, e);
    }
  }));
  
  // Notify clients
  const clients = await self.clients.matchAll();
  clients.forEach(client => {
    client.postMessage({
      type: 'content-updated',
      timestamp: new Date().toISOString()
    });
  });
}