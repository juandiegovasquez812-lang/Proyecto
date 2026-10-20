-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 20-10-2026 a las 02:39:05
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
-- Base de datos: `db_pa'ya`
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
(5, 'Snacks Perros', 5),
(6, 'Purina para perro', 6),
(7, 'Electronicos', 7),
(8, 'Electrodomesticos', 8),
(9, 'Belleza', 9),
(10, 'Productos hogar', 11),
(11, 'Cuidado canino', 5);

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
(1, 'DEL-2026-001', '2026-10-07 14:17:04', 1, 1, 1, 1, 1, 45000.00, 4500.00, 3000.00, 52500.00, 'Pagado'),
(2, 'DEL-2026-002', '2026-10-07 14:17:04', 2, 3, 2, 3, 2, 18000.00, 5000.00, 2000.00, 25000.00, 'Pagado'),
(3, 'DEL-2026-003', '2026-10-07 14:17:04', 3, 2, 3, 4, 3, 16800.00, 3500.00, 0.00, 20300.00, 'Pagado'),
(4, 'DEL-2026-004', '2026-10-07 14:17:04', 4, 4, 5, 5, 4, 7000.00, 6000.00, 1500.00, 14500.00, 'Pagado'),
(5, 'DEL-2026-005', '2026-10-07 14:17:04', 5, 5, 1, 1, 1, 12000.00, 4000.00, 2000.00, 18000.00, 'Rechazado');

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
(5, 5, 5, 'Galletas para Perro', 'Paquete de galletas horneadas sabor pollo', 12000.00, 1),
(6, 4, 4, 'Floratil 250mg', 'medicamento probiótico que contiene levaduras beneficiosas y se utiliza para ayudar a tratar la diarrea y restablecer el equilibrio de la flora intestinal.', 69000.00, 1),
(7, 4, 4, 'Congestex 10 capsulas', 'producto utilizado para aliviar síntomas de congestión nasal y resfriado, dependiendo de su composición específica.', 18000.00, 1),
(8, 4, 4, 'Pediasure tarro 850mg', 'suplemento nutricional infantil que aporta proteínas, vitaminas, minerales y otros nutrientes para complementar la alimentación de los niños.', 78000.00, 1),
(9, 4, 4, 'Gelicart Advance 30 sobres', 'suplemento nutricional que suele estar relacionado con el aporte de colágeno y nutrientes para el mantenimiento de las articulaciones', 261000.00, 1),
(10, 4, 4, 'Allegra 10 tabletas', 'medicamento antihistamínico que contiene fexofenadina y se utiliza para aliviar síntomas de alergia, como estornudos, picazón y secreción nasal.', 72000.00, 1),
(11, 2, 3, ' Malteada clásica 16oz', '\r\nMalteada cremosa de 16oz preparada con helado artesanal Popsy. Textura espesa y dulce, disponible en sabores clásicos como vainilla, chocolate, fresa y arequipe. Perfecta para tomar con pitillo.', 20000.00, 1),
(12, 2, 3, 'Granizado 16oz', '\r\nHielo raspado de 16oz con sirope de frutas 100% natural. Refrescante, colorido y con trocitos de fruta. Ideal para el calor, sabores más pedidos: maracuyá, mora y limón.', 13500.00, 1),
(13, 2, 3, 'Charlie Brownie', '\r\nEl postre estrella de Popsy. Brownie de chocolate tibio, esponjoso por dentro, servido con una bola de helado de vainilla, salsa de chocolate y maní crocante. Frío con caliente.', 14000.00, 1),
(14, 2, 3, 'Litro de helado 600g', '\r\nPresentación familiar de 1 litro / 600g para compartir. Helado premium 100% de leche, con 4 porciones generosas. Llévalo a casa en tu sabor favorito.', 40000.00, 1),
(15, 2, 3, ' Popsy Toy', '\r\nCombo infantil divertido: helado en vasito + juguete sorpresa coleccionable. Viene en empaque especial para niños.', 11000.00, 1),
(16, 10, 11, ' Paños microfibra', '\r\nSet de paños de microfibra ultra absorbentes. No dejan pelusa, ideales para limpiar vidrios, cocina y carro. Secado rápido y larga duración.', 18000.00, 1),
(17, 10, 11, ' Ganchos de terciopelo', '\r\nGanchos antideslizantes forrados en terciopelo negro. No marcan la ropa, ahorran espacio y hacen que el closet se vea ordenado y elegante. Perfectos para camisas y vestidos.', 10000.00, 1),
(18, 10, 11, 'Tabla de picar', '\r\nTabla de picar de bambú/plástico resistente. Superficie higiénica, no resbala y no maltrata los cuchillos. Ideal para carnes, verduras y frutas.', 16000.00, 1),
(19, 10, 11, 'Contenedores de plástico', '\r\nContenedores herméticos para almacenar alimentos. Aptos para microondas y congelador, mantienen la comida fresca por más tiempo. Ideales para loncheras.', 7000.00, 1),
(20, 10, 11, 'Filtros para café número 2', '\r\nFiltros de papel desechables No. 2 para cafetera eléctrica. Café limpio, sin residuos, resalta el aroma y sabor. Paquete rinde bastante.', 10000.00, 1),
(21, 6, 5, 'Concentrado 1kg ', '\r\nAlimento balanceado 1kg para perro adulto. Nutrición completa con proteína, vitaminas y minerales. Ideal para probar o para razas pequeñas.\r\n', 17500.00, 1),
(22, 6, 5, 'Concentrado 3kg', 'Presentación mediana de 3kg. Rinde más y te ahorras. Misma fórmula premium, mantiene a tu perro con energía y pelaje sano.', 52500.00, 1),
(23, 6, 5, 'Concentrado 5kg', '\r\nBulto grande de 5kg, la opción más económica para el mes. Alimento completo para perros, sella fácil y conserva la frescura.', 87500.00, 1),
(24, 11, 5, 'Shampoo para perros', '\r\nShampoo hipoalergénico para todo tipo de pelaje. Limpia profundo, deja el pelo suave, brillante y con rico olor. Elimina malos olores sin irritar la piel.', 20000.00, 1),
(25, 8, 9, 'Licuadora inteligente Ninja', '\r\nLicuadora inteligente de alta potencia con cuchillas que trituran hielo en segundos. Funciones automáticas para smoothies, sopas y salsas. Vaso grande y tecnología Auto-iQ.', 1200000.00, 1),
(26, 10, 9, 'Juego de ollas universal', '\r\nSet de ollas antiadherentes para todo tipo de estufas incluida inducción. Distribución uniforme de calor, tapas de vidrio templado y mangos fríos al tacto. Ideal para equipar tu cocina.', 323000.00, 1),
(27, 7, 9, ' Audífonos Samsung Buds ', '\r\nAudífonos inalámbricos Bluetooth con cancelación de ruido. Sonido nítido, graves profundos, estuche con carga rápida y hasta 20h de batería. Perfectos para música y llamadas.', 160000.00, 1),
(28, 7, 9, ' TV LG 58\" NANO 4K UHD', '\r\nTelevisor LG de 58 pulgadas con tecnología NanoCell, resolución 4K UHD real. Colores puros, contraste mejorado y sistema webOS con apps como Netflix y YouTube.', 1900000.00, 1),
(29, 0, 9, 'Samsung Galaxy S25 FE', '\r\nCelular Samsung de gama alta Fan Edition. Pantalla AMOLED 120Hz, cámara pro de 50MP, batería de larga duración y rendimiento rápido para juegos y trabajo.', 1800000.00, 1),
(26, 10, 9, 'Juego de ollas universal', '\r\nSet de ollas antiadherentes para todo tipo de estufas incluida inducción. Distribución uniforme de calor, tapas de vidrio templado y mangos fríos al tacto. Ideal para equipar tu cocina.', 323000.00, 1),
(27, 7, 9, 'Audífonos Samsung Buds', '\r\nAudífonos inalámbricos Bluetooth con cancelación de ruido. Sonido nítido, graves profundos, estuche con carga rápida y hasta 20h de batería. Perfectos para música y llamadas', 160000.00, 1),
(28, 7, 9, 'TV LG 58\" NANO 4K UHD ', '\r\nTelevisor LG de 58 pulgadas con tecnología NanoCell, resolución 4K UHD real. Colores puros, contraste mejorado y sistema webOS con apps como Netflix y YouTube.', 1900000.00, 1),
(29, 7, 9, 'Samsung Galaxy S25 FE ', '\r\nCelular Samsung de gama alta Fan Edition. Pantalla AMOLED 120Hz, cámara pro de 50MP, batería de larga duración y rendimiento rápido para juegos y trabajo.', 1800000.00, 1),
(30, 4, 8, ' Losartán Genfar 30 tabletas', ' \r\nAntihipertensivo genérico para el control de la presión arterial alta. Caja por 30 tabletas recubiertas. Venta bajo fórmula médica.', 11000.00, 1),
(31, 4, 8, 'Postday Levonogestrel', '\r\nAnticonceptivo de emergencia de una sola toma. Pastilla de 1.5mg de levonorgestrel para uso ocasional. No es de uso regular.', 12000.00, 1),
(32, 4, 8, 'Rybelsus 30 tabletas', '\r\nMedicamento para diabetes tipo 2 a base de semaglutida oral. Ayuda a controlar los niveles de azúcar en sangre. Caja por 30 tabletas. Venta bajo fórmula médica.', 379000.00, 1),
(33, 4, 8, 'Electrolit Suero', '\r\nSuero hidratante con electrolitos. Ideal para rehidratar después de ejercicio, calor o malestar estomacal. Sabor agradable y rápida absorción.', 7100.00, 1),
(34, 9, 8, 'Agua Micelar Garnier', '\r\nAgua micelar desmaquillante todo en 1. Limpia, desmaquilla y tonifica el rostro sin enjuague. Para todo tipo de piel, elimina impurezas y maquillaje a prueba de agua.', 17000.00, 1),
(35, 1, 12, 'Big Mac', '\r\nLa hamburguesa más famosa del mundo. Doble carne 100% res, pan con semillas de ajonjolí, lechuga, queso cheddar, pepinillos, cebolla y la salsa secreta Big Mac.', 22000.00, 1),
(36, 1, 12, 'Mc Combo Mediano', '\r\nCombo completo: hamburguesa a elección + papas medianas crujientes + bebida mediana de 16oz. Perfecto para almorzar.', 32000.00, 1),
(37, 1, 12, 'Cajita Feliz', '\r\nMenú infantil con hamburguesa o nuggets, papitas pequeñas, bebida, fruta y juguete sorpresa coleccionable.', 24000.00, 1),
(38, 2, 12, ' Sundae', '\r\nHelado de vainilla cremoso con salsa caliente a elección: chocolate, arequipe o fresa. Servido en vasito.', 8000.00, 1),
(39, 2, 12, 'McFlurry', '\r\nHelado mezclado con trozos de galleta Oreo o M&M\'s y salsa de chocolate. Cremoso, dulce y con toppings crocantes.', 14000.00, 1),
(40, 1, 1, 'Combo BBQ Crunch', '\r\nSándwich crujiente de pollo apanado con salsa BBQ, lechuga y mayonesa + papas pequeñas + bebida. Pollo 100% jugoso por dentro y extra crujiente por fuera.', 15000.00, 1),
(41, 1, 1, 'Aros de Cebolla Burguer', '\r\nHamburguesa con carne, queso, aros de cebolla crujientes y salsa BBQ ahumada. Combinación dulce y salada con el toque KFC.', 22000.00, 1),
(42, 1, 1, ' Kentucky Sandwich', '\r\nEl clásico sándwich de KFC. Filete de pollo frito con la receta secreta de 11 especias, pan brioche suave y pepinillos. Simple y delicioso.', 14000.00, 1),
(43, 1, 1, 'Combo Coronel Burguer', '\r\nLa hamburguesa insignia del Coronel. Doble pollo crujiente, queso cheddar, lechuga, tomate y salsa especial del Coronel + papas + gaseosa.', 28000.00, 1),
(44, 1, 1, 'Almuerzo 3 Presas', '\r\n3 presas de pollo fritas con la receta original + papas a la francesa + ensalada coleslaw + bebida. Almuerzo completo para una persona.', 28000.00, 1),
(45, 5, 4, 'Lata pollo y vegetales', '\r\nAlimento húmedo en lata con trocitos de pollo y vegetales en salsa. Alto en proteína, hidratante y muy palatable. Ideal para mezclar con croquetas.', 15000.00, 1),
(46, 6, 4, 'Alimento húmedo adulto', '\r\nSobre de alimento húmedo balanceado para perro/gato adulto. Textura suave, ayuda a la digestión y mantiene hidratada a tu mascota. Porción individual..', 10500.00, 1),
(47, 6, 4, 'Purina raza pequeña 4.5lb', '\r\nConcentrado premium para perros de raza pequeña. Croquetas pequeñas adaptadas a su mandíbula, con DHA, antioxidantes y alta proteína para mucha energía.', 97000.00, 1),
(48, 6, 4, 'Purina dieta medicado 4lb', '\r\nAlimento medicado / veterinario para necesidades especiales (digestivo, renal, urinario). Fórmula controlada por veterinarios, bolsa de 4lb.', 104000.00, 1),
(49, 6, 4, 'Purina adulto 4.5lb ', '\r\nAlimento completo para perro adulto de todas las razas. Nutrición balanceada con carne real, vitaminas y minerales para pelaje brillante y huesos fuertes', 120000.00, 1),
(50, 6, 2, 'Purina adulto 2kg ', '\r\nConcentrado Purina Dog Chow para perro adulto. Bolsa de 2kg con proteína de pollo, vitaminas y minerales. Fortalece defensas y mantiene pelaje brillante.', 25000.00, 1),
(51, 6, 2, ' Purina comida húmeda', '\r\nSobre de alimento húmedo Purina. Trocitos jugosos en salsa, ideal como complemento o premio. Sabor irresistible y ayuda a hidratar.', 2900.00, 1),
(52, 6, 2, ' Purina cachorros 2kg ', '\r\nDog Chow para cachorros hasta 12 meses. Bolsa de 2kg con DHA para desarrollo cerebral, calcio para huesos fuertes y defensas naturales.', 30000.00, 1),
(53, 6, 2, 'Purina alta proteína 2kg', '\r\nFórmula alta en proteína para perros activos o musculosos. 2kg de nutrición reforzada que ayuda a mantener masa muscular magra.', 27500.00, 1),
(54, 6, 2, 'Purina adulto 5kg ', '\r\nPresentación grande de 5kg para adulto. Más económico, rinde casi un mes. Alimento completo y balanceado con OptiNutrientes.', 75000.00, 1),
(55, 9, 6, 'Bloqueador solar facial 50ml', '\r\nProtector solar facial factor 50, textura ligera que no deja grasa. Protege contra rayos UVA/UVB, ideal para uso diario y para todo tipo de piel.', 48000.00, 1),
(56, 9, 6, 'Serum Garnier express 30ml', '\r\nSerum antimanchas con vitamina C. Aclara, ilumina y uniformiza el tono de la piel en días. Resultados express, frasco de 30ml.', 66000.00, 1),
(57, 9, 6, 'Enjuague bucal Listerine', '\r\nEnjuague bucal antiséptico que elimina bacterias, combate mal aliento y deja aliento fresco por horas. Protección completa bucal.', 13000.00, 1),
(58, 9, 6, 'Shampoo la posion 450ml', '\r\nShampoo La Poción, famoso en TikTok para crecimiento del cabello. Fortalece la raíz, evita la caída y deja el pelo largo y brillante. 450ml.', 49000.00, 1),
(59, 4, 6, 'Allegra 10 tabletas', '\r\nAntihistamínico para alergias. Alivia estornudos, picazón y ojos llorosos por rinitis alérgica. Caja por 10 tabletas de fexofenadina.', 68000.00, 1),
(60, 8, 10, 'Minibar Kalley frost 44L', '\r\nMini nevera de 44 litros, ideal para habitación, oficina o mini apartamento. Tecnología Frost, bajo consumo, puerta reversible y parrilla ajustable', 700000.00, 1),
(61, 7, 10, ' Adaptador APPLE 40W', '\r\nCargador original Apple Dual USB-C de 40W. Carga rápida para iPhone, iPad y MacBook Air. Compacto y potencia inteligente.', 230000.00, 1),
(62, 7, 10, 'iPhone 17 Pro Max 256GB', '\r\nLo último de Apple. Pantalla Super Retina XDR, chip A19 Pro, cámara de 48MP con zoom 5x y titanio. 256GB de almacenamiento.', 5250000.00, 1),
(63, 7, 10, 'Motorola Gmax 256GB', '\r\nMoto G con 256GB, pantalla de 6.7\" a 120Hz y batería de 5000mAh. Cámara de 50MP, rendimiento fluido y sonido Dolby Atmos.', 1150000.00, 1),
(64, 7, 10, ' Portátil DELL Essential \r\n', 'Laptop Dell Essential con Intel Core i5, 8GB RAM y 512GB SSD. Pantalla Full HD de 15.6\", ideal para estudio, trabajo y uso diario.', 4900000.00, 1);

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
(1, 1, 'En Camino', '2026-10-07 14:17:04'),
(2, 2, 'Entregado', '2026-10-07 14:17:04'),
(3, 3, 'Preparando', '2026-10-07 14:17:04'),
(4, 4, 'Entregado', '2026-10-07 14:17:04'),
(5, 5, 'Cancelado', '2026-10-07 14:17:04');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
