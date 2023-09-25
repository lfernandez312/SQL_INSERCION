-- Crear la base de datos 'cotizador' si no existe o usarla si existe
CREATE DATABASE IF NOT EXISTS `cotizador`;
USE `cotizador`;

-- Eliminar la tabla 'clientes' si existe
DROP TABLE IF EXISTS `clientes`;

-- Crear la tabla 'clientes'
CREATE TABLE `clientes` (
  `id_cliente` int(10) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(50) DEFAULT NULL,
  `nro_documento` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Bloquear la tabla 'clientes' para escritura
LOCK TABLES `clientes` WRITE;

-- Insertar datos en la tabla 'clientes'
INSERT INTO `clientes` VALUES (1,'COMPRA S.A','Leonardo','Hernandez','dni',35321478),(2,'Venta S.A','Leopoldo','Hernandez','dni',35321479);

-- Desbloquear la tabla 'clientes'
UNLOCK TABLES;

-- Eliminar la tabla 'envio' si existe
DROP TABLE IF EXISTS `envio`;

-- Crear la tabla 'envio'
CREATE TABLE `envio` (
  `id_envio` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_envio` varchar(55) NOT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `id_envio` (`id_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Bloquear la tabla 'envio' para escritura
LOCK TABLES `envio` WRITE;

-- Insertar datos en la tabla 'envio'
INSERT INTO `envio` VALUES (1,'Pendiente'),(2,'En proceso'),(3,'Enviado'),(4,'Entregado'),(5,'Cancelado');

-- Desbloquear la tabla 'envio'
UNLOCK TABLES;

-- Eliminar la tabla 'estado' si existe
DROP TABLE IF EXISTS `estado`;

-- Crear la tabla 'estado'
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_estado` varchar(55) NOT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `id_estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Bloquear la tabla 'estado' para escritura
LOCK TABLES `estado` WRITE;

-- Insertar datos en la tabla 'estado'
INSERT INTO `estado` VALUES (1,'Agotado'),(2,'Disponible'),(3,'En reposicion');

-- Desbloquear la tabla 'estado'
UNLOCK TABLES;

-- Eliminar la tabla 'orden_compra' si existe
DROP TABLE IF EXISTS `orden_compra`;

-- Crear la tabla 'orden_compra'
CREATE TABLE `orden_compra` (
  `id_compra` int(10) NOT NULL AUTO_INCREMENT,
  `nro_orden` int(10) DEFAULT NULL,
  `id_producto` int(10) DEFAULT NULL,
  `id_cliente` int(10) DEFAULT NULL,
  `cantidad` int(110) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `precio_venta` int(50) DEFAULT NULL,
  `total_venta` int(50) DEFAULT NULL,
  `envio` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_producto` (`id_producto`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_usuario` (`id_usuario`),
  KEY `envio` (`envio`),
  KEY `estado` (`estado`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `orden_compra_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `orden_compra_ibfk_4` FOREIGN KEY (`envio`) REFERENCES `envio` (`id_envio`) ON UPDATE CASCADE,
  CONSTRAINT `orden_compra_ibfk_5` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Bloquear la tabla 'orden_compra' para escritura
LOCK TABLES `orden_compra` WRITE;

-- Insertar datos en la tabla 'orden_compra'
INSERT INTO `orden_compra` VALUES (1,1,1,1,2,1165259685,'cliente@gmail.com',70000,140000,1,2,'2023-09-25',1),(2,1,2,1,1,1165259685,'cliente@gmail.com',75000,75000,1,2,'2023-09-25',1),(3,1,3,1,1,1165259685,'cliente@gmail.com',72000,72000,1,2,'2023-09-25',1);

-- Desbloquear la tabla 'orden_compra'
UNLOCK TABLES;

-- Eliminar la tabla 'productos' si existe
DROP TABLE IF EXISTS `productos`;

-- Crear la tabla 'productos'
CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL AUTO_INCREMENT,
  `codigo_producto` int(10) DEFAULT NULL,
  `nombre_producto` varchar(150) DEFAULT NULL,
  `modelo_producto` varchar(150) DEFAULT NULL,
  `id_proveedor` int(10) DEFAULT NULL,
  `estado_producto` int(10) DEFAULT NULL,
  `habilitado_producto` int(10) DEFAULT NULL,
  `precio_producto` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Bloquear la tabla 'productos' para escritura
LOCK TABLES `productos` WRITE;

-- Insertar datos en la tabla 'productos'
INSERT INTO `productos` VALUES (1,100,'Zapatillas','ZAPATILLAS ENTRENAMIENTO REEBOK NANO X3 NEGRA',1,1,1,70000),(2,101,'Zapatillas','ZAPATILLAS ENTRENAMIENTO REEBOK NANOFLEX 2.0 NEGRA',1,1,1,75000),(3,102,'Zapatillas','ZAPATILLAS ENTRENAMIENTO REEBOK NANO X3 BLANCA',1,0,0,72000),(4,103,'Zapatillas','ZAPATILLAS RUNNING ADIDAS GALAXY 6 GRIS',3,1,1,78000),(5,104,'Zapatillas','ZAPATILLAS RUNNING ADIDAS DURAMO 10 SL 2.0 MUJER NEGRA',3,1,1,65000),(6,105,'Zapatillas','ZAPATILLAS RUNNING NIKE DOWNSHIFTER 11 MUJER VIOLETA',2,1,1,42000);

-- Desbloquear la tabla 'productos'
UNLOCK TABLES;

-- Eliminar la tabla 'proveedor' si existe
DROP TABLE IF EXISTS `proveedor`;

-- Crear la tabla 'proveedor'
CREATE TABLE `proveedor` (
  `id_proveedor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(50) DEFAULT NULL,
  `nro_documento` int(20) DEFAULT NULL,
  `telefono` int(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `estado` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Bloquear la tabla 'proveedor' para escritura
LOCK TABLES `proveedor` WRITE;

-- Insertar datos en la tabla 'proveedor'
INSERT INTO `proveedor` VALUES (1,'Reebook','cuit',2147483647,1123721368,'reebok@gmail.com',1),(2,'Adidas','cuit',2147483647,1123721369,'Adidas@gmail.com',1),(3,'Nike','cuit',2147483647,1123721370,'Nike@gmail.com',0);

-- Desbloquear la tabla 'proveedor'
UNLOCK TABLES;

-- Eliminar la tabla 'usuarios' si existe
DROP TABLE IF EXISTS `usuarios`;

-- Crear la tabla 'usuarios'
CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `habilitado` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Bloquear la tabla 'usuarios' para escritura
LOCK TABLES `usuarios` WRITE;

-- Insertar datos en la tabla 'usuarios'
INSERT INTO `usuarios` VALUES (1,'Leonel','Fernandez','Prueba1234','lfernandez@gmail.com',1123721368,'Chile 7894,Balvanera',1),(2,'Bautista','Fernandez','Prueba12345','btfernandez@gmail.com',1123721369,'Chile 7895,Balvanera',0);

-- Desbloquear la tabla 'usuarios'
UNLOCK TABLES;
