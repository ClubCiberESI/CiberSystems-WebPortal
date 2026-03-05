document.addEventListener('DOMContentLoaded', () => {
    // Actualizar el año del footer automáticamente
    const yearSpan = document.getElementById('current-year');
    if (yearSpan) {
        yearSpan.textContent = new Date().getFullYear();
    }

    // Easter Egg para el Red Team si abren las DevTools (F12)
    console.log("%c[CiberSystems SysAdmin]", "color: #58a6ff; font-weight: bold;");
    console.log("Aviso interno: La migración de la mensajería outbox de J.García sigue pendiente. No purgar tablas temporales.");
});