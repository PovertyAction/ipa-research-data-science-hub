document.addEventListener('DOMContentLoaded', function() {
    const toggleButton = document.createElement('button');
    toggleButton.innerHTML = "☰";  // Collapse button symbol
    toggleButton.classList.add('sidebar-toggle-btn');
    document.body.appendChild(toggleButton);
  
    toggleButton.addEventListener('click', function() {
      const sidebar = document.querySelector('.sidebar');
      sidebar.classList.toggle('collapsed');
    });
  });
  