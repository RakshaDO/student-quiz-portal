// Main JavaScript for Student Quiz Portal

document.addEventListener('DOMContentLoaded', function() {
    // Auto-dismiss alerts after 5 seconds
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(function(alert) {
        setTimeout(function() {
            const bsAlert = new bootstrap.Alert(alert);
            bsAlert.close();
        }, 5000);
    });

    // Option selection highlighting is handled entirely by CSS in style.css
    // using the :checked + .option-label pseudo-class selector.
    // No inline JS styling needed here!
});
