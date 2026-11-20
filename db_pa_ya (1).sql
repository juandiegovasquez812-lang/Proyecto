-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 20-11-2026 a las 01:04:34
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
-- Estructura de tabla para la tabla `comercios`
--

CREATE TABLE `comercios` (
  `comercio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT 1,
  `categoria_comercio_id` int(11) DEFAULT NULL,
  `nombre_comercial` varchar(100) NOT NULL,
  `nit_rut` varchar(20) DEFAULT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comercios`
--

INSERT INTO `comercios` (`comercio_id`, `usuario_id`, `categoria_comercio_id`, `nombre_comercial`, `nit_rut`, `direccion`, `telefono`) VALUES
(1, 1, 2, 'KFC', ' 900.439.301-2', 'Carrera 13 #15-23 Engativa', '3001232345'),
(2, 1, 5, 'Dog Chow', ' 830.050.346-8', 'Av. 19 Norte', '+571987654'),
(3, 1, 1, 'Popsy', '860053831-1', 'Av 19 #19-17 Santa Fe', '3103455678'),
(4, 1, 5, 'Hills', '9004195869-1', 'Calle 100 con 15', '+571555443'),
(5, 1, 5, 'Snau', ' 902.049.573-2.', 'CC Santa Fe Local 40', '+571888999'),
(6, 1, 4, 'Farmatodo', '830.129.327-1', 'Carrera 11ª No. 98-50, Of. 301-302, Bogotá D.C.', ' (601) 7432100'),
(7, 1, 4, 'Cruz Verde', ': 800.149.695-1', ' Carrera 12 # 96-32', '601 486 5000'),
(8, 1, 4, 'Drogueria Alemana', '890208788-9', 'Carrera 75 No. 24 - 20 ', '(601) 411 1010'),
(9, 1, 3, 'Fallabella', ' 900.017.447-8 ', 'Calle 99 # 11A – 32', 'Calle 99 # 11A – 32'),
(10, 1, 3, 'Ktronix', '890.900.943-1', ' Calle 11 No. 31 A – 42 ', '(601) 407 3033'),
(11, 1, 3, 'DollarCity', ' 900943243-4', 'Av. 3 # 57 Norte – 30, Cali, Valle del Cauca, Colombia', '+57 (2) 3876000'),
(12, 1, 1, 'McDonalds', '800.244.387-4', ' Av. 116 # 7-15 (Oficina 1402, Edificio Cusezar)', 'contactos@mcdonalds.'),
(13, 7, NULL, 'Restaurante Elver Galarga', '123456789-0', 'Cra 12 #23-34 Bogota', '3006390011'),
(14, 7, NULL, 'Restaurante prueba', '9010345-9', 'Cra 13 #13-14 Bogota', '3003016699');

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
  `direccion` varchar(150) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `barrio_localidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direcciones_usuario`
--

INSERT INTO `direcciones_usuario` (`direccion_id`, `usuario_id`, `direccion`, `ciudad`, `barrio_localidad`) VALUES
(1, 1, 'Calle 85 #11-32', 'Bogotá', ''),
(2, 1, 'Av. El Dorado #69-70', 'Bogotá', ''),
(3, 2, 'Carrera 43A #5A-100', 'Medellín', ''),
(4, 3, 'Calle 10 #34-20', 'Cali', ''),
(5, 4, 'Avenida Principal 45', 'Barranquilla', ''),
(6, 6, 'Cra 72 #23-34', 'Bogota', 'Engativa'),
(7, 1, 'Cra 1 3#13-13', 'Medellin', 'Comuna 13'),
(8, 1, 'Cra 110 #12-13', 'Barranquilla', 'Maloca'),
(10, 7, 'Prueba_cambio', 'Pereira', 'Prueba_cambio');

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
  `usuario_id` int(11) NOT NULL DEFAULT 1,
  `tipo_tarjeta` enum('Visa','Mastercard','American Express','Otro') NOT NULL DEFAULT 'Visa',
  `numero_tarjeta` varchar(20) DEFAULT NULL,
  `fecha_expedicion` varchar(10) DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `nombre_titular` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodos_pago`
--

INSERT INTO `metodos_pago` (`metodo_pago_id`, `usuario_id`, `tipo_tarjeta`, `numero_tarjeta`, `fecha_expedicion`, `cvv`, `nombre_titular`) VALUES
(1, 1, 'Visa', NULL, NULL, NULL, 'Tarjeta de Crédito Visa'),
(2, 1, 'Visa', NULL, NULL, NULL, 'Tarjeta de Débito Mastercard'),
(3, 1, 'Visa', NULL, NULL, NULL, 'Efectivo contra entrega'),
(4, 1, 'Visa', NULL, NULL, NULL, 'Billetera Digital App'),
(5, 1, 'Visa', NULL, NULL, NULL, 'Transferencia Bancaria'),
(6, 1, 'Visa', '1234567890', '12/23', '123', 'Mariana Rios'),
(8, 7, 'Mastercard', '0987654321', '00/00', '1234', 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `categoria_producto_id` int(11) DEFAULT NULL,
  `comercio_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `categoria_producto_id`, `comercio_id`, `nombre`, `descripcion`, `precio`) VALUES
