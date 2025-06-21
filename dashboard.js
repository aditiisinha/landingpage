document.addEventListener('DOMContentLoaded', function() {
    // Handle logout
    const logoutBtn = document.querySelector('.logout-btn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', function(e) {
            e.preventDefault();
            localStorage.removeItem('isLoggedIn');
            localStorage.removeItem('username');
            window.location.href = 'index.html';
            // Clear the localStorage and redirect to the home page
            localStorage.clear();
            window.location.href = 'index.html';
        });
    }

    // Update user name in dashboard
    const userName = localStorage.getItem('username');
    const userNameElement = document.getElementById('user-name');
    if (userName && userNameElement) {
        userNameElement.textContent = `Welcome, ${userName}`;
    }
});
