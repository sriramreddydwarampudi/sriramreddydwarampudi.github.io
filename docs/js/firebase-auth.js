document.addEventListener("DOMContentLoaded", () => {
  // your entire firebase-auth.js code inside here


console.log("✅ firebase-auth.js loaded!");

// Initialize Firebase only once
if (!firebase.apps.length) {
  const firebaseConfig = {
    apiKey: "AIzaSyAHP91-em2RJ2wJfTQdID16KJlbUWcJ5e4",
    authDomain: "wellmap-16420.firebaseapp.com",
    projectId: "wellmap-16420",
  };
  firebase.initializeApp(firebaseConfig);
}

const auth = firebase.auth();

// Redirect unauthenticated users from protected routes
firebase.auth().onAuthStateChanged((user) => {
  const path = window.location.pathname;
  const isProtected = path.startsWith("/🏗️projects") || path.startsWith("/🗃️archives");

  if (isProtected && !user) {
    console.log("User not logged in — redirecting to /login/");
    window.location.href = "/login/";
  }
});

// Login function
function loginUser() {
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;

  auth.signInWithEmailAndPassword(email, password)
    .then(() => {
      console.log("Login successful");
      window.location.href = "/🏗️projects/";
    })
    .catch(err => {
      alert("Login failed: " + err.message);
      console.error("Login error:", err);
    });
}

// Logout function
function logoutUser() {
  auth.signOut().then(() => {
    console.log("Logged out");
    window.location.href = "/";
  });
}


});