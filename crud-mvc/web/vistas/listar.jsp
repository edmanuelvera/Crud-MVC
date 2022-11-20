<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js" crossorigin="anonymous"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar</title>
    </head>

    <!-- Cabecero de la pagina -->
    <body>

        <header id="main-header" class="py-2 bg-secondary text-white">
            <div class="container">
                <div class="text-center">
                    <div class="row">
                        <div class="col-md-6">
                            <h1>
                                <i class="fas fa-solid fa-people-arrows">&nbsp;</i>Control de personas</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Cuerpo -->

        <div class="container">
            <br>

            <a class="btn btn-success" href="ServletControlador?accion=add">Agregar nuevo</a>


            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>Dni</th>
                        <th>Nombres</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <%

                    PersonaDAO dao = new PersonaDAO();
                    List<Persona> list = dao.listar();
                    Iterator<Persona> iter = list.iterator();
                    Persona per = null;
                    while (iter.hasNext()) {
                        per = iter.next();


                %>
                <tbody>
                    <tr>
                        <td><%= per.getId()%></td>
                        <td><%= per.getDni()%></td>
                        <td><%= per.getNombre()%></td>
                        <td class="text-center">

                            <a class="btn btn-info" href="ServletControlador?accion=editar&id=<%= per.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="ServletControlador?accion=eliminar&id=<%= per.getId()%>">Eliminar</a>

                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!-- Pie de pagina--> 
        <footer id="pie-pagina" class="bg-secondary text-white mt-3 p-3">
            <div class="container">
                <div class="col">
                    <p class="lead text-center">
                        Copyright &copy; Edmanuel Vera
                    </p>
                </div>
            </div>
        </footer>

        <!-- bt -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
