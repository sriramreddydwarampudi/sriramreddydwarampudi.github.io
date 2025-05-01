
<!-- Hide the content until auth check passes -->
<style>
  body { display: none; }
</style>

<!-- Firebase Auth Check -->
<script type="module">
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
  import { getAuth, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-auth.js";

  const firebaseConfig = {
    apiKey: "AIzaSyAHP91-em2RJ2wJfTQdID16KJlbUWcJ5e4",
    authDomain: "wellmap-16420.firebaseapp.com",
    projectId: "wellmap-16420"
  };

  const app = initializeApp(firebaseConfig);
  const auth = getAuth(app);

  onAuthStateChanged(auth, user => {
    if (user) {
      document.body.style.display = "block"; // Show protected page
    } else {
      window.location.href = "/login/";
    }
  });
</script>

# Protected Content

This content is only visible after login.


Jaja