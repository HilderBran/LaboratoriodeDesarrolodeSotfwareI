/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Models.ViewModelCargo;
import Models.ViewModelCategorias;
import Models.viewModelEmpleados;
import Models.ViewModelClientes;
import Models.ViewModelDirecciones;
import Models.ViewModelFacturas;
import Models.ViewModelStok;
import Models.ViewModelUsuarios;
import Models.viewModelCompras;
import Models.viewModelPedidos;
import Models.viewModelProductos;
import Models.viewModelProveedores;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author A21-PC11
 */
@WebServlet (name = "ServletPrincipal", urlPatterns = {"/ServletPrincipal"})
public class ServletPrincipal extends HttpServlet {
    private final String user = "login_gg_diegogonzales";
    private final String pass = "Gonzales1234";
    private final String servidor = "localhost:1433";
    private final String bd = "tiendaElectronica";

    String url = "jdbc:sqlserver://"
            + servidor
            + ";databaseName="+bd
            + ";user="+user
            +";password="+pass
            +";encrypt=false;trustServerCertificate=false;";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaEmpleados";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<viewModelEmpleados> listaEmpleados = new ArrayList<>();
                while (rs.next()) {
                    viewModelEmpleados empleado = new viewModelEmpleados();
                    empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                    empleado.setDui(rs.getString("dui"));
                    empleado.setIsss(rs.getInt("iSSS"));
                    empleado.setNombresEmpleado(rs.getString("nombresEmpleado"));
                    empleado.setApellidosEmpleado(rs.getString("apellidosEmpleado"));
                    empleado.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                    empleado.setTelefono(rs.getString("telefono"));
                    empleado.seteMail(rs.getString("eMail"));
                    empleado.setIdCargo(rs.getInt("idCargo"));
                    empleado.setCargo(rs.getString("Cargo"));
                    empleado.setIdDireccion(rs.getInt("idDireccion"));
                    empleado.setDireccionFull(rs.getString("DireccionCompleta"));
                    listaEmpleados.add(empleado);
                }               
                request.setAttribute("listaEmpleados", listaEmpleados);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) {
       //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String DUI_Empleado = request.getParameter("dui");
        String ISSS_Empleado = request.getParameter("isss");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacimiento");
        String telefonoEmpleado = request.getParameter("telefono");
        String correo = request.getParameter("eMail");
        String ID_Cargo = request.getParameter("idCargo");
        String ID_Direccion = request.getParameter("idDireccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Empleados values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                //Nombres, Apellidos, FechaNac, DUI_Empleado, ISSS, Telefono, Correo, ID_Cargo, ID_Direccion
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresEmpleado);
                pstmt.setString(2, apellidosEmpleado);
                pstmt.setString(3, fechaNacEmpleado);
                pstmt.setString(4, DUI_Empleado);
                pstmt.setString(5, ISSS_Empleado);
                pstmt.setString(6, telefonoEmpleado );
                pstmt.setString(7, correo);
                pstmt.setString(8, ID_Cargo);
                pstmt.setString(9, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de actualizacion de registros (UPDATE)
    public void modificarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Empleado = request.getParameter("ID_Empleado");
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "update Empleados set "
                 + "dui='"+DUI_Empleado+"', "
                 + "ISSS='"+ISSS_Empleado+"', "
                 + "nombresEmpleado='"+nombresEmpleado+"', "
                 + "apellidosEmpleado='"+apellidosEmpleado+"', "
                 + "fechaNacimiento='"+fechaNacEmpleado+"', "
                 + "telefono='"+telefonoEmpleado+"', "
                 + "eMail='"+correo+"', " 
                 + "idCargo='"+ID_Cargo+"', "
                 + "idDireccion='"+ID_Direccion+"' " 
                 + "where idEmpleado='"+ID_Empleado+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de eliminacion de registros (DELETE)
    public void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        String ID_Empleado = request.getParameter("ID_Empleado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Empleados where idEmpleado='" + ID_Empleado + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    // clientes metodos
    public void mostrarClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaClientes";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelClientes> listaClientes = new ArrayList<>();
                while (rs.next()) {
                    ViewModelClientes cliente = new ViewModelClientes();
                    cliente.setIdCliente(rs.getInt("idCliente"));
                    cliente.setDui(rs.getString("dui"));
                    cliente.setNombresCliente(rs.getString("nombresCliente"));
                    cliente.setApellidosCliente(rs.getString("apellidosCliente"));
                    cliente.setTelefono(rs.getString("telefono"));
                    cliente.seteMail(rs.getString("eMail"));
                    cliente.setIdDireccion(rs.getInt("idDireccion"));
                    cliente.setDireccionFull(rs.getString("DireccionCompleta"));
                    listaClientes.add(cliente);
                }               
                request.setAttribute("listaClientes", listaClientes);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    public void agregarCliente(HttpServletRequest request, HttpServletResponse response) {
       //CAPTURA DE VARIABLES
       //El ID de los clientes es autoincrementable
        String DUI_Cliente = request.getParameter("dui");
        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String telefonoCliente = request.getParameter("telefono");
        String correo = request.getParameter("eMail");
        String iddireccion = request.getParameter("idDireccion");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Clientes values (?, ?, ?, ?, ?, ?)";
                //nombresCliente, apellidosCliente, dui, telefono, eMail, idDireccion
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresCliente);
                pstmt.setString(2, apellidosCliente);
                pstmt.setString(3, DUI_Cliente);
                pstmt.setString(4, telefonoCliente);
                pstmt.setString(5, correo);
                pstmt.setString(6, iddireccion );
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de actualizacion de registros (UPDATE)
    public void modificarCliente(HttpServletRequest request, HttpServletResponse response) {
        ///CAPTURA DE VARIABLES
        String ID_Cliente = request.getParameter("idCliente");
        String DUI_Cliente = request.getParameter("dui");
        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String telefonoCliente = request.getParameter("telefono");
        String correo = request.getParameter("eMail");
        String iddireccion = request.getParameter("idDireccion");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "UPDATE Clientes "
                        + "SET nombresCliente = '"+nombresCliente+"'," 
                        + "apellidosCliente = '"+apellidosCliente+"'," 
                        + "dui = '"+DUI_Cliente+"'," 
                        + "telefono = '"+telefonoCliente+"'," 
                        + "eMail = '"+correo+"'," 
                        + "idDireccion = '"+iddireccion+"'" 
                        + "WHERE IDCliente = '"+ID_Cliente+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Funciones de eliminacion de registros (DELETE)
    public void eliminarCliente(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cliente = request.getParameter("ID_Cliente");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Clientes where IDCliente= '"+ID_Cliente+"'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    // proveedores
    public void mostrarProveedores(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaProveedores";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<viewModelProveedores> listaProveedores = new ArrayList<>();
                while (rs.next()) {
                    viewModelProveedores proveedor = new viewModelProveedores();
                    proveedor.setIdProveedor(rs.getInt("idProveedor"));
                    proveedor.setNombresContacto(rs.getString("nombresContacto"));
                    proveedor.setApellidosContacto(rs.getString("apellidosContacto"));
                    proveedor.setTelefono(rs.getString("telefono"));
                    proveedor.seteMail(rs.getString("eMail"));
                    proveedor.setCompania(rs.getString("compania"));
                    proveedor.setIdDireccion(rs.getInt("idDireccion"));
                    proveedor.setDireccionFull(rs.getString("DireccionCompleta"));
                    listaProveedores.add(proveedor);
                }               
                request.setAttribute("listaProveedores", listaProveedores);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarProveedor(HttpServletRequest request, HttpServletResponse response) {
       //CAPTURA DE VARIABLES
        //El ID de los proveedores es autoincrementable
        String nombresContacto = request.getParameter("nombresContacto");
        String apellidosContacto = request.getParameter("apellidosContacto");
        String telefonoProveedor = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String compania = request.getParameter("compania");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Proveedores values (?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresContacto);
                pstmt.setString(2, apellidosContacto);
                pstmt.setString(3, telefonoProveedor);
                pstmt.setString(4, correo);
                pstmt.setString(5, compania);
                pstmt.setString(6, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de actualizacion de registros (UPDATE)
    public void modificarProveedor(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        String nombresContacto = request.getParameter("nombresContacto");
        String apellidosContacto = request.getParameter("apellidosContacto");
        String telefonoContacto = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String compania = request.getParameter("compania");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "update Proveedores set "
                 + "nombresContacto='"+nombresContacto+"', "
                 + "apellidosContacto='"+apellidosContacto+"', "
                 + "telefono='"+telefonoContacto+"', "
                 + "eMail='"+correo+"', " 
                 + "compania='"+compania+"', "
                 + "idDireccion='"+ID_Direccion+"' " 
                 + "where idProveedor='"+ID_Proveedor+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de eliminacion de registros (DELETE)
    public void eliminarProveedor(HttpServletRequest request, HttpServletResponse response) {
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Proveedores where idProveedor ='" + ID_Proveedor + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Productos
    public void mostrarProductos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaProductos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<viewModelProductos> listaProductos = new ArrayList<>();
                while (rs.next()) {
                    viewModelProductos producto = new viewModelProductos();
                    producto.setIdProducto(rs.getInt("idProducto"));
                    producto.setNombreP(rs.getString("nombreP"));
                    producto.setDescripcionProducto(rs.getString("descripcionProducto"));
                    producto.setPrecio(rs.getDouble("precio"));
                    producto.setIdCategoria(rs.getInt("idCategoria"));
                    producto.setCategoria(rs.getString("categoria"));
                    producto.setDetalles(rs.getString("detalles"));
                    producto.setIdStok(rs.getInt("idStok"));
                    producto.setCantidadStok(rs.getInt("cantidadStok"));
                    producto.setDescripcionStok(rs.getString("descripcionStok"));
                    listaProductos.add(producto);

                }               
                request.setAttribute("listaProductos", listaProductos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarProducto(HttpServletRequest request, HttpServletResponse response) {
       //CAPTURA DE VARIABLES
        String nombreP = request.getParameter("nombreP");
        String descripcionProducto = request.getParameter("descripcionProducto");
        String precio = request.getParameter("precio");
        String idCategoria = request.getParameter("idCategoria");
        String idStok = request.getParameter("idStok");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Productos values (?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreP);
                pstmt.setString(2, descripcionProducto);
                pstmt.setString(3, precio);
                pstmt.setString(4, idCategoria);
                pstmt.setString(5, idStok);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de actualizacion de registros (UPDATE)
    public void modificarProducto(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Producto = request.getParameter("idProducto");
        String nombreP = request.getParameter("nombreP");
        String descripcionProducto = request.getParameter("descripcionProducto");
        String precio = request.getParameter("precio");
        String idCategoria = request.getParameter("idCategoria");
        String idStok = request.getParameter("idStok");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "update Productos set "
                 + "nombreP='"+nombreP+"', "
                 + "descripcion='"+descripcionProducto+"', "
                 + "precio='"+precio+"', "
                 + "idCategoria='"+idCategoria+"', " 
                 + "idStok='"+idStok+"'"
                 + "where idProducto='"+ID_Producto+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de eliminacion de registros (DELETE)
    public void eliminarProducto(HttpServletRequest request, HttpServletResponse response) {
        String ID_Producto = request.getParameter("idProducto");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Productos where idProducto ='" + ID_Producto + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //pedidos
    public void mostrarPedido(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaPedidos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<viewModelPedidos> listaPedidos = new ArrayList<>();
                while (rs.next()) {
                    viewModelPedidos pedido = new viewModelPedidos();
                    pedido.setIdPedido(rs.getInt("idPedido"));
                    pedido.setFechaPedido(rs.getDate("fechaPedido"));
                    pedido.setFechaRecibido(rs.getDate("fechaRecibido"));
                    pedido.setComentario(rs.getString("comentario"));
                    pedido.setIdProveedor(rs.getInt("idProveedor"));
                    pedido.setProveedor(rs.getString("Proveedor"));
                    listaPedidos.add(pedido);

                }               
                request.setAttribute("listaPedidos", listaPedidos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarPedido(HttpServletRequest request, HttpServletResponse response) {
       //CAPTURA DE VARIABLES
        String idProveedor = request.getParameter("idProveedor");
        String fechaRecibido = request.getParameter("fechaRecibido");
        String comentario = request.getParameter("comentario");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Pedidos values (?, GETDATE(), ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, idProveedor);
                pstmt.setString(2, fechaRecibido);
                pstmt.setString(3, comentario);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de actualizacion de registros (UPDATE)
    public void modificarPedido(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Pedidoo = request.getParameter("idPedido");
        String idProveedor = request.getParameter("idProveedor");
        String fechaPedido = request.getParameter("fechaPedido");
        String fechaRecibido = request.getParameter("fechaRecibido");
        String comentario = request.getParameter("comentario");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "update Pedidos set "
                 + "idProveedor='"+idProveedor+"', "
                 + "fechaPedido='"+fechaPedido+"', "
                 + "fechaRecibido='"+fechaRecibido+"', "
                 + "comentario='"+comentario+"'"
                 + "where idPedido='"+ID_Pedidoo+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de eliminacion de registros (DELETE)
    public void eliminarPedido(HttpServletRequest request, HttpServletResponse response) {
        String ID_Pedido = request.getParameter("idPedido");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Pedidos where idPedido ='" + ID_Pedido + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //compras
    public void mostrarCompras(HttpServletRequest request, HttpServletResponse response) {
        //String idpedido = request.getParameter("idPedido");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaCompras";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<viewModelCompras> listaCompras = new ArrayList<>();
                while (rs.next()) {
                    viewModelCompras compra = new viewModelCompras();
                    compra.setIDCompra(rs.getInt("idCompra"));
                    compra.setIdpedido(rs.getInt("idPedido"));
                    compra.setIdProducto(rs.getInt("idProducto"));
                    compra.setNombreP(rs.getString("nombreP"));
                    compra.setCantidad(rs.getInt("cantidad"));
                    compra.setPrecioUnidad(rs.getDouble("precioUnidad"));
                    compra.setDescuentoUnidad(rs.getDouble("descuetoUnidad"));
                    compra.setComentarios(rs.getString("comentarios"));
                    listaCompras.add(compra);

                }               
                request.setAttribute("listaCompras", listaCompras);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public void agregarCompra(HttpServletRequest request, HttpServletResponse response) {
       //CAPTURA DE VARIABLES
        String idproducto = request.getParameter("idProducto");
        String idpedido = request.getParameter("idPedido");
        String cantidad = request.getParameter("cantidad");
        String precioUnidad = request.getParameter("precioUnidad");
        String descuentoUnidad = request.getParameter("descuentoUnidad");
        String comentario = request.getParameter("comentarios");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Compras values (?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, idproducto);
                pstmt.setString(2, idpedido);
                pstmt.setString(3, cantidad);
                pstmt.setString(4, precioUnidad);
                pstmt.setString(5, descuentoUnidad);
                pstmt.setString(6, comentario);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de actualizacion de registros (UPDATE)
    public void modificarCompra(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Compra = request.getParameter("idCompra");
        String idproducto = request.getParameter("idProducto");
        String idpedido = request.getParameter("idPedido");
        String cantidad = request.getParameter("cantidad");
        String precioUnidad = request.getParameter("precioUnidad");
        String descuentoUnidad = request.getParameter("descuentoUnidad");
        String comentario = request.getParameter("comentarios");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "update Compras set "
                 + "idproducto='"+idproducto+"', "
                 + "idpedido='"+idpedido+"', "
                 + "cantidad='"+cantidad+"', "
                 + "precioUnidad='"+precioUnidad+"', "
                 + "descuetoUnidad='"+descuentoUnidad+"' ,"
                 + "comentarios='"+comentario+"' "
                 + "where IDCompra='"+ID_Compra+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    //Funciones de eliminacion de registros (DELETE)
    public void eliminarCompra(HttpServletRequest request, HttpServletResponse response) {
        String ID_Compra = request.getParameter("idCompra");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Compras where IDCompra ='" + ID_Compra + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
    public void mostrarCargos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Cargos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelCargo> listaCargos = new ArrayList<>();
                while (rs.next()) {
                    ViewModelCargo cargo = new ViewModelCargo();
                    cargo.setIdCargo(rs.getInt("idCargo"));
                    cargo.setCargo(rs.getString("cargo"));
                    listaCargos.add(cargo);
                }
                request.setAttribute("listaCargos", listaCargos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
     public void agregarCargo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los cargos es autoincrementable
        String cargo = request.getParameter("cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Cargos values (?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, cargo);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
     public void modificarCargo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String idCargo = request.getParameter("idCargo");
        String cargo = request.getParameter("cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Cargos set "
                        + "cargo='" + cargo + "' "
                        + "where idCargo='" + idCargo + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
     public void eliminarCargo(HttpServletRequest request, HttpServletResponse response) {
        String idCargo = request.getParameter("idCargo");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Cargos where idCargo='" + idCargo + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
     public void mostrarDirecciones(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "SELECT * FROM VistaDireccionCompleta;";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelDirecciones> listaDireccion = new ArrayList<>();

                while (rs.next()) {
                    ViewModelDirecciones direccion = new ViewModelDirecciones();
                    direccion.setIdDireccion(rs.getInt("idDireccion"));
                    direccion.setLinea1(rs.getString("linea1"));
                    direccion.setLinea2(rs.getString("linea2"));
                    direccion.setCodigoPostal(rs.getString("codigoPostal"));
                    direccion.setDistrito(rs.getString("distrito"));
                    direccion.setMunicipio(rs.getString("municipio"));
                    direccion.setDepartamento(rs.getString("departamento"));
                    direccion.setPais(rs.getString("pais"));

                    listaDireccion.add(direccion);

                    
                    // Añadir logs o impresiones para otros campos si es necesario
                }
                request.setAttribute("listaDireccion", listaDireccion);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
     public void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaUsusarios";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelUsuarios> listaUsuarios = new ArrayList<>();
                while (rs.next()) {
                    ViewModelUsuarios usuario = new ViewModelUsuarios();
                    usuario.setIdUsuario(rs.getInt("idUsuario"));
                    usuario.setNombresEmpleado(rs.getString("nombresEmpleado"));
                    usuario.setApellidosEmpleado(rs.getString("apellidosEmpleado"));
                    usuario.setMombreRol(rs.getString("mombreRol"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setClave(rs.getString("clave"));
                    listaUsuarios.add(usuario);
              
                }
                request.setAttribute("listaUsuarios", listaUsuarios);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
     
     public void mostrarCategorias(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from CategoriasProductos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelCategorias> listaCategorias = new ArrayList<>();
                while (rs.next()) {
                    ViewModelCategorias categorias = new ViewModelCategorias();
                    categorias.setIdCategoria(rs.getInt("idCategoria"));
                    categorias.setCategoria(rs.getString("categoria"));
                    categorias.setDetalles(rs.getString("detalles"));
                    listaCategorias.add(categorias);
                }               
                request.setAttribute("listaCategorias", listaCategorias);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
     
     public void agregarCategoria(HttpServletRequest request, HttpServletResponse response) {
        String categoria = request.getParameter("categoria");
        String detalles = request.getParameter("detalles");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into CategoriasProductos values (?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, categoria);
                pstmt.setString(2, detalles);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
     public void modificarCategoria(HttpServletRequest request, HttpServletResponse response) {
        ///CAPTURA DE VARIABLES
        String idCategoria = request.getParameter("idCategoria");
        String categoria = request.getParameter("categoria");
        String detalles = request.getParameter("detalles");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "UPDATE CategoriasProductos "
                        + "SET detalles = '"+detalles+"'," 
                        + "categoria = '"+categoria+"'" 
                        + "WHERE idCategoria = '"+idCategoria+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
    public void eliminarCategoria(HttpServletRequest request, HttpServletResponse response) {
        String idCategoria = request.getParameter("idCategoria");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from CategoriasProductos where idCategoria= '"+idCategoria+"'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
     public void mostrarStok(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from DetallesStok";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelStok> listaStok = new ArrayList<>();
                while (rs.next()) {
                    ViewModelStok stok = new ViewModelStok();
                    stok.setIdStok(rs.getInt("idStok"));
                    stok.setCantidadStok(rs.getString("cantidadStok"));
                    stok.setDescripcion(rs.getString("descripcion"));
                    listaStok.add(stok);
                }               
                request.setAttribute("listaStok", listaStok);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
     
    public void agregarStok(HttpServletRequest request, HttpServletResponse response) {
        String cantidadStok = request.getParameter("cantidadStok");
        String descripcion = request.getParameter("descripcion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into DetallesStok values (?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, cantidadStok);
                pstmt.setString(2, descripcion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
    public void modificarStok(HttpServletRequest request, HttpServletResponse response) {
        ///CAPTURA DE VARIABLES
        String idStok = request.getParameter("idStok");
        String cantidadStok = request.getParameter("cantidadStok");
        String descripcion = request.getParameter("descripcion");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "UPDATE DetallesStok "
                        + "SET descripcion = '"+descripcion+"'," 
                        + "cantidadStok = '"+cantidadStok+"'" 
                        + "WHERE idStok = '"+idStok+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
     public void eliminarStok(HttpServletRequest request, HttpServletResponse response) {
        String idStok = request.getParameter("idStok");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from DetallesStok where idStok='" + idStok + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
     
     public void mostrarFacturas(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaFactura";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelFacturas> listaFacturas = new ArrayList<>();
                while (rs.next()) {
                    ViewModelFacturas factura = new ViewModelFacturas();
                    factura.setIdDetalles(rs.getInt("idDetalles"));
                    factura.setCliente(rs.getString("cliente"));
                    factura.setEmpleado(rs.getString("empleado"));
                    factura.setFechaFactura(rs.getDate("fechaFactura"));
                    factura.setComentario(rs.getString("comentario"));
                    factura.setIdFactura(rs.getInt("idFactura"));
                    factura.setIdProducto(rs.getInt("idProducto"));
                    factura.setNombrep(rs.getString("nombrep"));
                    factura.setPrecio(rs.getString("precio"));
                    factura.setCantidad(rs.getString("cantidad"));
                    factura.setIva(rs.getString("iva"));
                    factura.setDescuento(rs.getString("descuento"));
                    factura.setIdCliente(rs.getInt("idCliente"));
                    
                    factura.setIdEmpleado(rs.getInt("idEmpleado"));
                  
                    listaFacturas.add(factura);
                }               
                request.setAttribute("listaFacturas", listaFacturas);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        
        if (accion == null) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
        else if (accion.equals("Login")) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
        else if (accion.equals("GestionEmpleados")) {
            mostrarEmpleados(request, response);
            request.getRequestDispatcher("/acciones/empleado/gestionarEmpleados.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarEmpleado")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/empleado/agregarEmpleado.jsp").forward(request, response);
        }
        else if (accion.equals("GestionClientes")) {
            mostrarClientes(request, response);
            request.getRequestDispatcher("/acciones/cliente/gestionarClientes.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarCliente")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/cliente/agregarCliente.jsp").forward(request, response);
        }
        else if (accion.equals("GestionProveedor")) {
            mostrarProveedores(request, response);
            request.getRequestDispatcher("/acciones/proveedor/gestionarProveedor.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarProveedor")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/proveedor/agregarProveedor.jsp").forward(request, response);
        }
        else if (accion.equals("GestionProducto")) {
            mostrarProductos(request, response);
            request.getRequestDispatcher("/acciones/producto/gestionarProducto.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarProducto")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/producto/agregarProducto.jsp").forward(request, response);
        }
        else if (accion.equals("GestionPedido")) {
            mostrarPedido(request, response);
            request.getRequestDispatcher("/acciones/pedidos/gestionarPedido.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarPedido")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/pedidos/agregarPedido.jsp").forward(request, response);
        }
        else if (accion.equals("GestionCompra")) {
            mostrarCompras(request, response);
            request.getRequestDispatcher("/acciones/compra/gestionarCompra.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarCompra")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/compra/agregarCompra.jsp").forward(request, response);
        }
        else if (accion.equals("GestionarCargos")) {
            mostrarCargos(request, response);
            request.getRequestDispatcher("/acciones/cargos/gestionarCargo.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarCargo")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/cargos/agregarCargo.jsp").forward(request, response);
        }
        
        else if (accion.equals("MostrarDirecciones")) {
            mostrarDirecciones(request, response);
            request.getRequestDispatcher("/acciones/Direcciones/gestionarDirecciones.jsp").forward(request, response);
        }
        else if (accion.equals("MostrarUsuarios")) {
            mostrarUsuarios(request, response);
            request.getRequestDispatcher("/acciones/usuarios/gestionarUsuarios.jsp").forward(request, response);
        }
        else if (accion.equals("GestionarCategorias")) {
            mostrarCategorias(request, response);
            request.getRequestDispatcher("/acciones/categorias/gestionarCategorias.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarCategoria")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/categorias/agregarCategoria.jsp").forward(request, response);
        }
        
        else if (accion.equals("GestionarStok")) {
            mostrarStok(request, response);
            request.getRequestDispatcher("/acciones/stok/gestionarStok.jsp").forward(request, response);
        }
        else if (accion.equals("AgregarStok")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("/acciones/stok/agregarStok.jsp").forward(request, response);
        }
        else if (accion.equals("GestionarFactura")) {
            mostrarFacturas(request, response);
            request.getRequestDispatcher("/acciones/facturas/gestionarFacturas.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if (accion.equals("Login")) {
            String user = request.getParameter("tfUser");
            String pass = request.getParameter("tfPass");
            
            try(PrintWriter print = response.getWriter()){
                if (user.equals("admin") && pass.equals("root")) {
                    request.getRequestDispatcher("paneles/panelDeControl.jsp").forward(request, response);
                }else{
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Logi WES</title>");
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h1>ERROR: USUARIO O CONTRASEÑA INCORRECTOS...</h1>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }
        
        //CAPTURA DE DATOS ENVIADOS POR POST
        if (accion.equals("AgregarEmpleado")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarEmpleado(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEmpleado");
        } else if (accion.equals("ModificarEmpleado")) {
            modificarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionEmpleados");
        } else if (accion.equals("EliminarEmpleado")) {
            eliminarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionEmpleados");
        } else if (accion.equals("AgregarCliente")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarCliente(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCliente");
        } else if (accion.equals("ModificarCliente")) {
            modificarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionClientes");
        } else if (accion.equals("EliminarCliente")) {
            eliminarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionClientes");
        } else if (accion.equals("AgregarProveedor")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarProveedor(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarProveedor");
        } else if (accion.equals("ModificarProveedor")) {
            modificarProveedor(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionProveedor");
        } else if (accion.equals("EliminarProveedor")) {
            eliminarProveedor(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionProveedor");
        } else if (accion.equals("AgregarProducto")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarProducto(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarProducto");
        } else if (accion.equals("ModificarProducto")) {
            modificarProducto(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionProducto");
        } else if (accion.equals("EliminarProducto")) {
            eliminarProducto(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionProducto");
        } else if (accion.equals("AgregarPedido")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarPedido(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarPedido");
        } else if (accion.equals("ModificarPedido")) {
            modificarPedido(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionPedido");
        } else if (accion.equals("EliminarPedido")) {
            eliminarPedido(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionPedido");
        } else if (accion.equals("AgregarCompra")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarCompra(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCompra");
        } else if (accion.equals("ModificarCompra")) {
            modificarCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionCompra");
        } else if (accion.equals("EliminarCompra")) {
            eliminarCompra(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionCompra");
        } else if (accion.equals("AgregarCargo")) {
            agregarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCargo");
        } else if (accion.equals("ModificarCargo")) {
            modificarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCargos");
        } else if (accion.equals("EliminarCargo")) {
            eliminarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCargos");
        } else if (accion.equals("AgregarCategoria")) {
            agregarCategoria(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCategoria");
        } else if (accion.equals("ModificarCategoria")) {
            modificarCategoria(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCategorias");
        } else if (accion.equals("EliminarCategoria")) {
            eliminarCategoria(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCategorias");
        } else if (accion.equals("AgregarStok")) {
            agregarStok(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarStok");
        } else if (accion.equals("ModificarStok")) {
            modificarStok(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarStok");
        } else if (accion.equals("EliminarStok")) {
            eliminarStok(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarStok");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
