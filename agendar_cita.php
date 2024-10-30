<?php
session_start();

if (isset($_SESSION['id_usuario'])) {
    $id_paciente = $_SESSION['id_usuario'];
    //echo "El ID del paciente es: " . $id_paciente;
} 
//else {
//    $id_paciente = $_SESSION['user_id'];
//}
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$database = "centromedico";

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Capturar los datos del formulario
$id_doctor  = $_POST['doctor'];
$fecha = $_POST['fecha'];
$hora = $_POST['hora'];

$sql = "INSERT INTO citas (id_paciente, id_doctor, fecha, hora) VALUES (?, ? ,?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iiss", $_SESSION['id_usuario'], $id_doctor, $fecha, $hora);

if ($stmt->execute()) {
    $_SESSION['exito'] = 1;
    header("Location: ingreso.php");
    die();
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
// Cerrar la conexión
$conn->close();
?>
