package Controlador;

import Modelo.Persona;
import ModeloDAO.PersonaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;


public class ServletControlador extends HttpServlet {
    
    String listar ="vistas/listar.jsp";
    String add = "vistas/add.jsp";
    String edit = "vistas/edit.jsp";
    int id;
    
    Persona p = new Persona();
    PersonaDAO dao = new PersonaDAO();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso = listar;
            
        }else if(action.equalsIgnoreCase("add")){
            acceso= add;
        }else if(action.equalsIgnoreCase("Agregar")){
            String dni = request.getParameter("txtDni");
            String nombre = request.getParameter("txtNombre");
            p.setDni(dni);
            p.setNombre(nombre);
            dao.add(p);
            acceso = listar;
        }else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idPer", request.getParameter("id"));
            acceso = edit;
        }else if(action.equalsIgnoreCase("actualizado")){
            id=Integer.parseInt(request.getParameter("txtId"));
            String dni = request.getParameter("txtDni");
            String nombre = request.getParameter("txtNombre");
            p.setId(id);
            p.setDni(dni);
            p.setNombre(nombre);
            dao.editar(p);
            acceso = listar;
        }else if(action.equalsIgnoreCase("eliminar")){
            id= Integer.parseInt(request.getParameter("id"));
            p.setId(id);
            dao.eliminar(id);
            acceso = listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
