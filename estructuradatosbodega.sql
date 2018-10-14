
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aux_ventas
-- ----------------------------
DROP TABLE IF EXISTS `aux_ventas`;
CREATE TABLE `aux_ventas`  (
  `IdV` int(11) NOT NULL,
  `ClaveVenta` int(11) NULL DEFAULT NULL,
  `ClaveProdV` int(11) NULL DEFAULT NULL,
  `CantidadV` int(11) NULL DEFAULT NULL,
  `PrecioV` decimal(19, 4) NULL DEFAULT NULL,
  `ImporteV` decimal(19, 4) NULL DEFAULT NULL,
  `PrecioEspecial` int(11) NULL DEFAULT NULL,
  `Fecha` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IdV`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cat_clientes
-- ----------------------------
DROP TABLE IF EXISTS `cat_clientes`;
CREATE TABLE `cat_clientes`  (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RFC` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DescuentoAdicional` float NULL DEFAULT NULL,
  `Descuento` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cat_precios
-- ----------------------------
DROP TABLE IF EXISTS `cat_precios`;
CREATE TABLE `cat_precios`  (
  `ID` int(11) NOT NULL,
  `Id_cliente` int(11) NULL DEFAULT NULL,
  `id_Producto` int(11) NULL DEFAULT NULL,
  `Precio` decimal(19, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cat_productos
-- ----------------------------
DROP TABLE IF EXISTS `cat_productos`;
CREATE TABLE `cat_productos`  (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Descripción` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `StockMin` int(11) NULL DEFAULT NULL,
  `UMedida` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
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
-- Table structure for cat_proveedores
-- ----------------------------
DROP TABLE IF EXISTS `cat_proveedores`;
CREATE TABLE `cat_proveedores`  (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RFC` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for datos_tienda
-- ----------------------------
DROP TABLE IF EXISTS `datos_tienda`;
CREATE TABLE `datos_tienda`  (
  `Id` int(11) NOT NULL,
  `NombreTienda` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Telefonos` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IdUnico` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `permiso` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for det_ventas
-- ----------------------------
DROP TABLE IF EXISTS `det_ventas`;
CREATE TABLE `det_ventas`  (
  `IdV` int(11) NOT NULL,
  `ClaveVenta` int(11) NULL DEFAULT NULL,
  `ClaveProdV` int(11) NULL DEFAULT NULL,
  `CantidadV` int(11) NULL DEFAULT NULL,
  `PrecioV` decimal(19, 4) NULL DEFAULT NULL,
  `ImporteV` decimal(19, 4) NULL DEFAULT NULL,
  `Fecha` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IdV`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mov_inventario
-- ----------------------------
DROP TABLE IF EXISTS `mov_inventario`;
CREATE TABLE `mov_inventario`  (
  `Id` int(11) NOT NULL,
  `Id_Producto` int(11) NULL DEFAULT NULL,
  `Tipo_Operacion` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Cantidad` int(11) NULL DEFAULT NULL,
  `Precio` decimal(19, 4) NULL DEFAULT NULL,
  `Fecha` datetime(0) NULL DEFAULT NULL,
  `Referencia` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for movimientos
-- ----------------------------
DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE `movimientos`  (
  `Id` int(11) NOT NULL,
  `FechaHora` datetime(0) NULL DEFAULT NULL,
  `Descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TMov` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Referencia` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Monto` decimal(19, 4) NULL DEFAULT NULL,
  `Cancelada` tinyint(1) NULL DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reporte_financiero
-- ----------------------------
DROP TABLE IF EXISTS `reporte_financiero`;
CREATE TABLE `reporte_financiero`  (
  `id` int(11) NOT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `tienda_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NomTienda` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Operacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Monto` decimal(19, 4) NULL DEFAULT NULL,
  `registrounico` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cancelado` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reporte_inventario
-- ----------------------------
DROP TABLE IF EXISTS `reporte_inventario`;
CREATE TABLE `reporte_inventario`  (
  `Id` int(11) NOT NULL,
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
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `Identificador` int(11) NOT NULL,
  `NombreCompleto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contraseña` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rol` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Identificador`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `IdV` int(11) NOT NULL,
  `FechaV` datetime(0) NULL DEFAULT NULL,
  `Clave_Cliente` int(11) NULL DEFAULT NULL,
  `SubtotalV` decimal(19, 4) NULL DEFAULT NULL,
  `DescuentoV` decimal(19, 4) NULL DEFAULT NULL,
  `Total` decimal(19, 4) NULL DEFAULT NULL,
  `EnvasesVacios` int(11) NULL DEFAULT NULL,
  `Pendiente` tinyint(1) NULL DEFAULT NULL,
  `Condicion` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Cancelada` tinyint(1) NULL DEFAULT NULL,
  `user` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IdV`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
