// app/javascript/packs/admin.js
function toggleMobileMenu() {
  // var mobileMenu = document.getElementById('mobile-menu');
  // mobileMenu.style.display = mobileMenu.style.display === 'block' ? 'none' : 'block';

  var menu = document.getElementById('mobile-menu');
  var icon = document.getElementById('mobile-menu-icon');

  if (menu.classList.contains('hidden')) {
    menu.classList.remove('hidden');
    icon.setAttribute('d', 'M6 18L18 6M6 6l12 12'); // Change icon to "X" (close icon)
  } else {
    menu.classList.add('hidden');
    icon.setAttribute('d', 'M4 6h16M4 12h16M4 18h16'); // Change icon back to menu icon
  }
}

// Make toggleMobileMenu globally available
window.toggleMobileMenu = toggleMobileMenu;
