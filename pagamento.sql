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

-- Copiando estrutura para tabela projeto_grid_go.pagamento
CREATE TABLE IF NOT EXISTS `pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `forma_pagamento` varchar(50) NOT NULL,
  `status_pagamento` varchar(50) NOT NULL,
  `valor_pago` decimal(10,0) NOT NULL,
  `data_pagamento` datetime NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `cartao_numero` varchar(20) DEFAULT NULL,
  `cartao_nome` varchar(100) DEFAULT NULL,
  `cartao_validade` varchar(7) DEFAULT NULL,
  `cartao_cvv` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `FK_pagamento_pedido` (`id_pedido`),
  CONSTRAINT `FK_pagamento_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela projeto_grid_go.pagamento: ~3 rows (aproximadamente)
REPLACE INTO `pagamento` (`id_pagamento`, `forma_pagamento`, `status_pagamento`, `valor_pago`, `data_pagamento`, `id_pedido`, `cartao_numero`, `cartao_nome`, `cartao_validade`, `cartao_cvv`) VALUES
	(1, 'CARTAO', 'Aprovado', 1395, '2026-06-16 15:20:17', 155926, '**** **** **** 1234', 'JUAN WILLIAN', '0234', '345'),
	(4, 'CARTAO', 'Aprovado', 605, '2026-06-16 16:09:25', 526307, '**** **** **** 9876', 'JUAN WILLIAN', '02/28', '490'),
	(5, 'BOLETO', 'Aguardando Pagamento', 400, '2026-06-16 16:22:18', 237945, NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
