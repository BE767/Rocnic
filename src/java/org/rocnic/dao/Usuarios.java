/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.rocnic.dao;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author alumno
 */
public class Usuarios implements Serializable {

    public Usuarios() {
    }
   
     private int IdUsuario;
     private Perfiles IdPerfil;
     private String Usuario;
     private String Contraseña;
     private String Nombre;
     private String Boleta;

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public Perfiles getIdPerfil() {
        return IdPerfil;
    }

    public void setIdPerfil(Perfiles IdPerfil) {
        this.IdPerfil = IdPerfil;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getBoleta() {
        return Boleta;
    }

    public void setBoleta(String Boleta) {
        this.Boleta = Boleta;
    }
     
}
