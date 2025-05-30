const CACHE_NAME = ‘mkdocs-offline-v1’; const URLS_TO_CACHE = [ ‘/’,
‘/index.html’, ‘/offline.html’, ‘/css/offline.css’, ‘/manifest.json’, ‘/js/register-sw.js’, ‘/js/update-handler.js’, ];
// Install – cache core assets self.addEventListener(‘install’, event => { event.waitUntil(
caches.open(CACHE_NAME) .then(cache => cache.addAll(URLS_TO_CACHE)) );
});
// Activate – clean up old caches self.addEventListener(‘activate’, event => { event.waitUntil(
caches.keys().then(keys => Promise.all( keys.filter(k => k !== CACHE_NAME) .map(k => caches.delete(k)) )) ); });
// Fetch – serve from cache, fall back to network, offline fallback self.addEventListener(‘fetch’, event => { event.respondWith(
caches.match(event.request).then(cached => { if (cached) return cached; return fetch(event.request).catch(() => { // If navigation request fails, show offline page if (event.request.mode === ‘navigate’) { return caches.match(’/offline.html’); }
}); }) );
});