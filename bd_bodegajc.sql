
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cat_clientes
-- ----------------------------
DROP TABLE IF EXISTS `cat_clientes`;
CREATE TABLE `cat_clientes`  (
  `Id` int(11) NULL DEFAULT NULL,
  `Nombre` varchar(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RFC` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DescuentoAdicional` decimal(4, 3) NULL DEFAULT NULL,
  `Descuento` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cat_precios
-- ----------------------------
DROP TABLE IF EXISTS `cat_precios`;
CREATE TABLE `cat_precios`  (
  `ID` int(11) NULL DEFAULT NULL,
  `Id_cliente` int(11) NULL DEFAULT NULL,
  `id_Producto` int(11) NULL DEFAULT NULL,
  `Precio` decimal(7, 4) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cat_productos
-- ----------------------------
DROP TABLE IF EXISTS `cat_productos`;
CREATE TABLE `cat_productos`  (
  `Id` int(11) NULL DEFAULT NULL,
  `Nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Descripción` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StockMin` int(11) NULL DEFAULT NULL,
  `UMedida` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PrecioVentaCliente` decimal(7, 4) NULL DEFAULT NULL,
  `ExcentoDescuento` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `P25` decimal(7, 4) NULL DEFAULT NULL,
  `P29` decimal(7, 4) NULL DEFAULT NULL,
  `P30` decimal(7, 4) NULL DEFAULT NULL,
  `P35` decimal(7, 4) NULL DEFAULT NULL,
  `P40` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cat_proveedores
-- ----------------------------
DROP TABLE IF EXISTS `cat_proveedores`;
CREATE TABLE `cat_proveedores`  (
  `Id` int(11) NULL DEFAULT NULL,
  `Nombre` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RFC` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for datos_tienda
-- ----------------------------
DROP TABLE IF EXISTS `datos_tienda`;
CREATE TABLE `datos_tienda`  (
  `Id` int(11) NULL DEFAULT NULL,
  `NombreTienda` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Direccion` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Telefonos` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdUnico` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permiso` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for det_ventas
-- ----------------------------
DROP TABLE IF EXISTS `det_ventas`;
CREATE TABLE `det_ventas`  (
  `IdV` int(11) NOT NULL,
  `ClaveVenta` int(11) NULL DEFAULT NULL,
  `ClaveProdV` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CantidadV` int(11) NULL DEFAULT NULL,
  `PrecioV` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ImporteV` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Fecha` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IdV`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mov_inventario
-- ----------------------------
DROP TABLE IF EXISTS `mov_inventario`;
CREATE TABLE `mov_inventario`  (
  `Id` int(11) NULL DEFAULT NULL,
  `Id_Producto` int(11) NULL DEFAULT NULL,
  `Tipo_Operacion` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Cantidad` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Precio` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Fecha` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Referencia` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for movimientos
-- ----------------------------
DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE `movimientos`  (
  `Id` int(11) NULL DEFAULT NULL,
  `FechaHora` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Descripcion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TMov` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Referencia` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Monto` decimal(10, 4) NULL DEFAULT NULL,
  `Cancelada` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reporte_financiero
-- ----------------------------
DROP TABLE IF EXISTS `reporte_financiero`;
CREATE TABLE `reporte_financiero`  (
  `id` int(11) NULL DEFAULT NULL,
  `fecha` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tienda_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NomTienda` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Operacion` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Monto` decimal(9, 4) NULL DEFAULT NULL,
  `registrounico` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `descripcion` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cancelado` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reporte_inventario
-- ----------------------------
DROP TABLE IF EXISTS `reporte_inventario`;
CREATE TABLE `reporte_inventario`  (
  `Id` int(11) NULL DEFAULT NULL,
  `Fecha` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IdTienda` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `registrounicodia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_producto` int(11) NULL DEFAULT NULL,
  `saldo_inicial` int(11) NULL DEFAULT NULL,
  `entradas` int(11) NULL DEFAULT NULL,
  `cant_acum` int(11) NULL DEFAULT NULL,
  `salidas` int(11) NULL DEFAULT NULL,
  `stockreal` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `Identificador` int(11) NULL DEFAULT NULL,
  `NombreCompleto` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contraseña` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rol` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `IdV` int(11) NOT NULL,
  `FechaV` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Clave_Cliente` int(11) NULL DEFAULT NULL,
  `SubtotalV` decimal(5, 4) NULL DEFAULT NULL,
  `DescuentoV` decimal(5, 4) NULL DEFAULT NULL,
  `Total` decimal(10, 4) NULL DEFAULT NULL,
  `EnvasesVacios` int(11) NULL DEFAULT NULL,
  `Pendiente` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Condicion` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Cancelada` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IdV`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
