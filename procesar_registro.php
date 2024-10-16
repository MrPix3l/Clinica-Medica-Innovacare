<?php
session_start();
require_once 'Database.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Crear una nueva instancia de la base de datos
    $database = new Database();
    $db = $database->getConnection();

    // Recibir los datos enviados por el formulario
    $rut = $_POST['rut'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Verificar que las contraseñas coincidan
    if ($password !=     $confirm_password) {
        echo "Las contraseñas no coinciden.";
        exit();
    }

    // Verificar si el RUT ya está registrado
    $rutCheck = 'SELECT * FROM usuarios WHERE rut=?';
    $stmt = $db->prepare($rutCheck);
    $stmt->execute([$rut]);
    $usuarioExistente = $stmt->fetch();

    if ($usuarioExistente) {
        echo "El RUT ya está registrado.";
    } else {
        // Insertar un nuevo usuario en la base de datos
        $insertUser = 'INSERT INTO usuarios (rut, password) VALUES (?, ?)';
        $stmt = $db->prepare($insertUser);
        $hashed_password = password_hash($password, PASSWORD_DEFAULT); // Encriptar la contraseña
        $stmt->execute([$rut, $hashed_password]);

        if ($stmt) {
            echo "Registro exitoso. Ahora puedes iniciar sesión.";
            header('Location: inicio_sesion.html'); // Redirigir al login después del registro
            exit();
        } else {
            echo "Error al registrar el usuario.";
        }
    }
} else {
    echo "Método no permitido.";
}
?>
