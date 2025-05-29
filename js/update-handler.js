function showUpdateNotification() {
  const notice = document.createElement('div');
  notice.className = 'offline-notice';
  notice.textContent = 'New content available! Refresh to update.';
  document.body.appendChild(notice);
  notice.style.display = 'block';
}