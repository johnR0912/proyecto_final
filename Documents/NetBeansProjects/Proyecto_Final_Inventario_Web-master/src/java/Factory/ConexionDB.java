package Factory;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class ConexionDB {
    protected String[]parametros;
    protected Connection conexion;
    
    
    abstract Connection open();
    
    //Este método sirve para las sconsultas
    public ResultSet consultaSQL(String consulta) throws SQLException{
          Statement st;//Este objeto es el encargado de generar las consultas
          ResultSet rs = null;// Es donde se almacenan los datos
          try {
            st = conexion.createStatement();
            rs = st.executeQuery(consulta);// Este es el encargado de ejecutar la consulta
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
          
          
          return rs;
    }
    
    public boolean ejecutarSQL(String consulta){
        Statement st;
        boolean guardar =  true;
        try {
            st = conexion.createStatement();
            st.executeUpdate(consulta);
        } catch (SQLException ex) {
            guardar =  false;
            ex.printStackTrace();
        }
        return guardar;
    }
    
    public boolean cerrarConexion(){
        boolean ok =  true;
        try {
            conexion.close();
        } catch (Exception ex) {
            ok = false;
            ex.printStackTrace();
        }
        return ok;
    }
    
}
