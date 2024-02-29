<?php

// Configuración de la base de datos
$host = "localhost";
$user = "root";
$pass = "root";
$db_name = "vote_db";

try {
    // Conexión a la base de datos
        $conn = new mysqli($host, $user, $pass, $db_name);

    // Verificar la conexión
        if ($conn->connect_error) {
            die("Error de conexión a la base de datos: " . $conn->connect_error);
        }

    // Configurar el conjunto de caracteres a UTF-8
        $conn->set_charset("utf8");
} catch (Exception $e) {

}
