navigator.serviceWorker.addEventListener('controllerchange', () => {
  console.log('New Service Worker activated. Reloading...');
  window.location.reload();
});