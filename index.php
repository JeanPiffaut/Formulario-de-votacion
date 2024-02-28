<?php

global $conn;

include("db/config.php");

$sql = "SELECT id, name FROM regions";
$region_result = $conn->query($sql);

$sql = "SELECT id, name FROM presidential_candidates ORDER BY name ASC";
$candidates_result = $conn->query($sql);

?>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Formulario de prueba Desis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h1 class="mb-4">Formulario de Registro</h1>
            <form action="/procesar_formulario" id="formToVote" method="post" onsubmit="if(validateForm()) {sendForm();}return false;">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre y Apellido</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="mb-3">
                    <label for="alias" class="form-label">Alias</label>
                    <input type="text" class="form-control" id="alias" name="alias" required pattern="^(?=.*[A-Za-z])(?=.*\d).{5,}$">
                    <span class="text-muted small">Minimo 5 caracteres. Incluyendo numeros y letras</span>
                </div>
                <div class="mb-3">
                    <label for="rut" class="form-label">RUT</label>
                    <input type="text" class="form-control" id="rut" name="rut" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="region" class="form-label">Región</label>
                    <select class="form-control" name="region" id="region" onchange="selectCommune()" required>
                        <option value="">-- Selecciona una region --</option>
                        <?php
                        while ($row = $region_result->fetch_assoc()) {
                            print '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="comuna" class="form-label">Comuna</label>
                    <select class="form-control" name="comuna" id="comuna" required disabled>
                        <option value="">No hay comunas disponibles</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="candidato" class="form-label">Candidato</label>
                    <select class="form-control" name="candidato" id="candidato" required>
                        <option value="">-- Selecciona un candidato(a) --</option>
                        <?php
                        while ($row = $candidates_result->fetch_assoc()) {
                            print '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label w-100">Cómo se enteró de nosotros</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="como_se_entero[]" id="web" value="web">
                        <label class="form-check-label" for="web">Web</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="como_se_entero[]" id="tv" value="tv">
                        <label class="form-check-label" for="tv">TV</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="como_se_entero[]" id="redes_sociales" value="redes_sociales">
                        <label class="form-check-label" for="redes_sociales">Redes Sociales</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="como_se_entero[]" id="amigo" value="amigo">
                        <label class="form-check-label" for="amigo">Amigo</label>
                    </div>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-success">Enviar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="public/js/jquery.rut.min.js"></script>
<script>
    $("#rut").rut({
        formatOn: 'keyup'
    }).on('rutInvalido', function () {
        alert("El rut ingresado no es valido");
        $(this).val("");
    });

    function selectCommune() {
        // Obtener el valor seleccionado de la región
        var regionSeleccionada = $('#region').val();

        // Realizar la petición AJAX
        $.ajax({
            type: 'GET',
            url: 'src/search_communes.php',
            data: { region: regionSeleccionada },
            dataType: 'json',
            success: function(communes) {
                var communeSelect = $('#comuna');
                communeSelect.empty();
                if (communes.length > 0) {
                    communeSelect.removeAttr("disabled");
                    communeSelect.append('<option value="">-- Selecciona una comuna --</option>');

                    communes.forEach(function(comuna) {
                        communeSelect.append('<option value="' + comuna['id'] + '">' + comuna['name'] + '</option>');
                    });
                } else {
                    communeSelect.append('<option value="">No hay comunas disponibles</option>');
                }
            },
            error: function(xhr, status, error) {
                console.error("Error en la petición AJAX:", status, error);
            }
        });
    }

    function validateForm() {
        var checkboxes = document.querySelectorAll('input[name="como_se_entero[]"]:checked');
        if (checkboxes.length < 2) {
            alert("Seleccione al menos 2 opciones en 'Cómo se enteró de nosotros'");
            return false;

        }
        return true;
    }

    function sendForm() {
        var form = $('#formToVote');

        $.ajax({
            type: 'POST',
            url: 'src/save_vote.php',
            data: form.serialize(),
            success: function(response) {
                // Manejar la respuesta del servidor aquí (en este caso, response es el script)
                console.log(response);
                // Puedes ejecutar el script si es necesario
                // eval(response);
            }
        });
    }
</script>
</body>
</html>
<?php

// Cerrar la conexión a la base de datos
$conn->close();