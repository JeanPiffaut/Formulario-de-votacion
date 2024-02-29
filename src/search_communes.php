<?php

global $conn;

// Incluir el archivo de configuración
include("config.php");

// Verificar si se ha recibido la región como parámetro
if (isset($_GET['region'])) {
    $region = $_GET['region'];

    // Consulta para obtener las comunas de la región
    $sql = "SELECT id, name FROM communes WHERE region_id = ? ORDER BY name ASC";
    $commune_results = $conn->prepare($sql);
    $commune_results->bind_param("s", $region);
    $commune_results->execute();
    $result = $commune_results->get_result();

    $comunas = array();

    // Obtener las comunas como un array asociativo
    while ($row = $result->fetch_assoc()) {
        $comunas[] = $row;
    }

    // Cerrar la consulta
    $commune_results->close();

    // Devolver las comunas como JSON
    header('Content-Type: application/json');
    print json_encode($comunas);
} else {
    // Si no se proporciona la región, devolver un JSON vacío o un mensaje de error según sea necesario
    header('Content-Type: application/json');
    print json_encode("");
}

// Cerrar la conexión a la base de datos
$conn->close();

