// Initialize Netlify Identity
if (window.netlifyIdentity) {
  window.netlifyIdentity.on("init", user => {
    console.log("Netlify Identity initialized", user);

    // If no user is logged in, open login modal on click
    const loginBtn = document.getElementById("login-btn");
    if (loginBtn) {
      loginBtn.addEventListener("click", () => {
        window.netlifyIdentity.open();
      });
    }

    const logoutBtn = document.getElementById("logout-btn");
    if (logoutBtn) {
      logoutBtn.addEventListener("click", () => {
        window.netlifyIdentity.logout();
      });
    }

    window.netlifyIdentity.on("login", user => {
      console.log("User logged in:", user);
      window.location.reload(); // or redirect if needed
    });

    window.netlifyIdentity.on("logout", () => {
      console.log("User logged out");
      window.location.reload();
    });
  });

  window.netlifyIdentity.init();
}