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
import org.rocnic.dao.Equipos;
import org.rocnic.dao.service.Conexion;

/**
 *
 * @author Evelyn
 */
public class EquipoService extends Conexion<Equipos> {

    public List<Equipos> getEquiposList() {
        List<Equipos> equiposList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Equipos equipo = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM equipos");
            if (resultSet == null) {
                return null;
            }
            equiposList = new ArrayList<>();
            while (resultSet.next()) {
                equipo = new Equipos();
                equipo.setIdEquipo(resultSet.getInt(1));
                equipo.setIdLaboratorio(resultSet.getInt(2));
                equipo.setIdPeriferico(resultSet.getInt(3));
                equipo.setNombreEquipo(resultSet.getString(4));
                equiposList.add(equipo);
            }
            resultSet.close();
            closeConnection(connection);
            return equiposList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return equiposList;
    }

    public boolean addEquipos(Equipos equipo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO equipos (IdLaboratorio, NombreEquipo) VALUES (?, ?)";
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
            preparedStatement.setInt(1, equipo.getIdLaboratorio());
            preparedStatement.setString(2, equipo.getNombreEquipo());
            row = preparedStatement.executeUpdate();

            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return row < 0;
    }

    public boolean updateEquipos(Equipos equipo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE equipos SET NombreEquipo=?, IdPeriferico=? WHERE IdEquipo=?";
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
            preparedStatement.setString(1, equipo.getNombreEquipo());
            preparedStatement.setInt(2, equipo.getIdPeriferico());
            preparedStatement.setInt(3, equipo.getIdEquipo());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Equipos getEquiposByIdEquipo(int idEquipo) {
        Equipos equipo = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM equipos WHERE IdEquipo = ?");
            if (preparedStatement == null) {
                return null;
            }
            preparedStatement.setInt(1, idEquipo);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }

            equipo = new Equipos();
            if (resultSet.next()) {
                equipo.setIdEquipo(resultSet.getInt("IdEquipo"));
                equipo.setIdLaboratorio(resultSet.getInt("IdLaboratorio"));
                equipo.setIdPeriferico(resultSet.getInt("IdPeriferico"));
                equipo.setNombreEquipo(resultSet.getString("NombreEquipo"));
            }
            resultSet.close();
            closeConnection(connection);
            return equipo;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean deleteEquipo(Equipos equipo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM equipos WHERE IdEquipo = ?";
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
            preparedStatement.setInt(1, equipo.getIdEquipo());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public List<Equipos> getEquiposById(int idEquipo) {
        List<Equipos> equipos = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return equipos;
            }

            preparedStatement = connection.prepareStatement("SELECT * FROM equipos WHERE IdEquipo = ?");
            if (preparedStatement == null) {
                return equipos;
            }

            preparedStatement.setInt(1, idEquipo);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return equipos;
            }

            while (resultSet.next()) {
                Equipos equipo = new Equipos();
                equipo.setIdEquipo(resultSet.getInt("IdEquipo"));
                equipo.setIdLaboratorio(resultSet.getInt("IdLaboratorio"));
                equipo.setIdPeriferico(resultSet.getInt("IdPeriferico"));
                equipo.setNombreEquipo(resultSet.getString("NombreEquipo"));

                equipos.add(equipo);
            }

            resultSet.close();
            closeConnection(connection);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return equipos;
    }

  public boolean existeEquipo(String nombreEquipo, int idLaboratorio) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String sql = "SELECT * FROM equipos WHERE NombreEquipo = ? AND IdLaboratorio = ?";
    try {
        connection = getConnection();
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, nombreEquipo);
        preparedStatement.setInt(2, idLaboratorio);
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

  
  public boolean existeEquipos(int idEquipo) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        connection = getConnection();
        if (connection == null) {
            return false;
        }
        
        preparedStatement = connection.prepareStatement("SELECT * FROM equipos WHERE NombreEquipo = ?");
        if (preparedStatement == null) {
            return false;
        }
        
        preparedStatement.setInt(1, idEquipo);
        resultSet = preparedStatement.executeQuery();
        
        if (resultSet == null) {
            return false;
        }
        
        boolean existe = resultSet.next();
        
        resultSet.close();
        closeConnection(connection);
        
        return existe;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    
    return false;
}
  
  
  
  
    public boolean existeEquipo(int idEquipo) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean existe = false;

        try {
            connection = getConnection();
            if (connection != null) {
                String query = "SELECT COUNT(*) AS count FROM Equipos WHERE IdEquipo = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, idEquipo);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    int count = resultSet.getInt("count");
                    existe = count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos (resultSet, statement, connection)
        }

        return existe;
    }
    
    public int obtenerIdEquipoPorNombre(String nombreEquipo) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String sql = "SELECT IdEquipo FROM equipos WHERE NombreEquipo = ?";
    try {
        connection = getConnection();
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, nombreEquipo);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt("idEquipo");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } 
    return 0;  // Retorna 0 si no se encuentra el equipo
}

    public boolean deleteEquipoLab(Equipos equipo) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String sql = "DELETE FROM equipos WHERE NombreEquipo = ? AND IdLaboratorio = ?";
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
        preparedStatement.setString(1, equipo.getNombreEquipo());
        preparedStatement.setInt(2, equipo.getIdLaboratorio());
        row = preparedStatement.executeUpdate();
        closeConnection(connection);
        return row == 1;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return false;
}

    public boolean existeEquipoNombre(String nombreEquipo) {
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    boolean existe = false;

    try {
        connection = getConnection();
        if (connection != null) {
            String query = "SELECT COUNT(*) AS count FROM equipos WHERE NombreEquipo = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, nombreEquipo);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                existe = count > 0;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } 
    return existe;
}

    
    


}
