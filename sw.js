const CACHE_NAME = "mkdocs-cache-v1";
const urlsToCache = [
  "/",
  "/index.html",
  "/manifest.json",
  "/css/offline.css",
  "/js/update-handler.js",
  // Add more if needed
];

self.addEventListener("install", (event) => {
  self.skipWaiting(); // Auto activate new SW
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(urlsToCache);
    })
  );
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheName !== CACHE_NAME) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

self.addEventListener("fetch", (event) => {
  event.respondWith(
    fetch(event.request)
      .then((response) => {
        return response;
      })
      .catch(() =>
        caches.match(event.request).then((response) => response || caches.match("/"))
      )
  );
});