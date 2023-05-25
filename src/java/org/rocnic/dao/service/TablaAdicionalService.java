/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.rocnic.dao.service;

import org.rocnic.dao.Perfiles;
import org.rocnic.dao.TipoReporte;
import org.rocnic.dao.EstatusReporte;
import org.rocnic.dao.Periferico;
import org.rocnic.dao.Usuarios;
import org.rocnic.dao.Laboratorio;
import org.rocnic.dao.Equipos;
import org.rocnic.dao.TipoError;
import org.rocnic.dao.Reportes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TablaAdicionalService {
    private final Conexion<Connection> conexion;

    public TablaAdicionalService() {
        conexion = new Conexion<>();
    }

    public List<String> getNombresPerfiles() {
        List<String> nombresPerfiles = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT NombrePerfil FROM Perfiles";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String nombrePerfil = resultSet.getString("NombrePerfil");
                    nombresPerfiles.add(nombrePerfil);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresPerfiles;
    }

    public List<String> getNombresTipoReporte() {
        List<String> nombresTipoReporte = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT NombreTipoReporte FROM TipoReporte";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String nombreTipoReporte = resultSet.getString("NombreTipoReporte");
                    nombresTipoReporte.add(nombreTipoReporte);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresTipoReporte;
    }

    public List<String> getNombresEstatusReporte() {
        List<String> nombresEstatusReporte = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT NombreEstatus FROM EstatusReporte";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String nombreEstatus = resultSet.getString("NombreEstatus");
                    nombresEstatusReporte.add(nombreEstatus);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresEstatusReporte;
    }

    public List<String> getNombresPerifericos() {
        List<String> nombresPerifericos = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT NombrePeriferico FROM Perifericos";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String nombrePeriferico = resultSet.getString("NombrePeriferico");
                    nombresPerifericos.add(nombrePeriferico);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresPerifericos;
    }

    public List<String> getNombresUsuarios() {
        List<String> nombresUsuarios = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT Nombre FROM Usuarios";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String nombreUsuario = resultSet.getString("Nombre");
                    nombresUsuarios.add(nombreUsuario);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresUsuarios;
    }

    public List<String> getNombresLaboratorios() {
        List<String> nombresLaboratorios = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT NombreLaboratorio FROM Laboratorio";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String nombreLaboratorio = resultSet.getString("NombreLaboratorio");
                    nombresLaboratorios.add(nombreLaboratorio);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresLaboratorios;
    }

    public List<String> getNombresEquipos() {
        List<String> nombresEquipos = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT NombreEquipo FROM Equipos";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String nombreEquipo = resultSet.getString("NombreEquipo");
                    nombresEquipos.add(nombreEquipo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresEquipos;
    }

    public List<String> getNombresTipoError() {
        List<String> nombresTipoError = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT NombreError FROM TipoError";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String nombreError = resultSet.getString("NombreError");
                    nombresTipoError.add(nombreError);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresTipoError;
    }

    public List<String> getNombresReportes() {
        List<String> nombresReportes = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = conexion.getConnection();
            if (connection != null) {
                String query = "SELECT IdReporte FROM Reportes";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String idReporte = resultSet.getString("IdReporte");
                    nombresReportes.add(idReporte);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.closeConnection(connection);
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombresReportes;
    }
}

