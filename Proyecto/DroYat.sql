use master
create database DorgueYat

use DorgueYat

create table Pedido
 (
	IdPedido int not null,
	IdCliente int  null,
  	Descripcion varchar(100)  null,
    Fecha_pedido varchar(30)  null,
	Fecha_entrega varchar(30)  null,
    Destinatario varchar(60)  null,
	Direccion_destinatario varchar(100)  null,
	Sub_total decimal(12,2) null,
	Iva decimal(12,2)  null,
	Total decimal(12,2),

)

create table DetallesPedido
(
  IdDetalle int IDENTITY (1,1) not null,
  IdMedicamento int  null,
  IdPedido int null,
  Uni_Formuladas int  null,
  ValorTotal decimal (12,2)  null,


)

create table Medicamento
(
IdMedicamento int not null,
Unidades_existencia int  null,
Nombre varchar(60)  null,
Lote varchar (60) null,
Fabricante varchar(60)  null,
Cantidad varchar(60)  null,
Precio_unidad decimal(12,2)  null,

)

create table Cliente
(
IdCliente int not null,
Nombre varchar(60)  null,
Apellido varchar(60) null,
Telefono varchar(60)  null,
Direccion varchar(60)  null,
Email varchar(60)  null,
Usuario varchar(70)  null,
Contrasena varchar(70)  null,
)


--Agregar claves primarias

ALTER TABLE DetallesPedido
ADD CONSTRAINT DetallesPedido_Pk PRIMARY KEY (IdDetalle)

ALTER TABLE Cliente
ADD CONSTRAINT Cliente_Pk PRIMARY KEY (IdCliente)

ALTER TABLE Pedido
ADD CONSTRAINT Pedido_Pk PRIMARY KEY (IdPedido)


ALTER TABLE Medicamento
ADD CONSTRAINT Medicamento_Pk PRIMARY KEY (IdMedicamento)


--Agregar claves foraneas

 ALTER TABLE Pedido
 ADD CONSTRAINT Pedido_FK FOREIGN KEY (IdCliente)
 REFERENCES Cliente(IdCliente)


 ALTER TABLE DetallesPedido
 ADD CONSTRAINT DetallesPedido_Fk FOREIGN KEY (IdPedido)
 REFERENCES Pedido(IdPedido)

 ALTER TABLE DetallesPedido
 ADD CONSTRAINT DetallesPedido1_Fk FOREIGN KEY (IdMedicamento)
 REFERENCES Medicamento(IdMedicamento)


 --Proceso almacenado Cliente

CREATE PROCEDURE USP_GUARDAR_CLI
  @IdCliente int,
  @Nombre varchar(60),
  @Apellido varchar(60),
  @Telefono varchar(60),
  @Direccion varchar(60),
  @Email varchar(60),
  @Usuario varchar(70),
  @Contrasena varchar(70)
AS
BEGIN
  INSERT INTO Cliente(IdCliente,Nombre,Apellido,Telefono,Direccion,Email,Usuario,Contrasena)
  VALUES (@IdCliente,@Nombre,@Apellido,@Telefono,@Direccion,@Email,@Usuario,@Contrasena)
END



--PROBAR EL PROCEDIMIENTO
EXECUTE USP_GUARDAR_CLI '1','PEDRO','CARDONA','3243','cr 13 16 30','ejemplo1@gmailcom','Pedro_C', '8877441'
EXECUTE USP_GUARDAR_CLI '2','Ana','Castro','3243','cr 13 16 30','ejemplo2@gmailcom','Castro_A', '8877441'
EXECUTE USP_GUARDAR_CLI '3','Juan','Castro','3243','cr 13 16 30','ejemplo3@gmailcom','JuCastr', '8877441'
EXECUTE USP_GUARDAR_CLI '4','Jonathan','Yate','3243','cr 13 16 30','ejemplo4@gmailcom','Jonathan_Y', '8877441'
EXECUTE USP_GUARDAR_CLI '5','Ivette','Sanchez','3243','cr 13 16 30','ejemplo5@gmailcom','Ivi', '8877441'
EXECUTE USP_GUARDAR_CLI '6','Olga','Daconte','3243','cr 13 16 30','ejemplo6@gmailcom','Olga', '8877441'
EXECUTE USP_GUARDAR_CLI '7','Luis','Ramiez','3243','cr 13 16 30','ejemplo7@gmailcom','Luis', '8877441'
EXECUTE USP_GUARDAR_CLI '8','Hector','Tovar','3243','cr 13 16 30','ejemplo8@gmailcom','Hector', '8877441'
EXECUTE USP_GUARDAR_CLI '9','David','Baldovino','3243','cr 13 16 30','ejemplo9@gmailcom','Davo', '8877441'



select * from Cliente



--ACTUALIZAR cliente
CREATE PROCEDURE USP_ACTUALIZAR_CLI

  @IdCliente int,
  @Nombre varchar(60),
  @Apellido varchar(60),
  @Telefono varchar(60),
  @Direccion varchar(60),
  @Usuario varchar(70),
  @Contrasena varchar(70)

  AS
