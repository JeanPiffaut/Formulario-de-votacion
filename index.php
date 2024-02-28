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
            <form action="/procesar_formulario" method="post" onsubmit="return validarFormulario()">
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
                    <select class="form-control" name="region" id="region" required>
                        <option value="1">Nose</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="comuna" class="form-label">Comuna</label>
                    <select class="form-control" name="comuna" id="comuna" required disabled>
                        <option value="1">Nose</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="candidato" class="form-label">Candidato</label>
                    <select class="form-control" name="candidato" id="candidato" required>
                        <option value="1">Nose</option>
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

    function validarFormulario() {
        var checkboxes = document.querySelectorAll('input[name="como_se_entero[]"]:checked');
        if (checkboxes.length < 2) {
            alert("Seleccione al menos 2 opciones en 'Cómo se enteró de nosotros'");
            return false;

        }
        return true;
    }
</script>
</body>
</html>
