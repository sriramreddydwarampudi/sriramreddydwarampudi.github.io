// sw.js - Minimal Service Worker
self.addEventListener('install', (e) => {
  self.skipWaiting();
});

self.addEventListener('fetch', (e) => {
  // Bypass all auth requests
  if (e.request.url.includes('firebase') || 
      e.request.url.includes('googleapis') ||
      e.request.mode === 'navigate') {
    return fetch(e.request);
  }
});