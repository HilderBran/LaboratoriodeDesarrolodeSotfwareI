-- use tiendaElectronica

create view VistaDireccionCompleta as
select
    DIR.idDireccion,
    DIR.Linea1,
    DIR.Linea2,
	DIS.idDistrito,
    DIS.distrito,
    MUN.municipio,
    DEP.departamento,
    DEP.pais,
    DIR.CodigoPostal
from Direcciones DIR
	inner join Distritos DIS on DIR.idDistrito = DIS.idDistrito
	inner join Municipios MUN on DIS.idMunicipio = MUN.idMunicipio
	inner join Departamentos DEP on MUN.idDepartamento = DEP.idDepartamento;





create view VistaEmpleados as
select
    EMP.idEmpleado,
    EMP.dui,
    EMP.ISSS,
    EMP.NombresEmpleado,
    EMP.ApellidosEmpleado,
    EMP.fechaNacimiento,
    EMP.telefono,
    EMP.eMail,
	EMP.idCargo,
    CAR.cargo,
	EMP.idDireccion,
	DIR.Linea1 + ', ' + DIR.Linea2 + ', ' +
    DIR.Distrito + ', ' + DIR.Municipio + ', ' +
    DIR.Departamento + ', ' + DIR.Pais + ', ' +
	CAST(DIR.CodigoPostal AS char(5)) as DireccionCompleta
from Empleados EMP
	inner join Cargos CAR on EMP.idCargo = CAR.idCargo
	inner join VistaDireccionCompleta DIR on EMP.idDireccion = DIR.idDireccion;



create view VistaClientes as
select
    cli.IDCliente, 
	cli.nombresCliente, 
	cli.apellidosCliente, 
	cli.dui, 
	cli.telefono, 
	cli.eMail,
	cli.idDireccion,
	DIR.Linea1 + ', ' + DIR.Linea2 + ', ' +
    DIR.Distrito + ', ' + DIR.Municipio + ', ' +
    DIR.Departamento + ', ' + DIR.Pais + ', ' +
	CAST(DIR.CodigoPostal AS char(5)) as DireccionCompleta
from Clientes as cli
	inner join VistaDireccionCompleta DIR on cli.idDireccion = DIR.idDireccion;



create view VistaProveedores as
select
    pr.idProveedor, 
	pr.nombresContacto, 
	pr.ApellidosContacto,
	pr.telefono, 
	pr.eMail,
	pr.compania,
	pr.idDireccion,
	DIR.Linea1 + ', ' + DIR.Linea2 + ', ' +
    DIR.Distrito + ', ' + DIR.Municipio + ', ' +
    DIR.Departamento + ', ' + DIR.Pais + ', ' +
	CAST(DIR.CodigoPostal AS char(5)) as DireccionCompleta
from Proveedores as pr
	inner join VistaDireccionCompleta DIR on pr.idDireccion = DIR.idDireccion;


CREATE VIEW VistaProductos AS
SELECT 
	p.idProducto,
	p.nombreP,
	p.descripcion AS descripcionProducto,
	p.precio,
	ca.idCategoria,
	ca.categoria,
	ca.detalles,
	st.idStok,
	st.cantidadStok,
	st.descripcion AS descripcionStok
FROM Productos AS p
INNER JOIN CategoriasProductos AS ca ON p.idCategoria = ca.idCategoria
INNER JOIN DetallesStok AS st ON p.idStok = st.idStok;


create view VistaPedidos as
select 
	p.idPedido, 
	p.fechaPedido,
	p.fechaRecibido, 
	p.comentario,
	pr.idProveedor,
	pr.nombresContacto+' '+pr.ApellidosContacto as Proveedor
from Pedidos as p
INNER JOIN Proveedores as pr on p.idProveedor = pr.idProveedor;


create view VistaCompras as 
select 
	c.IDCompra,
	c.idpedido,
	p.idProducto,
	p.nombreP,
	c.cantidad,
	c.precioUnidad,
	c.descuetoUnidad,
	c.comentarios
from Compras as c
INNER JOIN Productos AS	p on c.idproducto = p.idProducto;


create view VistaUsusarios as 
select 
	u.IDUsuario, 
	u.usuario, 
	u.clave, 
	e.nombresEmpleado, 
	e.apellidosEmpleado, 
	r.mombreRol 
from Usuarios as u
	INNER JOIN Empleados as e on u.idEmpleado = e.idEmpleado
	INNER JOIN Roles as r on u.idRol = r.idRol;


create view VistaFactura as
select 
	df.idDetalles,
	df.idFactura,
	df.idProducto,
	f.fechaFactura,
	f.comentario,
	p.nombreP,
	p.precio,
	df.cantidad,
	df.iva,
	df.descuento,
	f.idcliente,
	c.nombresCliente + '' + c.apellidosCliente as Cliente,
	f.idempleado,
	emp.nombresEmpleado + '' + emp.apellidosEmpleado as Empleado
from DetallesFacturas df
inner join Productos as p on df.idProducto = p.idProducto
inner join Facturas as f on df.idFactura = f.idFactura
inner join Clientes as c on f.idcliente = c.IDCliente
inner join Empleados as emp on f.idempleado = emp.idEmpleado;