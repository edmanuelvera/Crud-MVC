<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js" crossorigin="anonymous"></script>
        <title>Agregar</title>
    </head>
    <body>
        <div class="container text-center">
            <div class="border m-4" style="height: 600px">
            <div class="card-header">
                <h2>Añadir nueva persona</h2>
                </div>
                <div class="card-body m-4 d-flex justify-content-center align-items-center">
        <form>
            DNI <br><br>
            <input type="text" name="txtDni"><br><br>
            NOMBRE<br><br>
            <input type="text" name="txtNombre"><br><br>
            <br><br>
            <input class="btn btn-success" type="submit" name="accion" value="Agregar">
            <a class="btn btn-info" href="ServletControlador?accion=listar">Regresar</a>
        </form>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
