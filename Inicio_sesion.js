// Función para mostrar/ocultar la contraseña
function viewPassword() {
    const passwordInput = document.getElementById('password');
    const viewPasswordButton = document.getElementById('viewPassword');
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        viewPasswordButton.textContent = '🙈';
    } else {
        passwordInput.type = 'password';
        viewPasswordButton.textContent = '👁';
    }
}
