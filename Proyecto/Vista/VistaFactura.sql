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
inner join Empleados as emp on f.idempleado = emp.idEmpleado

	select * from VistaFactura