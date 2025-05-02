function renderNetlifyAuth(user) {
  const el = document.getElementById("netlify-auth");
  if (!el) return;

  if (user) {
    el.innerHTML = `
      <span style="margin-right: 0.5em;">${user.user_metadata.full_name || user.email}</span>
      <button id="logout-btn">Logout</button>
    `;
    document.getElementById("logout-btn").addEventListener("click", () => {
      netlifyIdentity.logout();
    });
  } else {
    el.innerHTML = `<button id="login-btn">Login</button>`;
    document.getElementById("login-btn").addEventListener("click", () => {
      netlifyIdentity.open();
    });
  }
}

if (window.netlifyIdentity) {
  netlifyIdentity.on("init", user => {
    renderNetlifyAuth(user);
  });

  netlifyIdentity.on("login", user => {
    renderNetlifyAuth(user);
    netlifyIdentity.close();
  });

  netlifyIdentity.on("logout", () => {
    renderNetlifyAuth(null);
  });

  netlifyIdentity.init();
}