(7, NULL, 2, 'Purina Adulto 2 kg', 'Alimento para perros adultos que proporciona los nutrientes necesarios para mantener una buena alimentación, contribuyendo a su bienestar y vitalidad.', 25000.00),
(8, NULL, 2, 'Purina Comida Húmeda', 'Alimento húmedo ideal para complementar la alimentación diaria, con una textura suave y deliciosa.', 2900.00),
(9, NULL, 2, 'Purina Cachorros 2 kg', 'Alimento diseñado para cachorros en etapa de crecimiento que aporta nutrientes necesarios para favorecer su desarrollo.', 30000.00),
(10, NULL, 2, 'Purina Alta Proteína 2 kg', 'Alimento con un contenido destacado de proteínas que contribuye al mantenimiento de los músculos y la energía.', 27500.00),
(11, NULL, 2, 'Purina Adulto 5 kg', 'Alimento para perros adultos en una presentación práctica para su alimentación diaria.', 75000.00),
(12, NULL, 8, 'Losartán Genfar 30 tabletas', 'Medicamento utilizado para el tratamiento de la presión arterial alta y la protección de la salud cardiovascular.', 11000.00),
(13, NULL, 8, 'Postday Levonorgestrel', 'Anticonceptivo de emergencia que ayuda a prevenir un embarazo después de una relación sexual sin protección.', 12000.00),
(14, NULL, 8, 'Rybelsus 30 tabletas', 'Medicamento que ayuda a controlar los niveles de azúcar en la sangre en adultos con diabetes tipo 2.', 379000.00),
(15, NULL, 8, 'Electrolit Suero', 'Bebida con electrolitos que ayuda a reponer líquidos y minerales que pierde el organismo.', 7100.00),
(16, NULL, 8, 'Agua Micelar Garnier', 'Producto de limpieza facial que ayuda a retirar el maquillaje, las impurezas y los residuos acumulados en la piel.', 17000.00),
(17, NULL, 9, 'Licuadora inteligente Ninja', 'Diseñada para facilitar la preparación de bebidas, batidos, jugos y diferentes recetas.', 1200000.00),
(18, NULL, 9, 'Juego de ollas Universal', 'Ideal para equipar la cocina y preparar diferentes alimentos de manera práctica y funcional.', 323000.00),
(19, NULL, 9, 'Audífonos Samsung Buds', 'Audífonos inalámbricos que permiten escuchar música, disfrutar de contenido multimedia y atender llamadas.', 160000.00),
(20, NULL, 9, 'TV LG 58 pulgadas NANO 4K UHD', 'Televisor con tecnología NanoCell y resolución 4K UHD que ofrece imágenes detalladas y colores definidos.', 1900000.00),
(21, NULL, 9, 'Samsung Galaxy S25 FE', 'Teléfono inteligente que ofrece herramientas para la comunicación, fotografía, entretenimiento y productividad.', 1800000.00),
(22, NULL, 5, 'Galletas para perro', 'Premios especiales para perros, ideales para complementar su alimentación y recompensar su buen comportamiento.', 12000.00),
(23, NULL, 5, 'Shampoo para perros', 'Producto de higiene diseñado para limpiar el pelaje, retirar la suciedad y mantener el pelo fresco.', 20000.00),
(24, NULL, 5, 'Concentrado 1 kg', 'Alimento seco que proporciona nutrientes para complementar la alimentación diaria.', 17500.00),
(25, NULL, 5, 'Concentrado 3 kg', 'Alimento para perros en una presentación práctica para mantener una reserva de comida.', 52500.00),
(26, NULL, 5, 'Concentrado 5 kg', 'Alimento seco en una presentación de mayor cantidad para facilitar la alimentación diaria de las mascotas.', 87500.00),
(27, NULL, 11, 'Paños de microfibra', 'Paños diseñados para limpiar diferentes superficies del hogar, ideales para retirar el polvo, la suciedad y las manchas sin rayar ni dejar residuos.', 18000.00),
(28, NULL, 11, 'Ganchos de terciopelo', 'Ganchos recubiertos de terciopelo que permiten organizar y colgar prendas de vestir, evitando que la ropa se resbale y ayudando a ahorrar espacio en el armario.', 10000.00),
(29, NULL, 11, 'Tabla de picar', 'Utensilio de cocina utilizado para cortar y preparar alimentos como frutas, verduras y carnes, proporcionando una superficie práctica para cocinar.', 16000.00),
(30, NULL, 11, 'Contenedores de plástico', 'Recipientes prácticos y livianos que permiten almacenar, conservar y organizar alimentos u otros objetos, facilitando el orden en la cocina y el hogar.', 7000.00),
(31, NULL, 11, 'Filtros para café número 2', 'Filtros de papel diseñados para cafeteras compatibles con tamaño número 2, que permiten preparar café separando los residuos del café molido y obteniendo una bebida más limpia.', 10000.00),
(32, NULL, 6, 'Bloqueador solar facial 50 ml', 'Producto diseñado para proteger la piel del rostro de los rayos solares, ayudando a prevenir quemaduras, manchas y daños causados por la exposición al sol. Su presentación de 50 ml es práctica para el uso diario.', 48000.00),
(33, NULL, 6, 'Sérum Garnier Express 30 ml', 'Tratamiento facial que ayuda a mejorar la apariencia de la piel, aportando hidratación y luminosidad. Su fórmula está diseñada para contribuir a una piel de aspecto más uniforme y saludable.', 66000.00),
(34, NULL, 6, 'Enjuague bucal Listerine', 'Producto de higiene oral que ayuda a combatir las bacterias, refrescar el aliento y complementar la limpieza diaria de los dientes y las encías.', 13000.00),
(35, NULL, 6, 'Shampoo La Poción 450 ml', 'Producto para el cuidado del cabello que ayuda a limpiar el cuero cabelludo y eliminar impurezas, dejando el cabello con una sensación de limpieza, suavidad y frescura.', 49000.00),
(36, NULL, 6, 'Allegra 10 tabletas', 'Medicamento antihistamínico utilizado para aliviar síntomas de alergias, como estornudos, picazón, secreción nasal y lagrimeo. Se debe utilizar siguiendo las indicaciones del empaque o de un profesional de la salud.', 68000.00),
(37, NULL, 4, 'Lata de pollo y vegetales', 'Alimento húmedo elaborado con pollo y vegetales, ideal para ofrecer a tu mascota una comida deliciosa y de textura suave. Ayuda a complementar su alimentación diaria y brinda variedad a su dieta.', 15000.00),
(38, NULL, 4, 'Alimento húmedo adulto', 'Alimento especialmente destinado a mascotas adultas, con una textura suave y agradable que facilita su consumo. Es una excelente opción para complementar su alimentación y ofrecerle una comida diferente y apetitosa.', 10500.00),
(39, NULL, 4, 'Purina raza pequeña 4.5 lb', 'Alimento seco diseñado para perros de razas pequeñas, formulado para satisfacer sus necesidades nutricionales. Sus croquetas están adaptadas al tamaño de su mandíbula y contribuyen a mantener una alimentación equilibrada.', 97000.00),
(40, NULL, 4, 'Purina dieta medicada 4 lb', 'Alimento especializado para perros que requieren una dieta nutricional específica debido a determinadas condiciones de salud. Está diseñado para apoyar sus necesidades alimenticias y debe suministrarse bajo recomendación veterinaria.', 104000.00),
(41, NULL, 4, 'Purina adulto 4.5 lb', 'Alimento seco para perros adultos, elaborado para proporcionar los nutrientes necesarios para su mantenimiento diario, ayudando a conservar una buena condición física y bienestar general.', 120000.00),
(42, NULL, 1, 'Combo BBQ Crunch', 'Delicioso combo que combina el sabor BBQ con pollo crujiente, preparado para ofrecer una experiencia llena de sabor y textura. Ideal para quienes disfrutan de los sabores intensos y las preparaciones crocantes.', 15000.00),
(43, NULL, 1, 'Aros de cebolla Burger', 'Aros de cebolla empanizados y fritos hasta obtener una textura dorada y crujiente. Son ideales para acompañar hamburguesas o disfrutar como una entrada deliciosa.', 22000.00),
(44, NULL, 1, 'Kentucky Sandwich', 'Sándwich preparado con pollo al estilo Kentucky, caracterizado por su sabor y textura crujiente. Una opción práctica y deliciosa para disfrutar en cualquier momento del día.', 14000.00),
(45, NULL, 1, 'Combo Coronel Burger', 'Hamburguesa inspirada en el estilo tradicional de KFC, acompañada de ingredientes que combinan diferentes sabores y texturas. Una excelente opción para quienes buscan una comida completa y deliciosa.', 28000.00),
(46, NULL, 1, 'Almuerzo 3 presas', 'Plato compuesto por tres piezas de pollo preparado al estilo KFC, ideal para disfrutar de su característico sabor y textura crujiente. Una opción abundante para quienes desean una comida completa.', 28000.00),
(47, NULL, 10, 'Minibar Kalley Frost 44L', 'Minibar compacto de la marca Kalley, con capacidad de 44 litros, ideal para conservar bebidas y alimentos en espacios pequeños. Su diseño práctico permite aprovechar mejor el espacio en habitaciones, oficinas o apartamentos.', 700000.00),
(48, NULL, 10, 'Adaptador Apple 40W', 'Adaptador de corriente Apple de 40W, diseñado para proporcionar una carga eficiente y segura a dispositivos compatibles. Es una opción práctica para cargar celulares y otros equipos electrónicos compatibles.', 230000.00),
(49, NULL, 10, 'iPhone 17 Pro Max 256GB', 'Smartphone de Apple que ofrece un alto rendimiento, almacenamiento de 256 GB y tecnología avanzada. Cuenta con excelentes capacidades fotográficas, pantalla de gran calidad y funciones diseñadas para brindar una experiencia fluida.', 5250000.00),
(50, NULL, 10, 'Motorola G Max 256GB', 'Teléfono inteligente Motorola con capacidad de almacenamiento de 256 GB, ideal para guardar fotografías, aplicaciones, videos y documentos. Una alternativa para quienes buscan funcionalidad, buen espacio de almacenamiento y rendimiento para sus actividades diarias.', 1150000.00),
(51, NULL, 10, 'Portátil DELL Essential', 'Computador portátil de la marca Dell, diseñado para realizar actividades académicas, laborales y personales. Permite trabajar con documentos, navegar por internet, utilizar programas y desarrollar diferentes tareas con comodidad.', 4900000.00),
(52, NULL, 12, 'Big Mac', 'Hamburguesa clásica de McDonalds, preparada con dos carnes de res, queso, lechuga, pepinillos, cebolla y su característica salsa especial, acompañada de un pan con semillas de ajonjolí. Una opción deliciosa para quienes disfrutan de las hamburguesas tradicionales.', 22000.00),
(53, NULL, 12, 'McCombo Mediano', 'Combo que incluye una hamburguesa a elección, papas fritas medianas y una bebida. Es una excelente alternativa para disfrutar de una comida completa, combinando diferentes sabores en una sola presentación.', 32000.00),
(54, NULL, 12, 'Cajita Feliz', 'Menú especialmente diseñado para niños, que incluye una hamburguesa o producto a elección, acompañamiento, bebida y un juguete sorpresa. Es una opción divertida y deliciosa para los más pequeños.', 24000.00),
(55, NULL, 12, 'Sundae', 'Postre elaborado con helado suave y cremoso, acompañado de una deliciosa salsa que puede variar según el sabor elegido. Ideal para disfrutar de algo dulce después de una comida.', 8000.00),
(56, NULL, 12, 'McFlurry', 'Postre de helado suave y cremoso mezclado con ingredientes dulces y trozos crujientes que le aportan una textura especial. Una opción perfecta para quienes disfrutan de los postres fríos y deliciosos.', 14000.00),
(57, NULL, 3, 'Malteada clásica 16 oz', 'Bebida cremosa y refrescante, elaborada a base de helado y leche, con una textura espesa y un delicioso sabor tradicional. Su presentación de 16 onzas es ideal para disfrutar de una bebida dulce y refrescante en cualquier momento.', 20000.00),
(58, NULL, 3, 'Granizado 16 oz', 'Bebida fría preparada con hielo triturado y sabores dulces, perfecta para refrescarse en días calurosos. Su textura granizada y su presentación de 16 onzas la convierten en una opción deliciosa y refrescante.', 13500.00),
(59, NULL, 3, 'Charlie Brawnie', 'Delicioso postre inspirado en el brownie de chocolate, ideal para los amantes de los sabores dulces. Su combinación de textura suave y sabor intenso a chocolate lo convierte en una excelente opción para disfrutar como merienda o postre.', 14000.00),
(60, NULL, 3, 'Litro de helado 600 g', 'Presentación de helado de 600 gramos, ideal para compartir en casa o disfrutar en diferentes ocasiones. Su textura cremosa y variedad de sabores permiten disfrutar de un postre delicioso en cualquier momento.', 40000.00),
(61, NULL, 3, 'Popsy Toy', 'Producto de Popsy que combina la diversión y el entretenimiento en una presentación especial. Es una alternativa atractiva para quienes buscan disfrutar de una experiencia diferente junto a los productos de la marca.', 11000.00),
(62, NULL, 7, 'Floratil 250 mg', 'Medicamento utilizado para ayudar a restablecer el equilibrio de la flora intestinal. Contiene un probiótico que contribuye al bienestar digestivo y se utiliza como apoyo en el tratamiento de episodios de diarrea.', 69000.00),
(63, NULL, 7, 'Congestex 10 cápsulas', 'Producto farmacéutico indicado para aliviar síntomas asociados a la congestión y molestias respiratorias, como la congestión nasal. Su uso debe realizarse siguiendo las indicaciones del empaque o de un profesional de la salud.', 18000.00),
(64, NULL, 7, 'PediaSure tarro 850 g', 'Suplemento nutricional infantil diseñado para complementar la alimentación de los niños. Aporta nutrientes, vitaminas y minerales que contribuyen al crecimiento y desarrollo, especialmente cuando la alimentación habitual necesita un refuerzo nutricional.', 78000.00),
(65, NULL, 7, 'Gelicart Advance 30 sobres', 'Suplemento nutricional formulado para apoyar el cuidado de las articulaciones. Está diseñado para complementar la alimentación y aportar componentes relacionados con el mantenimiento de los tejidos articulares.', 261000.00),
(66, NULL, 7, 'Allegra 10 tabletas', 'Medicamento antihistamínico utilizado para aliviar síntomas de alergias, como estornudos, secreción nasal, picazón y lagrimeo. Ayuda a controlar las molestias causadas por las reacciones alérgicas.', 72000.00);

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
  `contrasena` varchar(100) NOT NULL DEFAULT '1234',
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `email`, `contrasena`, `telefono`, `fecha_registro`) VALUES
(1, 'Mariana Ríos', 'mariana@email.com', '1234', '+573001111111', '2026-10-07 14:17:04'),
(2, 'Santiago Peña', 'santiago@email.com', '1234', '+573002222222', '2026-10-07 14:17:04'),
(3, 'Camila López', 'camila@email.com', '1234', '+573003333333', '2026-10-07 14:17:04'),
(4, 'Esteban Quito', 'esteban@email.com', '1234', '+573004444444', '2026-10-07 14:17:04'),
(5, 'Valeria Vélez', 'valeria@email.com', '1234', '+573005555555', '2026-10-07 14:17:04'),
(6, 'Nataly', 'nataly123@gmail.com', 'na234', '3115678777', '2026-11-18 13:30:52'),
(7, 'Admin', 'admin@gmail.com', '1', '3006390011', '2026-11-19 00:14:56'),
(8, 'perro loco', 'pendienteporpublicar@yopmail.com', 'silent*1', '3013036699', '2026-11-19 00:25:13');

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
-- Indices de la tabla `comercios`
--
ALTER TABLE `comercios`
  ADD PRIMARY KEY (`comercio_id`),
  ADD UNIQUE KEY `nit_rut` (`nit_rut`),
  ADD KEY `categoria_comercio_id` (`categoria_comercio_id`),
  ADD KEY `fk_comercios_usuario` (`usuario_id`);

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
  ADD PRIMARY KEY (`metodo_pago_id`),
  ADD KEY `fk_metodos_pago_usuario` (`usuario_id`);

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
-- AUTO_INCREMENT de la tabla `comercios`
--
ALTER TABLE `comercios`
  MODIFY `comercio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `direccion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `factura_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `metodo_pago_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

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
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Filtros para la tabla `cupones_descuento`
--
ALTER TABLE `cupones_descuento`
  ADD CONSTRAINT `fk_cupones_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