BEGIN
  UPDATE  Cliente SET Nombre=@Nombre, Apellido= @Apellido,Telefono=@Telefono,Direccion=@Direccion,Usuario= @Usuario, Contrasena=@Contrasena
  WHERE idCliente=@IdCliente
END


EXECUTE USP_ACTUALIZAR_CLI'3','Isabel','Melo','3243','cr 13 16 30','Isable_Mel','32014568'
select * from Cliente


-- ELIMINAR cliente
CREATE PROCEDURE USP_ELIMINAR_CLI
 @IdCliente int
AS
BEGIN
  DELETE FROM Cliente WHERE  IdCliente= @IdCliente
END

EXECUTE USP_ELIMINAR_CLI'1'

select * from Cliente


--CONSULTAR UN Cliente
CREATE PROCEDURE USP_CONSULTAR_CLI
   @IdCliente int
AS
BEGIN
 SELECT * FROM Cliente  WHERE IdCliente=@IdCliente
END

EXECUTE USP_CONSULTAR_CLI '3'

--LISTAR LOS Cliente
CREATE PROCEDURE USP_LISTAR_CLI
 AS
BEGIN
 SELECT * FROM Cliente  
END

EXECUTE USP_LISTAR_CLI


--Procedimiento Almacenado Medicamento

CREATE PROCEDURE USP_GUARDAR_ME
    @IdMedicamento int,
    @Unidades_existencia int,
    @Nombre varchar(60),
    @Lote varchar (60),
    @Fabricante varchar(60),
    @Cantidad varchar(60),
    @Precio_unidad decimal(12,2)
  	
AS
BEGIN
  INSERT INTO Medicamento(IdMedicamento,Unidades_existencia,Nombre,Lote,Fabricante,Cantidad,Precio_unidad)
  VALUES (@IdMedicamento, @Unidades_existencia, @Nombre,@Lote,@Fabricante,@Cantidad,@Precio_unidad)
END


EXECUTE USP_GUARDAR_ME '1','100','Acetaminofen','741258','American Generic','12','1000'
EXECUTE USP_GUARDAR_ME '2','100','ibuprofeno','895623','MK','12','5000'
EXECUTE USP_GUARDAR_ME '3','50','Losartan','963214','Genfar','8','4000'
EXECUTE USP_GUARDAR_ME '4','50','Dipirona','0014785','Vitalis','5','10000'
EXECUTE USP_GUARDAR_ME '5','50','Loratadina','0014785','Vitalis','5','10000'
EXECUTE USP_GUARDAR_ME '6','50','Calcio','0014785','Vitalis','5','1000'
EXECUTE USP_GUARDAR_ME '7','50','Condones','0014785','Vitalis','5','1000'
EXECUTE USP_GUARDAR_ME '8','50','Aspirina','0014785','Vitalis','5','1000'

select * from Medicamento


--ACTUALIZAR Medicamento
CREATE PROCEDURE USP_ACTUALIZAR_ME
 	    @IdMedicamento int,
    @Unidades_existencia int,
    @Nombre varchar(60),
    @Lote varchar (60),
    @Fabricante varchar(60),
    @Cantidad varchar(60),
    @Precio_unidad decimal(12,2)
AS
BEGIN
  UPDATE  Medicamento SET Unidades_existencia= @Unidades_existencia,Nombre=@Nombre,Lote=@Lote,Fabricante=@Fabricante,Cantidad=@Cantidad,Precio_unidad=@Precio_unidad
  WHERE IdMedicamento=@IdMedicamento
END

EXECUTE USP_ACTUALIZAR_ME'1','200','Acetaminofen','741258','American Generic','12', '1500'
select * from Medicamento

-- ELIMINAR Medicamento
CREATE PROCEDURE USP_ELIMINAR_ME
 @IdMedicamento int
AS
BEGIN
  DELETE FROM Medicamento WHERE  IdMedicamento=@IdMedicamento
END

EXECUTE USP_ELIMINAR_ME'4'

select * from Medicamento

--CONSULTAR Medicamento
CREATE PROCEDURE USP_CONSULTAR_ME
   @IdMedicamento int
AS
BEGIN
 SELECT * FROM Medicamento  WHERE IdMedicamento=@IdMedicamento
END

EXECUTE USP_CONSULTAR_ME '3'

--LISTAR LOS Medicamento
CREATE PROCEDURE USP_LISTAR_ME
 AS
BEGIN
 SELECT * FROM Medicamento 
END

EXECUTE USP_LISTAR_Me


--Procedimiento Almacenado Pedido

CREATE PROCEDURE USP_GUARDAR_PE
    @IdPedido int,
	@IdCliente int,
  	@Descripcion varchar(100),
    @Fecha_pedido varchar(30),
	@Fecha_entrega varchar(30),
    @Destinatario varchar(60),
	@Direccion_destinatario varchar(100),
	@Sub_total decimal(12,2),
	@Iva decimal(12,2),
	@Total decimal(12,2)
  	
AS
BEGIN
  INSERT INTO Pedido(IdPedido,IdCliente, Descripcion,Fecha_pedido,Fecha_entrega,Destinatario,Direccion_destinatario,Sub_total, Iva, Total)
  VALUES (@IdPedido,@IdCliente, @Descripcion,@Fecha_pedido,@Fecha_entrega,@Destinatario,@Direccion_destinatario,@Sub_total, @Iva, @Total)
