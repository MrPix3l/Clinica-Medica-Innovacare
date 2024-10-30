
<?php
session_start();

require_once 'Database.php';
if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $database = new Database();
    $db = $database->getConnection();

    $rut = $_POST['rut'];

    $rutcheck = 'SELECT id_usuario, password FROM usuarios WHERE rut=?';
    $stmt = $db->prepare($rutcheck);
    $usuario = $stmt->execute([$rut]);
    $usuario = $stmt->fetch();

    if ($usuario) {
        echo $_POST['password'];
        $password = $_POST['password'];
        // $hashed_passwd = password_hash($password, PASSWORD_BCRYPT);
        
        echo "entered:" . "$hashed_passwd <br>";
        echo "password_p:".$password;
        echo "db:" . $usuario['password'] . "<br>";
        
        if (password_verify($password, $usuario['password'])) {
            $_SESSION['id_usuario'] = $usuario['id_usuario'];
            echo "Inicio de sesion exitoso.";
            header('Location: ingreso.php');
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
