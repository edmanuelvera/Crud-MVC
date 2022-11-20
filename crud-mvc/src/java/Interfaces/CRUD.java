package Interfaces;

import Modelo.Persona;
import java.util.*;

public interface CRUD {
    public List listar();
    public Persona list(int id);
    public boolean add(Persona per);
    public boolean editar(Persona per);
    public boolean eliminar(int id);
}
