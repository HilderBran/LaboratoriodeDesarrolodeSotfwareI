/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author A21-PC11
 */
public class viewModelProveedores {
    private int idProveedor;
    private String nombresContacto;
    private String apellidosContacto;
    private String telefono;
    private String eMail;
    private String compania;
    private int idDireccion;
    private String direccionFull;

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNombresContacto() {
        return nombresContacto;
    }

    public void setNombresContacto(String nombresContacto) {
        this.nombresContacto = nombresContacto;
    }

    public String getApellidosContacto() {
        return apellidosContacto;
    }

    public void setApellidosContacto(String apellidosContacto) {
        this.apellidosContacto = apellidosContacto;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public String getCompania() {
        return compania;
    }

    public void setCompania(String compania) {
        this.compania = compania;
    }

    public int getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(int idDireccion) {
        this.idDireccion = idDireccion;
    }

    public String getDireccionFull() {
        return direccionFull;
    }

    public void setDireccionFull(String direccionFull) {
        this.direccionFull = direccionFull;
    }
}
