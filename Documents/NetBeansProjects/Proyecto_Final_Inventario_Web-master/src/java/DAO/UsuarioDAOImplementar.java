package DAO;

import Factory.ConexionDB;
import Factory.FactoryConexionDB;
import Model.Usuario;

//import com.sun.corba.se.spi.presentation.rmi.StubAdapter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.AbstractList;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class UsuarioDAOImplementar implements UsuarioDAO{
    
    ConexionDB conn;
    
    public UsuarioDAOImplementar(){
        
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
    }

    @Override
    public boolean GuardarUsuario(Usuario usuario) {
       this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        
        boolean guarda = false ;
        try {
            if (usuario.getId() == 0){
                StringBuilder miSQL = new StringBuilder();
                
                miSQL.append("INSERT INTO tb_usuario( nombre, apellido, correo, usuario, clave, tipo, estado, pregunta, respuesta, fecha_registro) VALUES ('"); 
               
                miSQL.append(usuario.getNombre_usuario() + "' , '").append(usuario.getApellido_usuario() + "' , '")
                        .append(usuario.getCorreo_usuario()  + "' , '").append(usuario.getUsuario()  + "' , '")
                        .append(usuario.getClave()  + "' , ").append(usuario.getTipo()  + " , ")
                        .append(usuario.getEstado()  + " , '").append(usuario.getPregunta()  + "' , '")
                        .append(usuario.getRespuesta()  + "' , '").append(usuario.getFecha_registro());
                miSQL.append("');");  
                
                this.conn.ejecutarSQL(miSQL.toString());
                
            } else if(usuario.getId() > 0){
                
                StringBuilder miSQL = new StringBuilder();
                
                miSQL.append("UPDATE tb_usuario SET nombre = '").append(usuario.getNombre_usuario()); 
                miSQL.append("', apellido = '").append(usuario.getApellido_usuario());
                miSQL.append("', correo = '").append(usuario.getCorreo_usuario());
                miSQL.append("', usuario = '").append(usuario.getUsuario());
                miSQL.append("', clave = '").append(usuario.getClave());
                miSQL.append("', tipo = '").append(usuario.getTipo());
                miSQL.append("', estado = '").append(usuario.getEstado());
                miSQL.append("', pregunta = '").append(usuario.getPregunta());
                miSQL.append("', respuesta = ").append(usuario.getRespuesta());
               // miSQL.append("', fecha_registro = ").append(usuario.getFecha_registro());
                miSQL.append(" WHERE id = ").append(usuario.getId());
                this.conn.ejecutarSQL(miSQL.toString());
            }
            guarda = true;
            
        } catch (Exception e) {
            
        }finally{
            this.conn.cerrarConexion();
        }
        return guarda;
    }

    @Override
    public List<Usuario> ListarUsuario() {
       StringBuilder miSQL = new StringBuilder();
       miSQL.append("SELECT * FROM tb_usuario");
       List<Usuario> lista = new ArrayList<Usuario>();
        try {
        ResultSet resultadoSQL = this.conn.consultaSQL(miSQL.toString());
        while (resultadoSQL.next()) {
            Usuario usuario = new Usuario();
            
            usuario.setId(resultadoSQL.getInt("id"));
            usuario.setNombre_usuario(resultadoSQL.getString("nombre"));
            usuario.setApellido_usuario(resultadoSQL.getString("apellido"));
            usuario.setCorreo_usuario(resultadoSQL.getString("correo"));
            usuario.setUsuario(resultadoSQL.getString("usuario"));
            usuario.setClave(resultadoSQL.getString("clave"));
            usuario.setTipo(resultadoSQL.getInt("tipo"));
            usuario.setEstado(resultadoSQL.getInt("estado"));
            usuario.setPregunta(resultadoSQL.getString("pregunta"));
            usuario.setRespuesta(resultadoSQL.getString("respuesta"));
            usuario.getFecha_registro();
            lista.add(usuario);
        }
        
        } catch (Exception ex) {
        }finally{
         this.conn.cerrarConexion();
        }
        return lista;
    }

    @Override
    public boolean borrarUsuario(int id_usuario_borrar) {
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        boolean borra = false;
        try {
            StringBuilder miSQL = new StringBuilder ();
            miSQL.append("DELETE FROM tb_usuario WHERE id = ").append(id_usuario_borrar);
            this.conn.ejecutarSQL(miSQL.toString());
            borra = true;
        } catch (Exception e) {
        }finally{
            this.conn.cerrarConexion();
    }
            return borra;
    }

    @Override
    public Usuario editarUsuario(int id_usuario_edit) {
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        Usuario usuario = new Usuario();
        StringBuilder miSQL = new StringBuilder();
        
       miSQL.append("SELECT * FROM tb_usuario WHERE id = ").append(id_usuario_edit);
        try {
            ResultSet resultadoSQL = this.conn.consultaSQL(miSQL.toString());
            while (resultadoSQL.next()) {
            usuario.setId(resultadoSQL.getInt("id"));
            usuario.setNombre_usuario(resultadoSQL.getString("nombre"));
            usuario.setApellido_usuario(resultadoSQL.getString("apellido"));
            usuario.setCorreo_usuario(resultadoSQL.getString("correo"));
            usuario.setUsuario(resultadoSQL.getString("usuario"));
            usuario.setClave(resultadoSQL.getString("clave"));
            usuario.setTipo(resultadoSQL.getInt("tipo"));
            usuario.setEstado(resultadoSQL.getInt("estado"));
            usuario.setPregunta(resultadoSQL.getString("pregunta"));
            usuario.setRespuesta(resultadoSQL.getString("respuesta"));
            usuario.getFecha_registro();
            }
        } catch (Exception e) {
        }finally{
            this.conn.cerrarConexion();
        }
        return usuario;
    }
    
    
     public boolean login(String nombre,String clave) {
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        Usuario usuario = new Usuario();
        StringBuilder miSQL = new StringBuilder();
        
       miSQL.append("SELECT * FROM tb_usuario WHERE usuario = '").append(nombre);
       miSQL.append("' and clave = '").append(clave);
       miSQL.append("';");
        try {
            ResultSet resultadoSQL = this.conn.consultaSQL(miSQL.toString());
            while (resultadoSQL.next()) {
              return true;
             
            }
            
        } catch (Exception e) {
        }finally{
            this.conn.cerrarConexion();
        }
        return false;
    }
     
       public boolean Recuperar(String nombre,String pregunta, String respuesta) {
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        Usuario usuario = new Usuario();
        StringBuilder miSQL = new StringBuilder();
        
       miSQL.append("SELECT * FROM tb_usuario WHERE usuario = '").append(nombre);
       miSQL.append("' and pregunta = '").append(pregunta);
       miSQL.append("' and respuesta = '").append(respuesta);
       miSQL.append("';");
        try {
            ResultSet resultadoSQL = this.conn.consultaSQL(miSQL.toString());
            while (resultadoSQL.next()) {
              return true;
             
            }
            
        } catch (Exception e) {
        }finally{
            this.conn.cerrarConexion();
        }
        return false;
    }
       
       public boolean Actualizarclave(String usuario,String clave) {
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        
        boolean actualizar = false ;
        try {
            
                
                StringBuilder miSQL = new StringBuilder();
                
                miSQL.append("UPDATE tb_usuario SET clave = '").append(clave); 
                miSQL.append("' WHERE usuario = '").append(usuario);
                 miSQL.append("';");
                
                this.conn.ejecutarSQL(miSQL.toString());
            
            actualizar = true;
            
        } catch (Exception e) {
            
        }finally{
            this.conn.cerrarConexion();
        }
        return actualizar;
    }
    
}
