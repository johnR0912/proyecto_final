package Model;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Usuario {
    Date fecha = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
    private String nuevoformato = sdf.format(fecha);
    private int id;
    private String nombre_usuario;
    private String apellido_usuario;
    private String correo_usuario;
    private String usuario;
    private String clave;
    private int tipo;
    private int estado;
    private String pregunta;
    private String respuesta;
    private String fecha_registro;

    public Usuario() {
        this.id = 0;
        this.nombre_usuario = "";
        this.apellido_usuario = "";
        this.correo_usuario = "";
        this.usuario = "";
        this.clave = "";
        this.tipo = 1;
        this.estado = 1;
        this.pregunta = "";
        this.respuesta = "";
        this.fecha_registro = nuevoformato;
    }

    public Usuario(int id, String nombre_usuario, String apellido_usuario, String correo_usuario, String usuario, String clave, int tipo, int estado, String pregunta, String respuesta, Date fecha_registro) {
        this.id = id;
        this.nombre_usuario = nombre_usuario;
        this.apellido_usuario = apellido_usuario;
        this.correo_usuario = correo_usuario;
        this.usuario = usuario;
        this.clave = clave;
        this.tipo = tipo;
        this.estado = estado;
        this.pregunta = pregunta;
        this.respuesta = respuesta;
        this.fecha_registro = nuevoformato;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getApellido_usuario() {
        return apellido_usuario;
    }

    public void setApellido_usuario(String apellido_usuario) {
        this.apellido_usuario = apellido_usuario;
    }

    public String getCorreo_usuario() {
        return correo_usuario;
    }

    public void setCorreo_usuario(String correo_usuario) {
        this.correo_usuario = correo_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    
}
