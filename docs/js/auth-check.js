document.addEventListener("DOMContentLoaded", function () {
  const currentPath = window.location.pathname;

  const protectedPages = [
    "/inbox/private-notes/",
    "/projects/communiactive/ram/",
  ];

  const requiresAuth = protectedPages.includes(currentPath);

  if (!requiresAuth) return;

  const redirectToLogin = () => {
    window.location.href = "/login/";
  };

  if (window.netlifyIdentity) {
    netlifyIdentity.on("init", user => {
      if (!user) {
        redirectToLogin();
      }
    });
    netlifyIdentity.init();
  } else {
    redirectToLogin();
  }
});