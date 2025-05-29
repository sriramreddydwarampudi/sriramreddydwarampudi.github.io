// Listen for update messages
navigator.serviceWorker.addEventListener('message', event => {
  if (event.data.type === 'content-updated') {
    showUpdateNotification();
  }
});

// Show update notification
function showUpdateNotification() {
  if (!('Notification' in window)) return;
  
  if (Notification.permission === 'granted') {
    new Notification('Content Updated', {
      body: 'New content has been downloaded. Refresh to see updates.',
      icon: '/assets/images/icon-192.png'
    });
  } else {
    const notice = document.createElement('div');
    notice.id = 'update-notice';
    notice.style = `
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: #4CAF50;
      color: white;
      padding: 15px;
      border-radius: 4px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.2);
      z-index: 1000;
    `;
    notice.innerHTML = `
      <p>New content available!</p>
      <button onclick="location.reload()" style="
        background: white;
        color: #4CAF50;
        border: none;
        padding: 8px 16px;
        margin-top: 8px;
        border-radius: 4px;
        cursor: pointer;
      ">Refresh</button>
    `;
    document.body.appendChild(notice);
  }
}

// Trigger manual update check
window.checkForUpdates = async function() {
  if (!navigator.serviceWorker.controller) return;
  
  try {
    const reg = await navigator.serviceWorker.ready;
    await reg.sync.register('content-sync');
    alert('Update started in background');
  } catch (e) {
    console.error('Update failed:', e);
    alert('Update failed. Please check connection');
  }
}