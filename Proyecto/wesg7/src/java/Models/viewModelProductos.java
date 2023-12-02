/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Raul
 */
public class viewModelProductos {
    private int idProducto;
    private String nombreP;
    private String descripcionProducto;
    private double precio;
    private int idCategoria;
    private String categoria;
    private String detalles;
    private int idStok;
    private int cantidadStok;
    private String descripcionStok;

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreP() {
        return nombreP;
    }

    public void setNombreP(String nombreP) {
        this.nombreP = nombreP;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDetalles() {
        return detalles;
    }

    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }

    public int getIdStok() {
        return idStok;
    }

    public void setIdStok(int idStok) {
        this.idStok = idStok;
    }

    public int getCantidadStok() {
        return cantidadStok;
    }

    public void setCantidadStok(int cantidadStok) {
        this.cantidadStok = cantidadStok;
    }

    public String getDescripcionStok() {
        return descripcionStok;
    }

    public void setDescripcionStok(String descripcionStok) {
        this.descripcionStok = descripcionStok;
    }

}
