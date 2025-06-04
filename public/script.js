document.addEventListener('DOMContentLoaded', function() {
    // Función para manejar los desplegables
    function setupDropdowns() {
        const dropdownTriggers = document.querySelectorAll('.dropdown-trigger');
        
        dropdownTriggers.forEach(trigger => {
            trigger.addEventListener('click', function(e) {
                const dropdownContent = this.nextElementSibling;
                
                // Toggle la clase active en el trigger
                this.classList.toggle('active');
                
                // Toggle la visibilidad del contenido
                if (dropdownContent.style.maxHeight) {
                    dropdownContent.style.maxHeight = null;
                } else {
                    dropdownContent.style.maxHeight = dropdownContent.scrollHeight + "px";
                }
            });
        });
    }

    // Toggle del sidebar completo
    const sidebarToggle = document.getElementById('sidebar-toggle');
    const sidebar = document.querySelector('.sidebar');
    
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', function() {
            sidebar.classList.toggle('collapsed');
            this.classList.toggle('active');
        });
    }

    // Inicializar los dropdowns
    setupDropdowns();

    // Manejar las opciones personalizables
    const customizableOptions = document.querySelectorAll('.customizable-option');
    
    customizableOptions.forEach(option => {
        option.addEventListener('click', function() {
            const currentActive = this.parentElement.querySelector('.active');
            if (currentActive) {
                currentActive.classList.remove('active');
            }
            this.classList.add('active');
        });
    });
}); 