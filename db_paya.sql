-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 21-10-2026 a las 15:38:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_paya`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `calificacion_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `puntos_comercio` int(11) DEFAULT NULL CHECK (`puntos_comercio` between 1 and 5),
  `puntos_repartidor` int(11) DEFAULT NULL CHECK (`puntos_repartidor` between 1 and 5),
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`calificacion_id`, `factura_id`, `puntos_comercio`, `puntos_repartidor`, `comentario`) VALUES
(1, 2, 5, 4, 'Buen servicio pero hubo un poco de retraso en la entrega'),
(2, 3, 4, 5, 'Buen servicio aunque el restaurante se demoro en dar respuesta a mi pedido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_comercio`
--

CREATE TABLE `categorias_comercio` (
  `categoria_comercio_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias_comercio`
--

INSERT INTO `categorias_comercio` (`categoria_comercio_id`, `nombre`, `descripcion`) VALUES
(1, 'Restaurantes', 'Comida preparada lista para consumir'),
(2, 'Heladerías y Postres', 'Helados, malteadas y dulces'),
(3, 'Supermercados', 'Víveres, frutas, verduras y hogar'),
(4, 'Farmacias', 'Medicamentos y cuidado personal'),
(5, 'Mascotas', 'Alimento y accesorios para animales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_producto`
--

CREATE TABLE `categorias_producto` (
  `categoria_producto_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `comercio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias_producto`
--

INSERT INTO `categorias_producto` (`categoria_producto_id`, `nombre`, `comercio_id`) VALUES
(1, 'Pollo Frito', 1),
(2, 'Helado Gourmet', 3),
(3, 'Lácteos', 2),
(4, 'Analgésicos', 4),
(5, 'Snacks Perros', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comercios`
--

CREATE TABLE `comercios` (
  `comercio_id` int(11) NOT NULL,
  `categoria_comercio_id` int(11) NOT NULL,
  `nombre_comercial` varchar(100) NOT NULL,
  `nit_rut` varchar(20) DEFAULT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comercios`
--

INSERT INTO `comercios` (`comercio_id`, `categoria_comercio_id`, `nombre_comercial`, `nit_rut`, `direccion`, `telefono`) VALUES
(1, 2, 'KFC', ' 900.439.301-2', 'Carrera 13 #15-23 Engativa', '3001232345'),
(2, 5, 'Dog Chow', ' 830.050.346-8', 'Av. 19 Norte', '+571987654'),
(3, 1, 'Popsy', '860053831-1', 'Av 19 #19-17 Santa Fe', '3103455678'),
(4, 5, 'Hills', '9004195869-1', 'Calle 100 con 15', '+571555443'),
(5, 5, 'Snau', ' 902.049.573-2.', 'CC Santa Fe Local 40', '+571888999'),
(6, 4, 'Farmatodo', '830.129.327-1', 'Carrera 11ª No. 98-50, Of. 301-302, Bogotá D.C.', ' (601) 7432100'),
(7, 4, 'Cruz Verde', ': 800.149.695-1', ' Carrera 12 # 96-32', '601 486 5000'),
(8, 4, 'Drogueria Alemana', '890208788-9', 'Carrera 75 No. 24 - 20 ', '(601) 411 1010'),
(9, 3, 'Fallabella', ' 900.017.447-8 ', 'Calle 99 # 11A – 32', 'Calle 99 # 11A – 32'),
(10, 3, 'Ktronix', '890.900.943-1', ' Calle 11 No. 31 A – 42 ', '(601) 407 3033'),
(11, 3, 'DollarCity', ' 900943243-4', 'Av. 3 # 57 Norte – 30, Cali, Valle del Cauca, Colombia', '+57 (2) 3876000'),
(12, 1, 'McDonalds', '800.244.387-4', ' Av. 116 # 7-15 (Oficina 1402, Edificio Cusezar)', 'contactos@mcdonalds.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones_descuento`
--

CREATE TABLE `cupones_descuento` (
  `cupon_id` int(11) NOT NULL,
  `factura_id` int(11) DEFAULT NULL,
  `codigo_cupon` varchar(20) NOT NULL,
  `monto_descuento` decimal(10,2) NOT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cupones_descuento`
--

INSERT INTO `cupones_descuento` (`cupon_id`, `factura_id`, `codigo_cupon`, `monto_descuento`, `activo`) VALUES
(1, 2, '056', 10000.00, 1),
(2, 3, '078', 5000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_factura`
--

CREATE TABLE `detalles_factura` (
  `detalle_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL CHECK (`cantidad` > 0),
  `precio_historico` decimal(10,2) NOT NULL,
  `subtotal_item` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_factura`
--

INSERT INTO `detalles_factura` (`detalle_id`, `factura_id`, `producto_id`, `cantidad`, `precio_historico`, `subtotal_item`) VALUES
(1, 1, 1, 1, 45000.00, 45000.00),
(2, 2, 2, 1, 18000.00, 18000.00),
(3, 3, 3, 4, 4200.00, 16800.00),
(4, 4, 4, 2, 3500.00, 7000.00),
(5, 5, 5, 1, 12000.00, 12000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_usuario`
--

CREATE TABLE `direcciones_usuario` (
  `direccion_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `etiqueta` varchar(50) DEFAULT NULL,
  `calle_avenida` varchar(150) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `coordenadas_gps` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direcciones_usuario`
--

INSERT INTO `direcciones_usuario` (`direccion_id`, `usuario_id`, `etiqueta`, `calle_avenida`, `ciudad`, `coordenadas_gps`) VALUES
(1, 1, 'Casa', 'Calle 85 #11-32', 'Bogotá', '4.667,-74.056'),
(2, 1, 'Trabajo', 'Av. El Dorado #69-70', 'Bogotá', '4.656,-74.114'),
(3, 2, 'Casa', 'Carrera 43A #5A-100', 'Medellín', '6.208,-75.568'),
(4, 3, 'Apartamento', 'Calle 10 #34-20', 'Cali', '3.451,-76.532'),
(5, 4, 'Casa', 'Avenida Principal 45', 'Barranquilla', '10.987,-74.801');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `factura_id` int(11) NOT NULL,
  `codigo_pedido` varchar(20) NOT NULL,
  `fecha_emision` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `comercio_id` int(11) NOT NULL,
  `repartidor_id` int(11) DEFAULT NULL,
  `direccion_id` int(11) NOT NULL,
  `metodo_pago_id` int(11) NOT NULL,
  `subtotal_productos` decimal(10,2) NOT NULL,
  `costo_envio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `propina_repartidor` decimal(10,2) DEFAULT 0.00,
  `total_pagado` decimal(10,2) NOT NULL,
  `estado_pago` varchar(20) DEFAULT 'Procesando'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`factura_id`, `codigo_pedido`, `fecha_emision`, `usuario_id`, `comercio_id`, `repartidor_id`, `direccion_id`, `metodo_pago_id`, `subtotal_productos`, `costo_envio`, `propina_repartidor`, `total_pagado`, `estado_pago`) VALUES
(1, 'DEL-2026-001', '2026-10-07 19:17:04', 1, 1, 1, 1, 1, 45000.00, 4500.00, 3000.00, 52500.00, 'Pagado'),
(2, 'DEL-2026-002', '2026-10-07 19:17:04', 2, 3, 2, 3, 2, 18000.00, 5000.00, 2000.00, 25000.00, 'Pagado'),
(3, 'DEL-2026-003', '2026-10-07 19:17:04', 3, 2, 3, 4, 3, 16800.00, 3500.00, 0.00, 20300.00, 'Pagado'),
(4, 'DEL-2026-004', '2026-10-07 19:17:04', 4, 4, 5, 5, 4, 7000.00, 6000.00, 1500.00, 14500.00, 'Pagado'),
(5, 'DEL-2026-005', '2026-10-07 19:17:04', 5, 5, 1, 1, 1, 12000.00, 4000.00, 2000.00, 18000.00, 'Rechazado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `metodo_pago_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodos_pago`
--

INSERT INTO `metodos_pago` (`metodo_pago_id`, `nombre`) VALUES
(1, 'Tarjeta de Crédito Visa'),
(2, 'Tarjeta de Débito Mastercard'),
(3, 'Efectivo contra entrega'),
(4, 'Billetera Digital App'),
(5, 'Transferencia Bancaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `categoria_producto_id` int(11) NOT NULL,
  `comercio_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `categoria_producto_id`, `comercio_id`, `nombre`, `descripcion`, `precio_venta`, `disponible`) VALUES
(1, 1, 1, 'Balde de Pollo 8 Pzas', '8 piezas de pollo crujiente + papas', 45000.00, 1),
(2, 2, 3, 'Malteada Popsy Familiar', 'Malteada de helado gourmet de 1L', 18000.00, 1),
(3, 3, 2, 'Leche Entera 1L', 'Bolsa de leche entera pasteurizada', 4200.00, 1),
(4, 4, 4, 'Caja de Acetaminofén 500mg', 'Blister por 10 tabletas', 3500.00, 1),
(5, 5, 5, 'Galletas para Perro', 'Paquete de galletas horneadas sabor pollo', 12000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidores`
--

CREATE TABLE `repartidores` (
  `repartidor_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `vehiculo_id` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repartidores`
--

INSERT INTO `repartidores` (`repartidor_id`, `nombre`, `telefono`, `vehiculo_id`, `estado`) VALUES
(1, 'Carlos Mendoza', '+573111111111', 1, 'En Ruta'),
(2, 'Andrés Castro', '+573112222222', 2, 'Disponible'),
(3, 'Brayan Silva', '+573113333333', 3, 'Disponible'),
(4, 'Mateo Gómez', '+573114444444', 4, 'Inactivo'),
(5, 'Daniel Ortiz', '+573115555555', 5, 'En Ruta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento_envio`
--

CREATE TABLE `seguimiento_envio` (
  `seguimiento_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `estado_entrega` varchar(50) DEFAULT 'Recibido',
  `ultima_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguimiento_envio`
--

INSERT INTO `seguimiento_envio` (`seguimiento_id`, `factura_id`, `estado_entrega`, `ultima_actualizacion`) VALUES
(1, 1, 'En Camino', '2026-10-07 19:17:04'),
(2, 2, 'Entregado', '2026-10-07 19:17:04'),
(3, 3, 'Preparando', '2026-10-07 19:17:04'),
(4, 4, 'Entregado', '2026-10-07 19:17:04'),
(5, 5, 'Cancelado', '2026-10-07 19:17:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `email`, `telefono`, `fecha_registro`) VALUES
(1, 'Mariana Ríos', 'mariana@email.com', '+573001111111', '2026-10-07 14:17:04'),
(2, 'Santiago Peña', 'santiago@email.com', '+573002222222', '2026-10-07 14:17:04'),
(3, 'Camila López', 'camila@email.com', '+573003333333', '2026-10-07 14:17:04'),
(4, 'Esteban Quito', 'esteban@email.com', '+573004444444', '2026-10-07 14:17:04'),
(5, 'Valeria Vélez', 'valeria@email.com', '+573005555555', '2026-10-07 14:17:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `vehiculo_id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`vehiculo_id`, `tipo`, `placa`, `modelo`) VALUES
(1, 'Motocicleta', 'XYZ-123', 'Honda Cargo 150'),
(2, 'Bicicleta', NULL, 'Trek Marlin 5'),
(3, 'Motocicleta', 'ABC-789', 'Yamaha YBR'),
(4, 'Automóvil', 'MX-4455', 'Chevrolet Spark'),
(5, 'Bicicleta Eléctrica', NULL, 'Xiaomi QiCYCLE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`calificacion_id`),
  ADD KEY `factura_id` (`factura_id`);

--
-- Indices de la tabla `categorias_comercio`
--
ALTER TABLE `categorias_comercio`
  ADD PRIMARY KEY (`categoria_comercio_id`);

--
-- Indices de la tabla `categorias_producto`
--
ALTER TABLE `categorias_producto`
  ADD PRIMARY KEY (`categoria_producto_id`),
  ADD KEY `comercio_id` (`comercio_id`);

--
-- Indices de la tabla `comercios`
--
ALTER TABLE `comercios`
  ADD PRIMARY KEY (`comercio_id`),
  ADD UNIQUE KEY `nit_rut` (`nit_rut`),
  ADD KEY `categoria_comercio_id` (`categoria_comercio_id`);

--
-- Indices de la tabla `cupones_descuento`
--
ALTER TABLE `cupones_descuento`
  ADD PRIMARY KEY (`cupon_id`),
  ADD UNIQUE KEY `codigo_cupon` (`codigo_cupon`),
  ADD KEY `factura_id` (`factura_id`);

--
-- Indices de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `factura_id` (`factura_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `direcciones_usuario`
--
ALTER TABLE `direcciones_usuario`
  ADD PRIMARY KEY (`direccion_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`factura_id`),
  ADD UNIQUE KEY `codigo_pedido` (`codigo_pedido`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `comercio_id` (`comercio_id`),
  ADD KEY `repartidor_id` (`repartidor_id`),
  ADD KEY `direccion_id` (`direccion_id`),
  ADD KEY `metodo_pago_id` (`metodo_pago_id`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`metodo_pago_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_producto_id` (`categoria_producto_id`),
  ADD KEY `comercio_id` (`comercio_id`);

--
-- Indices de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  ADD PRIMARY KEY (`repartidor_id`),
  ADD KEY `vehiculo_id` (`vehiculo_id`);

--
-- Indices de la tabla `seguimiento_envio`
--
ALTER TABLE `seguimiento_envio`
  ADD PRIMARY KEY (`seguimiento_id`),
  ADD KEY `factura_id` (`factura_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`vehiculo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `calificacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias_comercio`
--
ALTER TABLE `categorias_comercio`
  MODIFY `categoria_comercio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias_producto`
--
ALTER TABLE `categorias_producto`
  MODIFY `categoria_producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comercios`
--
ALTER TABLE `comercios`
  MODIFY `comercio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cupones_descuento`
--
ALTER TABLE `cupones_descuento`
  MODIFY `cupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `direcciones_usuario`
--
ALTER TABLE `direcciones_usuario`
  MODIFY `direccion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `factura_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `metodo_pago_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  MODIFY `repartidor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `seguimiento_envio`
--
ALTER TABLE `seguimiento_envio`
  MODIFY `seguimiento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `vehiculo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `fk_calificaciones_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorias_producto`
--
ALTER TABLE `categorias_producto`
  ADD CONSTRAINT `fk_categorias_producto_comercio` FOREIGN KEY (`comercio_id`) REFERENCES `comercios` (`comercio_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comercios`
--
ALTER TABLE `comercios`
  ADD CONSTRAINT `fk_comercios_categoria` FOREIGN KEY (`categoria_comercio_id`) REFERENCES `categorias_comercio` (`categoria_comercio_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cupones_descuento`
--
ALTER TABLE `cupones_descuento`
  ADD CONSTRAINT `fk_cupones_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD CONSTRAINT `fk_detalles_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalles_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `direcciones_usuario`
--
ALTER TABLE `direcciones_usuario`
  ADD CONSTRAINT `fk_direcciones_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_facturas_comercio` FOREIGN KEY (`comercio_id`) REFERENCES `comercios` (`comercio_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_facturas_direccion` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones_usuario` (`direccion_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_facturas_metodo_pago` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodos_pago` (`metodo_pago_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_facturas_repartidor` FOREIGN KEY (`repartidor_id`) REFERENCES `repartidores` (`repartidor_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_facturas_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categorias_producto` (`categoria_producto_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_productos_comercio` FOREIGN KEY (`comercio_id`) REFERENCES `comercios` (`comercio_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `repartidores`
--
ALTER TABLE `repartidores`
  ADD CONSTRAINT `fk_repartidores_vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `seguimiento_envio`
--
ALTER TABLE `seguimiento_envio`
  ADD CONSTRAINT `fk_seguimiento_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
