-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 16-09-2026 a las 16:10:37
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
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `puntos_tienda` int(11) DEFAULT NULL CHECK (`puntos_tienda` between 1 and 5),
  `puntos_repartidor` int(11) DEFAULT NULL CHECK (`puntos_repartidor` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `pedido_id`, `puntos_tienda`, `puntos_repartidor`, `comentario`, `fecha_creacion`) VALUES
(1, 4, 1, NULL, 'Se demoraron mucho en procesar mi pedido', '2026-09-16 14:05:02'),
(2, 2, 5, 4, 'El pedido se entrego a tiempo aunque ya venia un poco frio', '2026-09-16 14:09:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_tiendas`
--

CREATE TABLE `categorias_tiendas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias_tiendas`
--

INSERT INTO `categorias_tiendas` (`id`, `nombre`) VALUES
(2, 'Farmacia'),
(1, 'Restaurante'),
(4, 'Ropa'),
(3, 'SuperMercado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedidos`
--

CREATE TABLE `detalles_pedidos` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_pedidos`
--

INSERT INTO `detalles_pedidos` (`id`, `pedido_id`, `product_id`, `cantidad`, `precio_unitario`) VALUES
(1, 4, 1, 1, 37500.00),
(2, 2, 3, 4, 2000.00),
(3, 1, 4, 2, 70000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') DEFAULT 'pendiente',
  `monto_reembolsado` decimal(10,2) DEFAULT 0.00,
  `fecha_solicitud` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `metodo_pago_id` int(11) NOT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  `fecha_emision` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id`, `usuario_id`, `tienda_id`) VALUES
(4, 2, 1),
(5, 3, 2),
(1, 4, 1),
(2, 4, 4),
(3, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados_pedido`
--

CREATE TABLE `historial_estados_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `estado` enum('pendiente','preparando','en_camino','entregado','cancelado') NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_estados_pedido`
--

INSERT INTO `historial_estados_pedido` (`id`, `pedido_id`, `estado`, `fecha_registro`) VALUES
(1, 1, 'entregado', '2026-09-15 13:51:45'),
(2, 4, 'cancelado', '2026-09-16 15:10:45'),
(3, 2, 'entregado', '2026-09-16 13:52:57'),
(4, 3, 'entregado', '2026-09-16 13:52:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_tiendas`
--

CREATE TABLE `horarios_tiendas` (
  `id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo') NOT NULL,
  `hora_apertura` time NOT NULL,
  `hora_cierre` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios_tiendas`
--

INSERT INTO `horarios_tiendas` (`id`, `tienda_id`, `dia_semana`, `hora_apertura`, `hora_cierre`) VALUES
(1, 4, 'Lunes', '08:30:00', '05:00:00'),
(2, 3, 'Martes', '07:00:00', '08:45:00'),
(3, 2, 'Martes', '08:00:33', '08:00:00'),
(4, 1, 'Miercoles', '06:00:00', '05:00:00'),
(5, 5, 'Lunes', '07:00:04', '06:00:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo` enum('tarjeta','efectivo','transferencia') NOT NULL,
  `proveedor` varchar(50) DEFAULT NULL,
  `token_pago` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodos_pago`
--

INSERT INTO `metodos_pago` (`id`, `usuario_id`, `tipo`, `proveedor`, `token_pago`) VALUES
(1, 5, 'tarjeta', 'visa', 'tok_1234'),
(2, 4, 'efectivo', NULL, NULL),
(3, 3, 'transferencia', 'nequi', NULL),
(4, 7, 'efectivo', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `repartidor_id` int(11) DEFAULT NULL,
  `tienda_id` int(11) NOT NULL,
  `promocion_id` int(11) DEFAULT NULL,
  `estado` enum('pendiente','preparando','en_camino','entregado','cancelado') DEFAULT 'pendiente',
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_asignacion` timestamp NULL DEFAULT NULL,
  `fecha_entrega` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `repartidor_id`, `tienda_id`, `promocion_id`, `estado`, `total`, `fecha_creacion`, `fecha_asignacion`, `fecha_entrega`) VALUES
(1, 5, 1, 3, 1, 'preparando', 15400.00, '2026-09-16 13:38:10', '2026-09-15 13:33:48', '2026-09-15 14:33:40'),
(2, 4, 3, 5, 2, 'entregado', 25000.00, '2026-09-14 13:33:48', '2026-09-14 13:40:19', '2026-09-14 14:34:48'),
(3, 5, 5, 4, 3, 'preparando', 70000.00, '2026-09-16 13:38:23', '2026-09-16 17:10:23', '2026-09-17 15:38:23'),
(4, 2, 2, 1, NULL, 'cancelado', 15000.00, '2026-09-15 13:38:23', '2026-09-16 14:38:23', '2026-09-16 14:40:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `tienda_id`, `nombre`, `precio`) VALUES
(1, 1, 'Churrasco', 37500.00),
(3, 3, 'libra de azucar', 2000.00),
(4, 4, 'pantalon de mezclilla', 70000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `porcentaje_descuento` decimal(5,2) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id`, `codigo`, `porcentaje_descuento`, `fecha_inicio`, `fecha_fin`) VALUES
(1, '1234', 20.00, '2026-09-16 15:26:36', '2026-09-18 15:26:36'),
(2, '1235', 10.00, '2026-09-16 15:26:36', '2026-09-16 15:26:36'),
(3, '1236', 25.00, '2026-09-10 15:27:34', '2026-09-16 15:27:34'),
(4, '1237', 12.00, '2026-09-16 15:27:34', '2026-09-16 15:27:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id` int(11) NOT NULL,
  `categoria_tienda_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `imagen_logo` varchar(255) DEFAULT NULL,
  `pedido_minimo` decimal(10,2) DEFAULT 0.00,
  `esta_abierta` tinyint(1) DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`id`, `categoria_tienda_id`, `nombre`, `direccion`, `telefono`, `imagen_logo`, `pedido_minimo`, `esta_abierta`, `creado_en`) VALUES
(1, 1, 'Restaurante Santa Maria', 'Cr 45 #75-32', '3013036689', 'Logo', 0.00, 1, '2026-09-09 14:30:28'),
(2, 2, 'Farmacia los libertadores', 'cll72#06-21', '3124087655', NULL, 5000.00, 1, '2026-09-16 13:23:56'),
(3, 3, 'Distribuidora stiven', 'carrera 7#71-21', '3007654092', NULL, 5000.00, 1, '2026-09-16 13:23:56'),
(4, 4, 'Boutique siempre linda', 'Cll 2#4b-12', '3215534506', NULL, 50000.00, 1, '2026-09-16 13:26:26'),
(5, 1, 'Restaurante limonera', 'Carrera 12#5Bis', '3027654008', NULL, 10000.00, 1, '2026-09-16 13:26:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `rol` enum('cliente','repartidor','admin') NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `telefono`, `rol`, `creado_en`) VALUES
(1, 'Roberto', 'robertohurtado12@gmail.com', '3154870708', 'cliente', '2026-09-09 13:19:19'),
(2, 'Sofia', 'baez4sofia@gmail.com', '3125643213', 'cliente', '2026-09-09 13:53:23'),
(3, 'Luis', 'luis2345@gmail.com', '3117345609', 'cliente', '2026-09-09 13:54:15'),
(4, 'Karen', 'karenlorena13@gmail.com', '3204394502', 'cliente', '2026-09-09 13:56:05'),
(5, 'Felipe', 'felipe06ortis@gmail.com', '3154327890', 'cliente', '2026-09-16 13:08:25'),
(6, 'Martha orduz', 'marthaorduz@gmail.com', '3007654008', 'cliente', '2026-09-16 13:08:25'),
(7, 'Santiago Pineda', 'pineda1234@gmail.com', '3219834506', 'cliente', '2026-09-16 13:09:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos_repartidores`
--

CREATE TABLE `vehiculos_repartidores` (
  `id` int(11) NOT NULL,
  `repartidor_id` int(11) NOT NULL,
  `tipo_vehiculo` enum('moto','bicicleta','auto') NOT NULL,
  `placa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos_repartidores`
--

INSERT INTO `vehiculos_repartidores` (`id`, `repartidor_id`, `tipo_vehiculo`, `placa`) VALUES
(1, 1, 'auto', 'APQ123'),
(2, 3, 'auto', 'SCZ451'),
(3, 5, 'bicicleta', 'no aplica'),
(4, 7, 'moto', 'MOZ 95E'),
(5, 2, 'moto', 'INC 50U'),
(6, 4, 'auto', 'RYN 987'),
(7, 6, 'bicicleta', 'no aplica');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `categorias_tiendas`
--
ALTER TABLE `categorias_tiendas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pedido_id` (`pedido_id`),
  ADD KEY `metodo_pago_id` (`metodo_pago_id`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_tienda_unico` (`usuario_id`,`tienda_id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `horarios_tiendas`
--
ALTER TABLE `horarios_tiendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `repartidor_id` (`repartidor_id`),
  ADD KEY `tienda_id` (`tienda_id`),
  ADD KEY `promocion_id` (`promocion_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_tienda_id` (`categoria_tienda_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `vehiculos_repartidores`
--
ALTER TABLE `vehiculos_repartidores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `repartidor_id` (`repartidor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias_tiendas`
--
ALTER TABLE `categorias_tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `horarios_tiendas`
--
ALTER TABLE `horarios_tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `vehiculos_repartidores`
--
ALTER TABLE `vehiculos_repartidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD CONSTRAINT `detalles_pedidos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_pedidos_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodos_pago` (`id`);

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_estados_pedido`
--
ALTER TABLE `historial_estados_pedido`
  ADD CONSTRAINT `historial_estados_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `horarios_tiendas`
--
ALTER TABLE `horarios_tiendas`
  ADD CONSTRAINT `horarios_tiendas_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD CONSTRAINT `metodos_pago_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`repartidor_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD CONSTRAINT `tiendas_ibfk_1` FOREIGN KEY (`categoria_tienda_id`) REFERENCES `categorias_tiendas` (`id`);

--
-- Filtros para la tabla `vehiculos_repartidores`
--
ALTER TABLE `vehiculos_repartidores`
  ADD CONSTRAINT `vehiculos_repartidores_ibfk_1` FOREIGN KEY (`repartidor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
