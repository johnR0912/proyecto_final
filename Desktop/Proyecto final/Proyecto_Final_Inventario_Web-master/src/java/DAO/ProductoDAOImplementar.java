package DAO;

import Factory.ConexionDB;
import Factory.FactoryConexionDB;
import Model.Producto;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAOImplementar implements ProductoDAO{
    
    ConexionDB conn;
    
    public ProductoDAOImplementar(){
        
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
    }


    @Override
    public Producto editarPro(int id_pro_edit) {
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        Producto producto = new Producto();
        StringBuilder miSQL = new StringBuilder();
        
       miSQL.append("SELECT * FROM tb_usuario WHERE id = ").append(id_pro_edit);
        try {
            ResultSet resultadoSQL = this.conn.consultaSQL(miSQL.toString());
            while (resultadoSQL.next()) {
            producto.setId_producto(resultadoSQL.getInt("id_producto"));
            producto.setNom_producto(resultadoSQL.getString("nom_producto"));
            producto.setStock(resultadoSQL.getFloat("stock"));
            producto.setPrecio(resultadoSQL.getFloat("precio"));
            producto.setUnidadMedida(resultadoSQL.getString("unidadmedida"));
            producto.setEstado(resultadoSQL.getInt("estado_producto"));
            producto.setDes_producto(resultadoSQL.getString("des_producto"));
            }
        } catch (Exception e) {
        }finally{
            this.conn.cerrarConexion();
        }
        return producto;
    }

    @Override
    public boolean guardarPro(Producto producto) {
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        
         boolean guarda = false ;
         try {
            if (producto.getId_producto()== 0){
                StringBuilder miSQL = new StringBuilder();
                
                miSQL.append("INSERT INTO tb_producto(nom_producto, stock, precio, unidadmedida, estado_producto, categoria, fecha_entreda, des_producto) VALUES ('"); 
               
                miSQL.append(producto.getNom_producto() + "' , ")
                        .append(producto.getStock()+ " , ")
                        .append(producto.getPrecio()+ " , '")
                        .append(producto.getUnidadMedida()+ "' , ")
                        .append(producto.getEstado()  + " , ")
                        .append(producto.getCategoria_id() + " , '")
                        .append(producto.getFecha_entrada() + "', '")
                        .append(producto.getDes_producto());
                miSQL.append("');");  
                System.out.println("miSQL: " + miSQL.toString());
                this.conn.ejecutarSQL(miSQL.toString());
                
            } else if(producto.getId_producto() > 0){
                
                StringBuilder miSQL = new StringBuilder();
                
                miSQL.append("UPDATE tb_producto SET nom_producto = '").append(producto.getNom_producto()); 
                miSQL.append("', stock = '").append(producto.getStock());
                miSQL.append("', precio = '").append(producto.getPrecio());
                miSQL.append("', unidadmedida = '").append(producto.getUnidadMedida());
                miSQL.append("', estado_producto = '").append(producto.getEstado());
                miSQL.append("', categoria = '").append(producto.getCategoria_id());
                miSQL.append("', des_producto = '").append(producto.getDes_producto());
                miSQL.append(" WHERE id_producto = ").append(producto.getId_producto());
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
    public boolean borrarPro(int id_pro_borrar) {
        this.conn = FactoryConexionDB.open(FactoryConexionDB.MySQL);
        boolean borra = false;
        try {
            StringBuilder miSQL = new StringBuilder ();
            miSQL.append("DELETE FROM tb_producto WHERE id_producto = ").append(id_pro_borrar);
            this.conn.ejecutarSQL(miSQL.toString());
            borra = true;
        } catch (Exception e) {
        }finally{
            this.conn.cerrarConexion();
    }
            return borra;
    }

    @Override
    public List<Producto> ListarProducto() {
       StringBuilder miSQL = new StringBuilder();
       miSQL.append("SELECT * FROM tb_producto");
       List<Producto> lista = new ArrayList<Producto>();
        try {
        ResultSet resultadoSQL = this.conn.consultaSQL(miSQL.toString());
        while (resultadoSQL.next()) {
            Producto producto = new Producto();
            
            producto.setId_producto(resultadoSQL.getInt("id_producto"));
            producto.setNom_producto(resultadoSQL.getString("nom_producto"));
            producto.setStock(resultadoSQL.getFloat("stock"));
            producto.setPrecio(resultadoSQL.getDouble("precio"));
            producto.setUnidadMedida(resultadoSQL.getString("unidadmedida"));
            producto.setEstado(resultadoSQL.getInt("estado_producto"));
            producto.setCategoria_id(resultadoSQL.getInt("categoria"));
            producto.setDes_producto(resultadoSQL.getString("des_producto"));
            lista.add(producto);
        }
        
        } catch (Exception ex) {
        }finally{
         this.conn.cerrarConexion();
        }
        return lista;
    }
    
}
