/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.rocnic.dao;

import java.io.Serializable;

/**
 *
 * @author alumno
 */
public class Laboratorio  implements Serializable
{
    private int IdLaboratorio;
    private String NombreLaboratorio;
    private int NumeroDeEquipo;
    private Periferico IdPeriferico;

    public int getIdLaboratorio() {
        return IdLaboratorio;
    }

    public void setIdLaboratorio(int IdLaboratorio) {
        this.IdLaboratorio = IdLaboratorio;
    }

    public String getNombreLaboratorio() {
        return NombreLaboratorio;
    }

    public void setNombreLaboratorio(String NombreLaboratorio) {
        this.NombreLaboratorio = NombreLaboratorio;
    }

    public int getNumeroDeEquipo() {
        return NumeroDeEquipo;
    }

    public void setNumeroDeEquipo(int NumeroDeEquipo) {
        this.NumeroDeEquipo = NumeroDeEquipo;
    }

    public Periferico getIdPeriferico() {
        return IdPeriferico;
    }

    public void setIdPeriferico(Periferico IdPeriferico) {
        this.IdPeriferico = IdPeriferico;
    }
    
    
    
}
