/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.rocnic.dao.service;

/**
 *
 * @author Evelyn
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.rocnic.dao.Perfiles;
import org.rocnic.dao.service.Conexion;


public class PerfilesService extends Conexion<Perfiles>
{
    

     public List<Perfiles> getPerfilesList() {
        List<Perfiles> PerfilesList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Perfiles perfiles = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM perfiles");
            if (resultSet == null) {
                return null;
            }
            PerfilesList = new ArrayList<>();
            while (resultSet.next()) {
                perfiles = new Perfiles();
                perfiles.setIdPerfil(resultSet.getInt(1));
                perfiles.setNombrePerfil(resultSet.getString(2));
                PerfilesList.add(perfiles);
            }
            resultSet.close();
            closeConnection(connection);
            return PerfilesList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return PerfilesList;
    } 
     
       public boolean addUsuarios(Perfiles perfiles) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO perfiles (NombrePerfil) VALUES(?)";
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
            preparedStatement.setInt(1, perfiles.getIdPerfil());
            preparedStatement.setString(2, perfiles.getNombrePerfil());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return row < 0;
    }
     
     public boolean updateUsuarios(Perfiles perfiles) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE usuarios SET NombrePerfil=?,WHERE IdPerfil=?";
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
            preparedStatement.setString(1, perfiles.getNombrePerfil());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
     
        public Perfiles getPerfilesByPerfiles(String IdPerfil) {
        Perfiles aux = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM perfiles WHERE IdPerfil = ?");
            if (preparedStatement == null) {
                return null;
            }
            preparedStatement.setString(1, IdPerfil);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }

            aux = new Perfiles();
            if (resultSet.next()) {
                aux.setIdPerfil(resultSet.getInt("IdPerfil"));
                aux.setNombrePerfil(resultSet.getString("NombrePerfil"));
            }
            resultSet.close();
            closeConnection(connection);
            return aux;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

        public boolean deleteUsuario(Perfiles perfiles) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM perfiles WHERE IdPerfil = ?";
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
            preparedStatement.setInt(1, perfiles.getIdPerfil());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
        
    public String getNombrePerfil(int idPerfil) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String nombrePerfil = null;
    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
        preparedStatement = connection.prepareStatement("SELECT NombrePerfil FROM perfiles WHERE IdPerfil = ?");
        if (preparedStatement == null) {
            return null;
        }
        preparedStatement.setInt(1, idPerfil);
        resultSet = preparedStatement.executeQuery();
        if (resultSet == null) {
            return null;
        }
        if (resultSet.next()) {
            nombrePerfil = resultSet.getString("NombrePerfil");
        }
        resultSet.close();
        closeConnection(connection);
        return nombrePerfil;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return null;
}
 
   public  boolean validarCredenciales(String IUser, String IPassword) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            String query = "SELECT * FROM usuario WHERE usuario = ? AND contraseña = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, IUser);
            statement.setString(2, IPassword);
            resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    return false;
    }
}
