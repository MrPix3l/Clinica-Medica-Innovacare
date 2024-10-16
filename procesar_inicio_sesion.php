<?php
session_start();

require_once 'Database.php';
if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $database = new Database();
    $db = $database->getConnection();

    $rut = $_POST['rut'];

    $rutcheck = 'SELECT password FROM usuarios WHERE rut=?';
    $stmt = $db->prepare($rutcheck);
    $usuario = $stmt->execute([$rut]);
    $usuario = $stmt->fetch();

    if ($usuario) {
        echo $_POST['password'];
        $hashed_passwd = password_hash($_POST['password'], PASSWORD_DEFAULT);
        
        echo "entered:" . "$hashed_passwd <br>";
        echo "db:" . $usuario['password'] . "<br>";
        
        if (password_verify($hashed_passwd, $usuario['password'])) {
            $_SESSION['user_id'] = $user['id'];
            echo "Inicio de sesion exitoso.";
            header('Location: ingreso.html');
            exit();
        } else {
            echo "contraseña incorrecta.";
        }
    } else {
        echo "RUT no encontrado.";
    }
} else {
    echo "no post";
}
?>