END


EXECUTE USP_GUARDAR_PE '001','3','Acetaminofen','16/08/2023','16/08/2023','fernando Perez','cr 4 w 16 33','18000','2880','20880'
EXECUTE USP_GUARDAR_PE '002','4','Ibuprofeno','11/09/2023','11/09/2023','Digna','cl 40 5w 44','60000','9600','69600'
EXECUTE USP_GUARDAR_PE '003','2','Losartan','19/09/2023','19/09/2023','Ana Castro','cr 13 16 30','32000','5120','37120'
EXECUTE USP_GUARDAR_PE '004','6','Calcio','29/09/2023','29/09/2023','Ana Castro','cr 13 16 30','5000','800','5800'
EXECUTE USP_GUARDAR_PE '005','5','Loratadina','19/09/2023','19/09/2023','Ana Castro','cr 13 16 30','50000','8000','58000'
EXECUTE USP_GUARDAR_PE '006','7','Condones','19/09/2023','19/09/2023','Hector','cr 13 16 30','5000','800','5800'
EXECUTE USP_GUARDAR_PE '007','8','Aspirina','19/09/2023','19/09/2023','David','cr 13 16 30','5000','800','5800'

select * from Pedido


--ACTUALIZAR Pedido
CREATE PROCEDURE USP_ACTUALIZAR_PE
 	 @IdPedido int,
	@Descripcion varchar(100),
    @Fecha_pedido varchar(30),
	@Fecha_entrega varchar(30),
    @Destinatario varchar(60),
	@Direccion_destinatario varchar(100),
	@Sub_total decimal(12,2),
	@Iva decimal(12,2),
	@Total decimal(12,2)
AS
BEGIN
  UPDATE  Pedido SET  Descripcion=@Descripcion,Fecha_pedido=@Fecha_pedido, Fecha_entrega=@Fecha_entrega,Destinatario= @Destinatario, Direccion_destinatario= @Direccion_destinatario,Sub_total=  @Sub_total,Iva= @Iva,Total= @Total
  WHERE IdPedido=@IdPedido
END

EXECUTE USP_ACTUALIZAR_PE '001','Acetaminofen','16/08/2023','17/08/2023','fernando Perez','cr 4 w 16 33','18000','2880','20880'
select * from Pedido


-- ELIMINAR Pedido
CREATE PROCEDURE USP_ELIMINAR_PE
 @IdPedido int
AS
BEGIN
  DELETE FROM Pedido WHERE  IdPedido= @IdPedido
END

EXECUTE USP_ELIMINAR_PE'3'

select * from Pedido


--CONSULTAR pedido
CREATE PROCEDURE USP_CONSULTAR_PE
  @IdPedido int
AS
BEGIN
 SELECT * FROM Pedido  WHERE IdPedido=@IdPedido
END

EXECUTE USP_CONSULTAR_PE '2'

--LISTAR LOS Pedidos
CREATE PROCEDURE USP_LISTAR_PE
 AS
BEGIN
 SELECT * FROM Pedido  
END

EXECUTE USP_LISTAR_PE



--DetallesPedido




CREATE PROCEDURE USP_GUARDAR_DE
  @IdMedicamento int,
  @IdPedido int,
  @Uni_Formuladas int,
  @ValorTotal decimal (12,2)
AS
BEGIN
  INSERT INTO DetallesPedido
  VALUES (@IdMedicamento,@IdPedido,@Uni_Formuladas,@ValorTotal)
END
EXECUTE USP_GUARDAR_DE '1','001','12','20880'
EXECUTE USP_GUARDAR_DE '2','002','12','69600'
EXECUTE USP_GUARDAR_DE '8','007','5','5800'
EXECUTE USP_GUARDAR_DE '5','005','5','58000'
EXECUTE USP_GUARDAR_DE '6','004','5','5800'
EXECUTE USP_GUARDAR_DE '7','006','5','5800'

select * from DetallesPedido




 CREATE PROCEDURE USP_ELIMINAR_DE
 @IdDetalle int
AS
BEGIN
  DELETE FROM DetallesPedido WHERE  IdDetalle=@IdDetalle
END

EXECUTE USP_ELIMINAR_DE'1'


 select * from DetallesPedido




 CREATE PROCEDURE USP_CONSULTAR_DE
  @IdDetalle int
AS
BEGIN
 SELECT * FROM DetallesPedido  WHERE IdDetalle=@IdDetalle
END

EXECUTE USP_CONSULTAR_DE '2'





 select idDetalle,Nombre,Lote,Fabricante,Precio_unidad,Fecha_pedido,Fecha_entrega,Destinatario,Direccion_destinatario,Uni_Formuladas,Sub_total,Iva,Total,ValorTotal
  from DetallesPedido inner join Pedido on DetallesPedido.IdPedido=Pedido.IdPedido
 INNER JOIN Medicamento on DetallesPedido.IdMedicamento=Medicamento.IdMedicamento

