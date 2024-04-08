-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dash_roles
CREATE DATABASE IF NOT EXISTS `dash_roles` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dash_roles`;

-- Volcando estructura para tabla dash_roles.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.categorias: ~4 rows (aproximadamente)
REPLACE INTO `categorias` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
	(1, 'Celulares', '2024-04-09 03:39:41', '2024-04-09 03:39:41'),
	(2, 'Computadores', '2024-04-09 03:39:46', '2024-04-09 03:39:46'),
	(3, 'Tabletas', '2024-04-09 03:39:53', '2024-04-09 03:39:53'),
	(4, 'TV', '2024-04-09 03:40:00', '2024-04-09 03:40:00');

-- Volcando estructura para tabla dash_roles.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dash_roles.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.migrations: ~6 rows (aproximadamente)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2024_04_08_033728_create_permission_tables', 1),
	(5, '2024_04_08_035810_create_categorias_table', 1),
	(6, '2024_04_08_040006_create_productos_table', 1);

-- Volcando estructura para tabla dash_roles.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.model_has_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dash_roles.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.model_has_roles: ~3 rows (aproximadamente)
REPLACE INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(3, 'App\\Models\\User', 3);

-- Volcando estructura para tabla dash_roles.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla dash_roles.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.permissions: ~16 rows (aproximadamente)
REPLACE INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'ver-rol', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(2, 'crear-rol', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(3, 'editar-rol', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(4, 'borrar-rol', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(5, 'ver-categoria', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(6, 'crear-categoria', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(7, 'editar-categoria', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(8, 'borrar-categoria', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(9, 'ver-producto', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(10, 'crear-producto', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(11, 'editar-producto', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(12, 'borrar-producto', 'web', '2024-04-09 03:30:33', '2024-04-09 03:30:33'),
	(13, 'ver-usuario', 'web', '2024-04-09 03:30:34', '2024-04-09 03:30:34'),
	(14, 'crear-usuario', 'web', '2024-04-09 03:30:34', '2024-04-09 03:30:34'),
	(15, 'editar-usuario', 'web', '2024-04-09 03:30:34', '2024-04-09 03:30:34'),
	(16, 'borrar-usuario', 'web', '2024-04-09 03:30:34', '2024-04-09 03:30:34');

-- Volcando estructura para tabla dash_roles.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb3_unicode_ci,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `categoria_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.productos: ~2 rows (aproximadamente)
REPLACE INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `categoria_id`, `created_at`, `updated_at`) VALUES
	(1, 'REDMI Note 13 256GB Negro', 'Resolucion Camara Posterior 1: 108 Mpx\r\nMemoria Interna: 256 GB\r\nMemoria RAM: 8 GB\r\nCapacidad de la Bateria: 5000 mAh', 899900.00, 4, 1, '2024-04-09 03:41:39', '2024-04-09 03:41:39'),
	(2, 'Tablet LENOVO', 'Tablet LENOVO 12,7" Pulgadas - P12 - TB370FU - 256GB - WiFi - Color Gris', 2099000.00, 5, 3, '2024-04-09 03:42:35', '2024-04-09 03:42:35');

-- Volcando estructura para tabla dash_roles.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.roles: ~3 rows (aproximadamente)
REPLACE INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'web', '2024-04-09 03:31:41', '2024-04-09 03:31:41'),
	(2, 'Publicista', 'web', '2024-04-09 03:32:22', '2024-04-09 03:32:22'),
	(3, 'Invitado', 'web', '2024-04-09 03:32:47', '2024-04-09 03:32:47');

-- Volcando estructura para tabla dash_roles.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.role_has_permissions: ~27 rows (aproximadamente)
REPLACE INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(5, 2),
	(6, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 2),
	(13, 2),
	(14, 2),
	(5, 3),
	(9, 3),
	(10, 3);

-- Volcando estructura para tabla dash_roles.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla dash_roles.users: ~3 rows (aproximadamente)
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Surper admin', 'admin@gmail.com', NULL, '$2y$10$D3CsDXbj9o1YNCAr2wgov.87AZnh08fCeVPQmmfp6CUeU.xRkICdq', NULL, '2024-04-09 03:31:17', '2024-04-09 03:31:17'),
	(2, 'Camila Rendon', 'Camila@gmail.com', NULL, '$2y$10$Fhl.JKFW5TLw5rAIKJ78jOF2jqrHjQ1Dt5LwzYoh744VM2LYEO/6q', NULL, '2024-04-09 03:33:34', '2024-04-09 03:33:34'),
	(3, 'David', 'David@gmail.com', NULL, '$2y$10$Fjr1Zs9O7ekah859qCPgheQlTnxkFIYOE2anf0i3FwXC1nlRAtD4K', NULL, '2024-04-09 03:36:08', '2024-04-09 03:36:08');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
