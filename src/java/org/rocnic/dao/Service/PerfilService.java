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

/**
 *
 * @author gerdoc
 */
public class PerfilService extends Conexion<Perfiles> {

    public List<Perfiles> getPerfilList() {
        List<Perfiles> PerfilList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Perfiles perfil = null;
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
            PerfilList = new ArrayList<>();
            while (resultSet.next()) {
                perfil = new Perfiles();
                perfil.setIdPerfil(resultSet.getInt(1));
                perfil.setNombrePerfil(resultSet.getString(2));
                PerfilList.add(perfil);
            }
            resultSet.close();
            closeConnection(connection);
            return PerfilList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean addPerfil(Perfiles perfil) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO perfiles(IdPerfil,NombrePerfil) VALUES(?,?)";
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
            preparedStatement.setInt(1, perfil.getIdPerfil());
            preparedStatement.setString(2, perfil.getNombrePerfil());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updatePerfil(Perfiles perfil) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update perfiles SET NombrePerfil=? WHERE IdPerfil = ?";
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
            preparedStatement.setString(2, perfil.getNombrePerfil());
            preparedStatement.setInt(1, perfil.getIdPerfil());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deletePerfil(Perfiles perfil) {
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
            preparedStatement.setInt(1, perfil.getIdPerfil());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    
    
    public Perfiles getPerfilByPerfil(String rol) {
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
            preparedStatement.setString(1, rol);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }
            aux = new Perfiles();
            while (resultSet.next()) {

                aux.setIdPerfil(resultSet.getInt(1));
                aux.setNombrePerfil(resultSet.getString(2));
            }
            resultSet.close();
            closeConnection(connection);
            return aux;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
