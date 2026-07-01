-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para projeto_grid_go
CREATE DATABASE IF NOT EXISTS `projeto_grid_go` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `projeto_grid_go`;

-- Copiando estrutura para tabela projeto_grid_go.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  PRIMARY KEY (`id_admin`) USING BTREE,
  UNIQUE KEY `email_unico_admin` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.administrador: ~3 rows (aproximadamente)
REPLACE INTO `administrador` (`id_admin`, `nome`, `email`, `senha`, `data_cadastro`) VALUES
	(1, 'Juan Willian', 'juanwillian@gmail.com', '$2y$10$KilekjdPqVfTIaG2Z6Iw8uuVSRk2X8UpZn2ApJYlEaqo33DfsnJ1.', '2026-06-15 22:31:33'),
	(2, 'admin', 'admin@gridegol.com', '$2y$10$Cw.BsGE.SMpg0L.CFIAjKOFQUaOLgg4R4JYrVijEFExjtIsepOnTO', '2026-06-15 22:34:42'),
	(3, 'Natanael', 'perturbado@gmail.com', '$2y$10$GpKcYnDxx/7n.2jmSKE9M.//Gk/Gt1B4qUpiyuFEBvKXdMwbOvZAa', '0000-00-00 00:00:00');

-- Copiando estrutura para tabela projeto_grid_go.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.categoria: ~2 rows (aproximadamente)
REPLACE INTO `categoria` (`id_categoria`, `nome_categoria`, `descricao`) VALUES
	(1, 'Futebol', 'Tudo sobre o esporte mais conhecido no mundo!'),
	(2, 'Formula1', 'Conhece os produtos de auto-esporte mundial!');

-- Copiando estrutura para tabela projeto_grid_go.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email_unico_cliente` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.cliente: ~1 rows (aproximadamente)
REPLACE INTO `cliente` (`id_cliente`, `nome`, `email`, `senha`, `telefone`, `endereco`, `data_cadastro`) VALUES
	(1, 'HeMan', 'eutenhoaforca@eternia.com', '$2y$10$SnCaJnBe9IfP7xjfv6uqEOIMLRO74sB9eC2wtdIKKJbxPA63RqfGC', '219744343423', 'Rua greyskull', '2026-06-16 02:29:56');

-- Copiando estrutura para tabela projeto_grid_go.item_pedido
CREATE TABLE IF NOT EXISTS `item_pedido` (
  `id_item` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,0) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `FK_id_categoria` (`id_produto`),
  KEY `FK_item_pedido_pedido` (`id_pedido`),
  CONSTRAINT `FK_item_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.item_pedido: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela projeto_grid_go.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nome_marca` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.marca: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela projeto_grid_go.pagamento
CREATE TABLE IF NOT EXISTS `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `status_pagamento` varchar(50) NOT NULL,
  `valor_pago` decimal(10,0) NOT NULL,
  `data_pagamento` datetime NOT NULL,
  `id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `FK_pagamento_pedido` (`id_pedido`),
  CONSTRAINT `FK_pagamento_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.pagamento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela projeto_grid_go.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL,
  `data_pedido` datetime NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_pedido_cliente` (`id_cliente`),
  CONSTRAINT `FK_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.pedido: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela projeto_grid_go.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL DEFAULT '',
  `descricao` text NOT NULL,
  `preco` decimal(10,0) NOT NULL DEFAULT 0,
  `estoque` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `FK_id_categoria` (`id_categoria`),
  CONSTRAINT `FK_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.produto: ~2 rows (aproximadamente)
REPLACE INTO `produto` (`id_produto`, `nome`, `descricao`, `preco`, `estoque`, `imagem`, `id_categoria`) VALUES
	(1, 'Jaqueta Masculina Umbro Fluminense ', 'Tamanhos P, M, G e GX', 395, 40, 'b586b3fc75a13888cf42d7571527a520.jpg', 1),
	(2, 'Capacete oficial da formula 1', 'Capacete oficial da patrocinadora red bull', 600, 15, 'e55001efa8959ca423f4972e9171b0e7.jpg', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
