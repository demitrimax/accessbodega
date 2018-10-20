/*
 Navicat Premium Data Transfer

 Source Server         : localmariadb
 Source Server Type    : MariaDB
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : bodegajc

 Target Server Type    : MariaDB
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 17/10/2018 07:08:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cat_productos
-- ----------------------------
DROP TABLE IF EXISTS `cat_productos`;
CREATE TABLE `cat_productos`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Descripción` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `StockMin` int(11) NULL DEFAULT NULL,
  `UMedida` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PrecioVentaCliente` decimal(19, 4) NULL DEFAULT NULL,
  `ExcentoDescuento` tinyint(1) NULL DEFAULT NULL,
  `P25` decimal(19, 4) NULL DEFAULT NULL,
  `P29` decimal(19, 4) NULL DEFAULT NULL,
  `P30` decimal(19, 4) NULL DEFAULT NULL,
  `P35` decimal(19, 4) NULL DEFAULT NULL,
  `P40` decimal(19, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `Identificador` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCompleto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `username` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contraseña` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rol` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Identificador`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cat_descuentos
-- ----------------------------
DROP TABLE IF EXISTS `cat_descuentos`;
CREATE TABLE `cat_descuentos`  (
  `id` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nombre` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `caption` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

INSERT INTO `cat_descuentos`(`id`, `nombre`, `caption`) VALUES ('P25', '25% descuento', '25%');
INSERT INTO `cat_descuentos`(`id`, `nombre`, `caption`) VALUES ('P29', '29% descuento', '29%');
INSERT INTO `cat_descuentos`(`id`, `nombre`, `caption`) VALUES ('P30', '30% descuento', '25%');
INSERT INTO `cat_descuentos`(`id`, `nombre`, `caption`) VALUES ('P35', '35% descuento', '35%');
INSERT INTO `cat_descuentos`(`id`, `nombre`, `caption`) VALUES ('P40', '40% descuento', '40%');


-- ----------------------------
-- Table structure for cat_clientes
-- ----------------------------
DROP TABLE IF EXISTS `cat_clientes`;
CREATE TABLE `cat_clientes`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RFC` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DescuentoAdicional` float NULL DEFAULT NULL,
  `Descuento` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user` int(11) NULL DEFAULT NULL,
  `eliminado` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `id_cliente`(`Id`) USING BTREE
  ) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for cat_precios
-- ----------------------------
DROP TABLE IF EXISTS `cat_precios`;
CREATE TABLE `cat_precios`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Id_cliente` int(11) NOT NULL,
  `id_Producto` int(11) NOT NULL,
  `Precio` decimal(19, 4) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `usuariomod`(`user_id`) USING BTREE,
  INDEX `clientedat`(`Id_cliente`) USING BTREE,
  INDEX `datproducto`(`id_Producto`) USING BTREE,
  CONSTRAINT `clientedat` FOREIGN KEY (`Id_cliente`) REFERENCES `cat_clientes` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `datproducto` FOREIGN KEY (`id_Producto`) REFERENCES `cat_productos` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuariomod` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`Identificador`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for cat_proveedores
-- ----------------------------
DROP TABLE IF EXISTS `cat_proveedores`;
CREATE TABLE `cat_proveedores`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RFC` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for datos_tienda
-- ----------------------------
DROP TABLE IF EXISTS `datos_tienda`;
CREATE TABLE `datos_tienda`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NombreTienda` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Telefonos` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IdUnico` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permiso` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_usuario` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `usuario`(`id_usuario`) USING BTREE,
  INDEX `IdUnico`(`IdUnico`) USING BTREE,
  CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Identificador`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `IdV` int(11) NOT NULL AUTO_INCREMENT,
  `FechaV` datetime(0) NOT NULL,
  `Clave_Cliente` int(11) NOT NULL,
  `SubtotalV` decimal(19, 4) NULL DEFAULT NULL,
  `DescuentoV` decimal(19, 4) NULL DEFAULT NULL,
  `Total` decimal(19, 4) NOT NULL,
  `EnvasesVacios` int(11) NULL DEFAULT NULL,
  `Pendiente` tinyint(1) NULL DEFAULT NULL,
  `Condicion` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Cancelada` tinyint(1) NOT NULL DEFAULT 0,
  `user` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IdV`) USING BTREE,
  INDEX `id_venta`(`IdV`) USING BTREE,
  INDEX `cliente`(`Clave_Cliente`) USING BTREE,
  INDEX `userid`(`user_id`) USING BTREE,
  CONSTRAINT `cliente` FOREIGN KEY (`Clave_Cliente`) REFERENCES `cat_clientes` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`Identificador`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4159 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for det_ventas
-- ----------------------------
DROP TABLE IF EXISTS `det_ventas`;
CREATE TABLE `det_ventas`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClaveVenta` int(11) NOT NULL,
  `ClaveProdV` int(11) NOT NULL,
  `CantidadV` int(11) NOT NULL,
  `PrecioV` decimal(19, 4) NOT NULL,
  `ImporteV` decimal(19, 4) NOT NULL,
  `Fecha` datetime(0) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `ClaveVenta`(`ClaveVenta`) USING BTREE,
  INDEX `producto`(`ClaveProdV`) USING BTREE,
  CONSTRAINT `nota_venta` FOREIGN KEY (`ClaveVenta`) REFERENCES `ventas` (`IdV`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `producto` FOREIGN KEY (`ClaveProdV`) REFERENCES `cat_productos` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11543 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mov_inventario
-- ----------------------------
DROP TABLE IF EXISTS `mov_inventario`;
CREATE TABLE `mov_inventario`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Producto` int(11) NOT NULL,
  `Tipo_Operacion` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Cantidad` int(11) NULL DEFAULT NULL,
  `Precio` decimal(19, 4) NULL DEFAULT NULL,
  `Fecha` datetime(0) NULL DEFAULT NULL,
  `Referencia` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `producto_id`(`Id_Producto`) USING BTREE,
  INDEX `usuario_id_1`(`usuario_id`) USING BTREE,
  CONSTRAINT `producto_id` FOREIGN KEY (`Id_Producto`) REFERENCES `cat_productos` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuario_id_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`Identificador`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for movimientos
-- ----------------------------
DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE `movimientos`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FechaHora` datetime(0) NULL DEFAULT NULL,
  `Descripcion` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TMov` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Referencia` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Monto` decimal(19, 4) NULL DEFAULT NULL,
  `Cancelada` tinyint(1) NULL DEFAULT 0,
  `usuario` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `usuarioid2`(`usuario_id`) USING BTREE,
  CONSTRAINT `usuarioid2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`Identificador`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2474 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reporte_financiero
-- ----------------------------
DROP TABLE IF EXISTS `reporte_financiero`;
CREATE TABLE `reporte_financiero`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `tienda_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Unico Registro de Tienda',
  `NomTienda` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Operacion` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Monto` decimal(19, 4) NULL DEFAULT NULL,
  `registrounico` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cancelado` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tiendaid`(`tienda_id`) USING BTREE,
  CONSTRAINT `tiendaid` FOREIGN KEY (`tienda_id`) REFERENCES `datos_tienda` (`IdUnico`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reporte_inventario
-- ----------------------------
DROP TABLE IF EXISTS `reporte_inventario`;
CREATE TABLE `reporte_inventario`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime(0) NULL DEFAULT NULL,
  `IdTienda` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `registrounicodia` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_producto` int(11) NULL DEFAULT NULL,
  `saldo_inicial` int(11) NULL DEFAULT NULL,
  `entradas` int(11) NULL DEFAULT NULL,
  `cant_acum` int(11) NULL DEFAULT NULL,
  `salidas` int(11) NULL DEFAULT NULL,
  `stockreal` int(11) NULL DEFAULT NULL,
  `usuario_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `producto`(`id_producto`) USING BTREE,
  INDEX `usuarioid`(`usuario_id`) USING BTREE,
  CONSTRAINT `productoid` FOREIGN KEY (`id_producto`) REFERENCES `cat_productos` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuarioid` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`Identificador`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2652 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;


-- ----------------------------
-- View structure for v_movinvent_entradas
-- ----------------------------
DROP VIEW IF EXISTS `v_movinvent_entradas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_movinvent_entradas` AS SELECT cat_productos.Id, cat_productos.Nombre, Sum(mov_inventario.Cantidad) AS Entradas
FROM mov_inventario RIGHT JOIN cat_productos ON mov_inventario.Id_Producto = cat_productos.Id
AND mov_inventario.Tipo_Operacion="Entrada"
GROUP BY cat_productos.Id, cat_productos.Nombre ;

-- ----------------------------
-- View structure for v_movinvent_salidas
-- ----------------------------
DROP VIEW IF EXISTS `v_movinvent_salidas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_movinvent_salidas` AS SELECT cat_productos.Id, cat_productos.Nombre, Sum(mov_inventario.Cantidad) AS Entradas
FROM mov_inventario RIGHT JOIN cat_productos ON mov_inventario.Id_Producto = cat_productos.Id
AND mov_inventario.Tipo_Operacion="Salida"
GROUP BY cat_productos.Id, cat_productos.Nombre ;

-- ----------------------------
-- View structure for v_ventas_tventas
-- ----------------------------
DROP VIEW IF EXISTS `v_ventas_tventas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_ventas_tventas` AS SELECT cat_productos.Id, cat_productos.Nombre, Sum(det_ventas.CantidadV) AS tventas
FROM ventas RIGHT JOIN (cat_productos LEFT JOIN det_ventas ON cat_productos.Id = det_ventas.ClaveProdV) ON ventas.IdV = det_ventas.ClaveVenta
GROUP BY cat_productos.Id, cat_productos.Nombre, ventas.Cancelada
HAVING ventas.Cancelada=0 ;

-- ----------------------------
-- View structure for v_ventas_tventas_cancel
-- ----------------------------
DROP VIEW IF EXISTS `v_ventas_tventas_cancel`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_ventas_tventas_cancel` AS SELECT cat_productos.Id, cat_productos.Nombre, Sum(det_ventas.CantidadV) AS tventascanceladas
FROM ventas RIGHT JOIN (cat_productos LEFT JOIN det_ventas ON cat_productos.Id = det_ventas.ClaveProdV) ON ventas.IdV = det_ventas.ClaveVenta
GROUP BY cat_productos.Id, cat_productos.Nombre, ventas.Cancelada
HAVING ventas.Cancelada=1 ;

SET FOREIGN_KEY_CHECKS = 1;

# EJECUTAR AL FINAL ANTES DE IMPORTAR LOS DATOS DET_VENTAS
#INSERT INTO `bodegajc`.`ventas`(`IdV`, `FechaV`, `Clave_Cliente`, `SubtotalV`, `DescuentoV`, `Total`, `EnvasesVacios`, `Pendiente`, `Condicion`) VALUES (4010, '2018-07-01 00:00:00', 2, 0, 0, 0, 0, 0, 'EFECTIVO')
#INSERT INTO `bodegajc`.`ventas`(`IdV`, `FechaV`, `Clave_Cliente`, `SubtotalV`, `DescuentoV`, `Total`, `EnvasesVacios`, `Pendiente`, `Condicion`) VALUES (497, '2018-07-01 00:00:00', 2, 0, 0, 0, 0, 0, 'EFECTIVO')