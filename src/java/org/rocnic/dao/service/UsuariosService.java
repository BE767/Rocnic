/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.rocnic.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.rocnic.dao.Perfiles;
import org.rocnic.dao.Usuarios;

/**
 *
 * @author Evelyn
 */
public class UsuariosService extends Conexion<Usuarios>

{
    public List<Usuarios> getUsuarioList() {
        List<Usuarios> UsuariosList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Usuarios usuarios = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM usuarios");
            if (resultSet == null) {
                return null;
            }
            UsuariosList = new ArrayList<>();
            while (resultSet.next()) {
                usuarios = new Usuarios();
                usuarios.setIdUsuario(resultSet.getInt(1));
                usuarios.setIdPerfil(resultSet.getInt(2));
                usuarios.setUsuario(resultSet.getString(3));
                usuarios.setContrasena(resultSet.getString(4));
                usuarios.setNombre(resultSet.getString(5));
                UsuariosList.add(usuarios);
            }
            resultSet.close();
            closeConnection(connection);
            return UsuariosList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return UsuariosList;
    }

    public boolean addUsuarios(Usuarios usuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO usuarios (IdPerfil,Usuario,Contrasena,Nombre) VALUES(?,?,?,?)";
        int row = 0;
        try {
            
            connection = getConnection();
            
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if (preparedStatement == null) {
                return false;
            }
            preparedStatement.setInt(1, usuario.getIdPerfil());
            preparedStatement.setString(2, usuario.getUsuario());
            preparedStatement.setString(3, usuario.getContrasena());
            preparedStatement.setString(4, usuario.getNombre());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return row < 0;
    }

    public boolean updateUsuarios(Usuarios usuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE usuarios SET IdPerfil=?, Usuario=?, Contraseña=?, Nombre=?  WHERE IdUsuario=?";
        int row = 0;
        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if (preparedStatement == null) {
                return false;
            }
            preparedStatement.setInt(1, usuario.getIdPerfil());
            preparedStatement.setString(2, usuario.getUsuario());
            preparedStatement.setString(3, usuario.getContrasena());
            preparedStatement.setString(4, usuario.getNombre());
            preparedStatement.setInt(5, usuario.getIdUsuario());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Usuarios getUsuariosByUsuarios(String IdUsuario) {
        Usuarios aux = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM usuarios WHERE IdUsuario = ?");
            if (preparedStatement == null) {
                return null;
            }
            preparedStatement.setString(1, IdUsuario);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }

            aux = new Usuarios();
            if (resultSet.next()) {
                aux.setIdUsuario(resultSet.getInt("IdUsuario"));
                aux.setIdPerfil(resultSet.getInt("IdPerfil"));
                aux.setUsuario(resultSet.getString("Usuario"));
                aux.setContrasena(resultSet.getString("Contraseña"));
                aux.setNombre(resultSet.getString("Nombre"));
                aux.setBoleta(resultSet.getString("Boleta"));
            }
            resultSet.close();
            closeConnection(connection);
            return aux;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean deleteUsuario(Usuarios usuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM usuarios WHERE IdUsuario = ?";
        int row = 0;
        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if (preparedStatement == null) {
                return false;
            }
            preparedStatement.setInt(1, usuario.getIdUsuario());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean validarUsuarioContraseñaBoletaExistente(String usuario, String contraseña, String boleta) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        boolean existe = false;

        try {
            connection = getConnection(); // Obtener conexión a la base de datos

            String sql = "SELECT * FROM usuarios WHERE Usuario = ? OR Contraseña = ? OR Boleta = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, usuario);
            preparedStatement.setString(2, contraseña);
            preparedStatement.setString(3, boleta);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                existe = (count > 0);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return existe;
    }

    public List<Usuarios> obtenerUsuarios() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Usuarios> usuarios = new ArrayList<>();

        try {
            connection = getConnection(); // Obtener conexión a la base de datos

            String sql = "SELECT IdUsuario, Boleta, Usuario FROM Usuarios";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idUsuario = resultSet.getInt("IdUsuario");
                String boleta = resultSet.getString("Boleta");
                String usuario = resultSet.getString("Usuario");

                Usuarios user = new Usuarios();
                user.setIdUsuario(idUsuario);
                user.setBoleta(boleta);
                user.setUsuario(usuario);

                usuarios.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usuarios;
    }

    public List<Perfiles> obtenerPerfiles() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Perfiles> perfiles = new ArrayList<>();

        try {
            connection = getConnection(); // Obtener conexión a la base de datos

            String sql = "SELECT IdPerfil, NombrePerfil FROM perfiles";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idPerfil = resultSet.getInt("IdPerfil");
                String nombrePerfil = resultSet.getString("NombrePerfil");
                
                Perfiles perfil = new Perfiles();
                perfil.setIdPerfil(idPerfil);
                perfil.setNombrePerfil(nombrePerfil);
                
                perfiles.add(perfil);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 

        return perfiles;
    }
    
    
    public List<Usuarios> obtenerUsuariosPorPerfil(int idPerfil) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Usuarios> usuarios = new ArrayList<>();

        try {
            connection = getConnection(); // Obtener conexión a la base de datos

            String sql = "SELECT IdUsuario, Boleta FROM usuarios WHERE IdPerfil = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idPerfil);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idUsuario = resultSet.getInt("IdUsuario");
                String boleta = resultSet.getString("Boleta");
                
                Usuarios usuario = new Usuarios();
                usuario.setIdUsuario(idUsuario);
                usuario.setBoleta(boleta);
                
                usuarios.add(usuario);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
        return usuarios;
    }

    
    // ...

    public boolean existeUsuario(String usuario, String contraseña) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contraseña = ?";
        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, usuario);
            preparedStatement.setString(2, contraseña);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
        return false;
    }

     public boolean existeUsuario(int idUsuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM usuarios WHERE idUsuario = ?";
        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idUsuario);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
     
    public Usuarios getUsuariosByLogin(String usuario, String contrasena) {
    Usuarios aux = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
        
        String query = "SELECT * FROM usuarios WHERE Usuario = ? AND Contrasena = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, usuario);
        preparedStatement.setString(2, contrasena);
        
        resultSet = preparedStatement.executeQuery();
        
        if (resultSet.next()) {
            aux = new Usuarios();
            aux.setUsuario(resultSet.getString("Usuario"));
            aux.setContrasena(resultSet.getString("Contrasena"));
            aux.setIdPerfil(resultSet.getInt("IdPerfil"));
        }
        resultSet.close();
        closeConnection(connection);
        
        return aux;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    
    return null;
}

    public boolean existePerfil(int idPerfil) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    try {
        connection = getConnection();
        preparedStatement = connection.prepareStatement("SELECT COUNT* FROM perfiles WHERE IdPerfil = ?");
        preparedStatement.setInt(1, idPerfil);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            int count = resultSet.getInt(1);
            return count > 0;
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } 
    return false;
}
  
    
    

}

     



    
    
    


