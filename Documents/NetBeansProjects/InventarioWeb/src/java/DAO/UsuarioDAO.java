package DAO;

import Model.Usuario;
import java.util.List;


public interface UsuarioDAO {
    public boolean GuardarUsuario(Usuario usuario);
    public List<Usuario> ListarUsuario();
    public boolean borrarUsuario(int id_usuario_borrar);
    public Usuario editarUsuario(int id_usuario_edit);
    public boolean login(String nombre,String clave);
    public boolean Recuperar(String nombre,String pregunta, String respuesta);
    public boolean Actualizarclave(String usuario,String clave);
}
