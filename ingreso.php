<?php
session_start();


if (isset($_SESSION['id_usuario'])) {
    $id_paciente = $_SESSION['id_usuario'];
    //echo "El ID del paciente es: " . $id_paciente;
}
//7lse {
//    $id_paciente = $_SESSION['user_id'];
//}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel del Usuario - Clínica Innovacare</title>
    <link rel="stylesheet" href="ingreso.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="logo">Clínica Innovacare</div>
            <nav>
                <ul>
                    <li><a href="#historial-medico">Historial Médico</a></li>
                    <li><a href="#medicos-disponibles">Médicos Disponibles</a></li>
                    <li><a href="#citas">Citas</a></li>
                    <li><a href="index.html" class="login-button"> Cerrar Sesión</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <section id="bienvenida">
            <?php
                if (isset($_SESSION['exito']) && $_SESSION['exito'] === 1) {
                    echo "<h1><center>Cita agendada con exito!</center> </h1><br><br><br>";
                    unset($_SESSION['exito']);
                } 
            ?>

            <h1>Bienvenido estimado paciente</h1>
            <p>Aquí puedes gestionar tu historial médico, consultar los médicos disponibles y programar tus citas.</p>
        </section>

        <section id="historial-medico" class="dashboard-section">
            <h2>Historial Médico</h2>
            <div class="historial-content">
                <p><strong>Fecha:</strong> 12/09/2024</p>
                <p><strong>Consulta:</strong> Revisión General</p>
                <p><strong>Diagnóstico:</strong> Todo en orden</p>
            </div>
            <!-- Agrega más entradas de historial médico según sea necesario -->
        </section>

        <section id="medicos-disponibles" class="dashboard-section">
            <h2>Médicos Disponibles</h2>

            <!-- Lista de médicos -->
            <div class="medico-item">
                <p><strong>Nombre:</strong> Dr. José Martínez</p>
                <p><strong>Especialidad:</strong> Cardiología</p>
                <p><strong>Horario:</strong> Lunes a Viernes, 9:00 AM - 4:00 PM | Sábado, 9:00 AM - 1:00 PM</p>
            </div>

            <div class="medico-item">
                <p><strong>Nombre:</strong> Dra. María Fernández</p>
                <p><strong>Especialidad:</strong> Pediatría</p>
                <p><strong>Horario:</strong> Lunes a Jueves, 10:00 AM - 3:00 PM | Viernes, 1:00 PM - 6:00 PM</p>
            </div>

            <div class="medico-item">
                <p><strong>Nombre:</strong> Dr. Carlos Gómez</p>
                <p><strong>Especialidad:</strong> Dermatología</p>
                <p><strong>Horario:</strong> Lunes a Viernes, 8:00 AM - 2:00 PM | Sábado, 9:00 AM - 12:00 PM</p>
            </div>

            <div class="medico-item">
                <p><strong>Nombre:</strong> Dra. Ana Sánchez</p>
                <p><strong>Especialidad:</strong> Ginecología</p>
                <p><strong>Horario:</strong> Lunes, Miércoles, Viernes, 9:00 AM - 5:00 PM | Sábado, 10:00 AM - 2:00 PM</p>
            </div>

            <div class="medico-item">
                <p><strong>Nombre:</strong> Dr. Ricardo Pérez</p>
                <p><strong>Especialidad:</strong> Traumatología</p>
                <p><strong>Horario:</strong> Lunes a Viernes, 10:00 AM - 6:00 PM | Sábado, 8:00 AM - 12:00 PM</p>
            </div>

            <div class="medico-item">
                <p><strong>Nombre:</strong> Dra. Laura Torres</p>
                <p><strong>Especialidad:</strong> Oftalmología</p>
                <p><strong>Horario:</strong> Martes a Viernes, 9:00 AM - 5:00 PM | Sábado, 9:00 AM - 1:00 PM</p>
            </div>

            <div class="medico-item">
                <p><strong>Nombre:</strong> Dr. Francisco López</p>
                <p><strong>Especialidad:</strong> Neurología</p>
                <p><strong>Horario:</strong> Lunes, Miércoles y Viernes, 8:00 AM - 3:00 PM | Martes y Jueves, 1:00 PM - 6:00 PM</p>
            </div>
        </section>

        <section id="citas" class="dashboard-section">
            <h2>Tus Citas</h2>
            <p>No tienes citas agendadas. <a href="#" id="agendarCitaLink">Agenda una ahora</a></p> 

        </section>
    </main>

  <!-- Modal para Agendar Cita -->
<div id="agendarCitaModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Agendar Cita</h2>
        <form action="agendar_cita.php" method="POST">
            <div class="form-group">
                <label for="doctor">Selecciona un Doctor:</label>
                <select name="doctor" id="doctor" required>
                    <option value="">Seleccione un doctor</option>
                    <option value="1">Dr. José Martínez (Cardiología)</option>
                    <option value="2">Dra. María Fernández (Pediatría)</option>
                    <option value="3">Dr. Carlos Gómez (Dermatología)</option>
                    <option value="4">Dra. Ana Sánchez (Ginecología)</option>
                    <option value="5">Dr. Ricardo Pérez (Traumatología)</option>
                    <option value="6">Dra. Laura Torres (Oftalmología)</option>
                    <option value="7">Dr. Francisco López (Neurología)</option>
                    <!-- Agrega más doctores según sea necesario -->
                </select>
            </div>
            <div class="form-group">
                <label for="fecha">Selecciona la Fecha:</label>
                <input type="date" name="fecha" id="fecha" required>
            </div>
            <div class="form-group">
                <label for="hora">Selecciona la Hora:</label>
                <input type="time" name="hora" id="hora" required>
            </div>
            <button type="submit">Agendar Cita</button>
        </form>
    </div>
</div>


    <footer>
        <p>&copy; 2024 Clínica Innovacare. Todos los derechos reservados.</p>
    </footer>

    <script src="ingreso.js"></script>
</body>
</html>

 