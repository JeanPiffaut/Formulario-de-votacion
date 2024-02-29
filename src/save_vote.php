<?php

global $conn;

$response = array();

if (isset($_POST['name']) && $_POST['name'] != ""
    && isset($_POST['alias']) && $_POST['alias'] != ""
    && isset($_POST['rut']) && $_POST['rut'] != ""
    && isset($_POST['email']) && $_POST['email'] != ""
    && isset($_POST['region']) && $_POST['region'] != ""
    && isset($_POST['comuna']) && $_POST['comuna'] != ""
    && isset($_POST['candidato']) && $_POST['candidato'] != ""
    && !empty($_POST['como_se_entero']) && is_array($_POST['como_se_entero'])) {
    if (strlen($_POST['alias']) < 5
        || (!preg_match('/[a-zA-Z]/', $_POST['alias']) || !preg_match('/[0-9]/', $_POST['alias']))) {
        $response['error'][] = "El formato del alias no es valido";
    }

    if (!validarRUT($_POST['rut'])) {
        $response['error'][] = "El formato del rut ingresado no es valido";
    }

    if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $response['error'][] = "El formato del email ingresado no es valido";
    }

    if (!(count($_POST['como_se_entero']) >= 2)) {
        $response['error'][] = "Seleccione al menos 2 opciones en 'Cómo se enteró de nosotros'";
    }
} else {
    $response['error'][] = "No se han rellenado todos los campos necesarios";
}

// En caso de que se haya obtenido un error, terminamos la ejecucion
// Se corta en este punto para no realizar la conexion a base de datos sin validar lo basico
if (!empty($response)) {
    header('Content-Type: application/json');
    print json_encode($response);
    exit();
}

// Incluir el archivo de configuración
include("config.php");

// Buscamos la region para validar
$sql = "SELECT id FROM regions WHERE id = ?";
$region_prepare = $conn->prepare($sql);
$region_prepare->bind_param("s", $_POST['region']);
$region_prepare->execute();
$region_prepare->bind_result($region_result);
$region_prepare->fetch();
$region_prepare->close();

if ($region_result == null) {
    $response['error'][] = "El id de la region seleccionada no existe";
}

// Buscamos la comuna para validar
$sql = "SELECT id FROM communes WHERE id = ?";
$commune_prepare = $conn->prepare($sql);
$commune_prepare->bind_param("s", $_POST['comuna']);
$commune_prepare->execute();
$commune_prepare->bind_result($commune_result);
$commune_prepare->fetch();
$commune_prepare->close();

if ($commune_result == null) {
    $response['error'][] = "El id de la comuna seleccionada no existe";
}

// Buscamos al candidato presidencial para validar
$sql = "SELECT id FROM presidential_candidates WHERE id = ?";
$candidate_prepare = $conn->prepare($sql);
$candidate_prepare->bind_param("s", $_POST['candidato']);
$candidate_prepare->execute();
$candidate_prepare->bind_result($candidate_result);
$candidate_prepare->fetch();
$candidate_prepare->close();

if ($candidate_result == null) {
    $response['error'][] = "El id del candidato seleccionado no existe";
}

// Volvemos a cortar el proceso si alguno de los ids enviados no es valido
if (!empty($response)) {
    header('Content-Type: application/json');
    print json_encode($response);
    exit();
}

$como_se_entero = array(
    'web' => 0,
    'tv' => 0,
    'redes_sociales' => 0,
    'amigo' => 0,
);
foreach ($_POST['como_se_entero'] as $key => $options) {
    if ($options == "web") {
        $como_se_entero['web'] = 1;
    }
    if ($options == "tv") {
        $como_se_entero['tv'] = 1;
    }
    if ($options == "redes_sociales") {
        $como_se_entero['redes_sociales'] = 1;
    }
    if ($options == "amigo") {
        $como_se_entero['amigo'] = 1;
    }
}

try {
    $sql = "INSERT INTO votes (name, alias, rut, email, commune_id, region_id, candidate_id, web, tv, social_media, friend) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $prepare = $conn->prepare($sql);
    $rut = str_replace(".", "", $_POST['rut']);
    $prepare->bind_param(
        "sssssssssss",
        $_POST['name'],
        $_POST['alias'],
        $rut,
        $_POST['email'],
        $_POST['comuna'],
        $_POST['region'],
        $_POST['candidato'],
        $como_se_entero['web'],
        $como_se_entero['tv'],
        $como_se_entero['redes_sociales'],
        $como_se_entero['amigo']
    );
    $result = $prepare->execute();
    $prepare->close();
    $conn->close();
    if (!$result) {
        $response['error'][] = $prepare->error;
    }
} catch (Exception $e) {
    $response['error'][] = $e->getMessage();
}

$response['success'] = true;

header('Content-Type: application/json');
print json_encode($response);
exit();

// Funciones
function validarRUT($rut): bool
{
    $rut = preg_replace('/[^k0-9]/i', '', $rut);
    $dv = substr($rut, -1);
    $numero = substr($rut, 0, strlen($rut) - 1);
    if (!is_numeric($numero)) {
        return false;
    }

    $i = 2;
    $suma = 0;
    foreach (array_reverse(str_split($numero)) as $v) {
        if ($i == 8) {
            $i = 2;
        }

        $suma += $v * $i;
        ++$i;
    }

    $dvr = 11 - ($suma % 11);

    if ($dvr == 11) {
        $dvr = 0;
    }
    if ($dvr == 10) {
        $dvr = 'K';
    }

    if ($dvr == strtoupper($dv)) {
        return true;
    } else {
        return false;
    }
}