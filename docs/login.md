

<div id="netlify-auth" style="display: flex; flex-direction: column; align-items: center; margin-top: 2em;">
  <button id="netlify-login-btn"
    style="
      all: unset;
      display: flex;
      align-items: center;
      justify-content: center;
      width: 80px;
      height: 80px;
      border-radius: 50%;
      overflow: hidden;
      cursor: pointer;
      transition: transform 0.2s ease, box-shadow 0.2s ease;
      box-shadow: 0 4px 12px rgba(0,0,0,0.2);
      background-color: #f1f1f1;
    "
    title="Login"
  >
    <img
      id="netlify-profile-pic"
      src="https://img.icons8.com/material-outlined/48/000000/user.png"
      alt="Login"
      style="width: 100%; height: 100%; object-fit: cover;"
    />
  </button>

  <p id="netlify-user-name" style="margin-top: 1em; font-weight: bold; font-size: 1.1rem; color: #333;">
    Please login to access inside of Dr. Ram's second brain
  </p>
</div>

<script defer src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    if (window.netlifyIdentity) {
      const btn = document.getElementById("netlify-login-btn");
      const img = document.getElementById("netlify-profile-pic");
      const nameText = document.getElementById("netlify-user-name");

      function updateLoginButton(user) {
        if (!btn || !img || !nameText) return;

        if (user) {
          const avatar = user.user_metadata.avatar_url ||
            "https://ui-avatars.com/api/?name=" + encodeURIComponent(user.user_metadata.full_name || "User");
          const name = user.user_metadata.full_name || "User";

          img.src = avatar;
          img.alt = "Logout";
          btn.title = "Logout";
          nameText.textContent = "You can access my second brain, " + name;
          btn.onclick = () => {
            netlifyIdentity.logout();
            setTimeout(() => location.reload(), 300); // reload after logout
          };
        } else {
          img.src = "https://img.icons8.com/material-outlined/48/000000/user.png";
          img.alt = "Login";
          btn.title = "Login";
          nameText.textContent = "Please login to access inside of Dr. Ram's second brain";
          btn.onclick = () => netlifyIdentity.open();
        }
      }

      // Add hover effect
      btn.addEventListener("mouseover", () => {
        btn.style.transform = "scale(1.05)";
        btn.style.boxShadow = "0 6px 16px rgba(0,0,0,0.3)";
      });
      btn.addEventListener("mouseout", () => {
        btn.style.transform = "scale(1)";
        btn.style.boxShadow = "0 4px 12px rgba(0,0,0,0.2)";
      });

      netlifyIdentity.on("init", user => updateLoginButton(user));
      netlifyIdentity.on("login", user => {
        updateLoginButton(user);
        netlifyIdentity.close();
      });
      netlifyIdentity.on("logout", () => updateLoginButton(null));
      netlifyIdentity.init();
    }
  });
</script>