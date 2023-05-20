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
import org.rocnic.dao.TipoError;

/**
 *
 * @author gerdoc
 */
public class TipoErrorService extends Conexion<TipoError>
{
    public List<TipoError> getTipoErrorList() 
    {
        List<TipoError> TipoErrorList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        TipoError tipoError = null;

        try 
        {
            connection = getConnection();
            if (connection == null) 
            {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM tipoerror");
            if (resultSet == null) 
            {
                return null;
            }
            TipoErrorList = new ArrayList<>();
            while (resultSet.next()) 
            {
                tipoError = new TipoError();
                tipoError.setIdTipoError(resultSet.getInt(1));
                TipoError.setIdTipoReporte(resultSet.getInt(1));
                tipoError.setNombreError(resultSet.getString(2));
                TipoErrorList.add(tipoError);
            }
            resultSet.close();
            closeConnection(connection);
            return TipoErrorList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addRol( TipoError tipoError )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO ROL(ROL,DESCRIPCION) VALUES(?,?)";
        int row = 0;
        try 
        {
            connection = getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, rol.getRol());
            preparedStatement.setString(2, rol.getDescripcion());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean updateRol( TipoError tipoError)
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update ROL SET DESCRIPCION=? WHERE ROL = ?";
        int row = 0;
        try 
        {
            connection = getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, rol.getDescripcion());
            preparedStatement.setString(2, rol.getRol());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteRol( TipoError tipoError )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM ROL WHERE ROL = ?";
        int row = 0;
        try 
        {
            connection = getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, rol.getRol() );
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Rol getRolByRol( TipoError tipoError) 
    {
        Rol aux = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try 
        {
            connection = getConnection();
            if (connection == null) 
            {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM ROL WHERE ROL = ?" );
            if (preparedStatement == null) 
            {
                return null;
            }
            preparedStatement.setString(1, rol );
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) 
            {
                return null;
            }
            aux = new Rol ( );
            while (resultSet.next()) 
            {
                
                aux.setRol(resultSet.getString(1));
                aux.setDescripcion(resultSet.getString(2));
            }
            resultSet.close();
            closeConnection(connection);
            return aux;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
}
