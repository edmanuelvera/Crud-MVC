package ModeloDAO;

import Interfaces.CRUD;
import Modelo.Persona;
import config.Conexion;
import java.sql.*;
import java.util.*;
import java.util.List;

public class PersonaDAO implements CRUD{
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement stmt;
    ResultSet rs;
    Persona p = new Persona();

    @Override
    public List listar() {
        ArrayList<Persona> list = new ArrayList<>();
        String sql = "select * from persona";
        try {
            con = cn.getConnection();
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()){
                Persona per = new Persona();
                per.setId(rs.getInt("id"));
                per.setDni(rs.getString("dni"));
                per.setNombre(rs.getString("nombre"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Persona list(int id) {
         ArrayList<Persona> list = new ArrayList<>();
        String sql = "select * from persona where id=" + id;
        try {
            con = cn.getConnection();
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()){
                Persona per = new Persona();
                p.setId(rs.getInt("id"));
                p.setDni(rs.getString("dni"));
                p.setNombre(rs.getString("nombre"));
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(Persona per) {
        String sql = "insert into persona(dni, nombre) values('"+per.getDni() + "' , '"+per.getNombre()+"')";
        try {
            con = cn.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean editar(Persona per) {
         String sql = "update persona set dni = '"+per.getDni() + "' , nombre = '"+per.getNombre()+"'where id="+per.getId();
         try {
            con = cn.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (Exception e) {
        }
         return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "delete from persona where id =" + id;
        try {
            con = cn.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (Exception e) {
        }
            return false;
    }

}
