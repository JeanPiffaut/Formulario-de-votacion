<?php

global $conn;

$response = array();

if (isset($_POST['name']) && $_POST['name'] != ""
    && isset($_POST['alias']) && $_POST['alias'] != ""
    && isset($_POST['rut']) && $_POST['rut'] != ""
    && isset($_POST['email']) && $_POST['email'] != ""
    && isset($_POST['region']) && $_POST['region'] != ""
    && isset($_POST['comuna']) && $_POST['comuna'] != ""
    && !empty($_POST['como_se_entero']) && is_array($_POST['como_se_entero'])) {

    if (strlen($_POST['alias']) < 5
        && (!preg_match('/[a-zA-Z]/', $_POST['alias']) || !preg_match('/[0-9]/', $_POST['alias']))) {
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

if (!empty($response)) {
    header('Content-Type: application/json');
    print json_encode($response);
    exit();
}

$response['success'] = true;

header('Content-Type: application/json');
print json_encode($response);
exit();

// Incluir el archivo de configuración
include("../db/config.php");

$conn->close();

// Funciones
function validarRUT($rut) {
    $rut = preg_replace('/[^k0-9]/i', '', $rut);
    $dv  = substr($rut, -1);
    $numero = substr($rut, 0, strlen($rut)-1);
    $i = 2;
    $suma = 0;
    foreach(array_reverse(str_split($numero)) as $v)
    {
        if($i==8)
            $i = 2;

        $suma += $v * $i;
        ++$i;
    }

    $dvr = 11 - ($suma % 11);

    if($dvr == 11)
        $dvr = 0;
    if($dvr == 10)
        $dvr = 'K';

    if($dvr == strtoupper($dv))
        return true;
    else
        return false;
}

function calcularDigitoVerificador($numero) {
    $factor = 2;
    $suma = 0;

    for ($i = strlen($numero) - 1; $i >= 0; $i--) {
        $suma += $factor * $numero[$i];
        $factor = $factor == 7 ? 2 : $factor + 1;
    }

    $dvCalculado = 11 - ($suma % 11);

    return $dvCalculado == 10 ? 'K' : ($dvCalculado == 11 ? '0' : (string)$dvCalculado);
}