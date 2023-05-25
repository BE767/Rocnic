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
import org.rocnic.dao.Reportes;
import org.rocnic.dao.Usuarios;

/**
 *
 * @author Evelyn
 */
public class ReporteServices extends Conexion<Reportes> {

    public List<Reportes> getReportesList() {
        List<Reportes> ReportesList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Reportes reportes = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM reportes");
            if (resultSet == null) {
                return null;
            }
            ReportesList = new ArrayList<>();
            while (resultSet.next()) {
                reportes = new Reportes();
                reportes.setIdReporte(resultSet.getInt(1));
                reportes.setIdTipoReporte(resultSet.getInt(2));
                reportes.setIdLaboratorio(resultSet.getInt(3));
                reportes.setIdEquipos(resultSet.getInt(4));
                reportes.setIdUsuario(resultSet.getInt(5));
                reportes.setIdTipoError(resultSet.getInt(6));
                reportes.setIdEstatusReporte(resultSet.getInt(7));
                reportes.setFechaCreacion(resultSet.getDate(8));
                reportes.setFechaActualizacion(resultSet.getDate(9));
                reportes.setUsuarioActualizacion(resultSet.getDate(10));
                reportes.setUsuarioCreacion(resultSet.getDate(11));
                ReportesList.add(reportes);
            }
            resultSet.close();
            closeConnection(connection);
            return ReportesList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ReportesList;
    }

        public boolean addReportes(Reportes reportes) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO reportes (IdLaboratorio, IdEquipo, IdUsuario, IdTipoError, FechaCreacion) VALUES (?, ?, ?, ?, CURDATE())";
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
            preparedStatement.setInt(1, reportes.getIdLaboratorio());
            preparedStatement.setInt(2, reportes.getIdEquipos());
            preparedStatement.setInt(3, reportes.getIdUsuario());
            preparedStatement.setInt(4, reportes.getIdTipoError());
            row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Cerrar la declaración preparada y la conexión
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return false;
    }

    public boolean updateReportes(Reportes reportes) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE reportes SET IdEstatusReporte=? ,FechaActualizacion=?, UsuarioActualizacion=?   WHERE IdReporte=?";
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
            preparedStatement.setInt(1, reportes.getIdEstatusReporte());
            preparedStatement.setDate(2, dateUtil2DateSql(reportes.getFechaActualizacion()));
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Reportes getReportesByReportes(String IdReporte) {
        Reportes aux = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM reportes WHERE IdReporte = ?");
            if (preparedStatement == null) {
                return null;
            }
            preparedStatement.setString(1, IdReporte);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }

            aux = new Reportes();
            if (resultSet.next()) {
                aux.setIdReporte(resultSet.getInt("IdReporte"));
                aux.setIdTipoReporte(resultSet.getInt("IdTipoReporte"));
                aux.setIdLaboratorio(resultSet.getInt("IdLaboratorio"));
                aux.setIdUsuario(resultSet.getInt("IdUsuario"));
                aux.setIdTipoError(resultSet.getInt("IdTipoError"));
                aux.setIdEstatusReporte(resultSet.getInt("IdEstatusReporte"));
                aux.setFechaCreacion(resultSet.getDate("FechaCreacion"));
                aux.setFechaActualizacion(resultSet.getDate("FechaActualizacion"));
                aux.setUsuarioActualizacion(resultSet.getDate("UsuarioActualizacion"));
                aux.setUsuarioCreacion(resultSet.getDate("UsuarioCreacion"));
            }
            resultSet.close();
            closeConnection(connection);
            return aux;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean deleteUsuario(Reportes reportes) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM reportes WHERE IdReporte = ?";
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
            preparedStatement.setInt(1, reportes.getIdReporte());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

}
