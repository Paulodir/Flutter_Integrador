-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.15 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para u524093236_bovinos
CREATE DATABASE IF NOT EXISTS `u524093236_bovinos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `u524093236_bovinos`;

-- Copiando estrutura para tabela u524093236_bovinos.alimentacao
CREATE TABLE IF NOT EXISTS `alimentacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minimo` float NOT NULL DEFAULT '0',
  `maximo` float NOT NULL DEFAULT '0',
  `racao` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.alimentacao: ~5 rows (aproximadamente)
DELETE FROM `alimentacao`;
/*!40000 ALTER TABLE `alimentacao` DISABLE KEYS */;
INSERT INTO `alimentacao` (`id`, `minimo`, `maximo`, `racao`) VALUES
	(1, 0, 14, '2 Kg'),
	(2, 14, 19, '3 Kg'),
	(3, 19, 24, '5 Kg'),
	(4, 24, 29, '7 Kg'),
	(5, 29, 35, '9 Kg'),
	(6, 35, 1000, 'Consulte um Veterinário');
/*!40000 ALTER TABLE `alimentacao` ENABLE KEYS */;

-- Copiando estrutura para tabela u524093236_bovinos.bovino
CREATE TABLE IF NOT EXISTS `bovino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raca_id` int(11) NOT NULL,
  `brinco` int(15) NOT NULL,
  `nome` varchar(35) DEFAULT NULL,
  `nascimento` date NOT NULL,
  `peso` float(10,3) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bovino_raca` (`raca_id`),
  KEY `FK_bovino_usuario` (`usuario_id`),
  CONSTRAINT `FK_bovino_raca` FOREIGN KEY (`raca_id`) REFERENCES `raca` (`id`),
  CONSTRAINT `FK_bovino_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.bovino: ~9 rows (aproximadamente)
DELETE FROM `bovino`;
/*!40000 ALTER TABLE `bovino` DISABLE KEYS */;
INSERT INTO `bovino` (`id`, `raca_id`, `brinco`, `nome`, `nascimento`, `peso`, `usuario_id`) VALUES
	(1, 1, 1234567890, 'Listrada', '2015-11-03', 515.600, 1),
	(3, 1, 473473473, 'Mimosa', '2016-06-03', 690.700, 2),
	(5, 1, 567890123, 'Gaúcha', '2019-11-03', 550.000, 1),
	(6, 1, 64646, NULL, '2019-11-03', 200.330, 2),
	(7, 1, 1212121212, 'Laranja', '2019-01-03', 459.600, 1),
	(10, 1, 212312233, 'Emboaba', '2015-11-13', 600.000, 1),
	(11, 1, 212312233, 'Chucra', '2015-11-13', 600.000, 1),
	(17, 1, 1212121214, 'Mancinha', '2015-01-03', 459.111, 1),
	(18, 1, 1212121214, 'Estrelinha', '2015-01-03', 459.111, 1);
/*!40000 ALTER TABLE `bovino` ENABLE KEYS */;

-- Copiando estrutura para tabela u524093236_bovinos.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.ci_sessions: ~42 rows (aproximadamente)
DELETE FROM `ci_sessions`;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
	('t8l8qpn3uv274ajr5lmko9jajg6013kg', '127.0.0.1', 1573692041, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333639323034313B),
	('r9733agfift86cifd6o67dqqecvboc43', '127.0.0.1', 1573692079, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333639323034313B),
	('qf0kh0mbd559hl3tqn8v14csul0nmrv0', '127.0.0.1', 1573843445, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834333434353B),
	('jbr7f7sq6k95hm8t8vt02af6tkulbee3', '127.0.0.1', 1573844316, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834343331363B),
	('tb608ia6hdqd8bja5alq06b4hdmu28ud', '127.0.0.1', 1573845070, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834353037303B),
	('fl2m2e4jbepu5d57213gpb2a8db14a0q', '127.0.0.1', 1573845412, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834353431323B),
	('3g5itsai1cqhue0mf9vs617scnqvml84', '127.0.0.1', 1573845716, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834353731363B),
	('r5o1dp7h1h65udpmhnsg2jgq5b7nshf3', '127.0.0.1', 1573846120, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834363132303B),
	('2nfmv15f09rq56v6vrqoese8q2r87g23', '127.0.0.1', 1573846490, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834363439303B),
	('a82nfhpmvfrnrdrs58h4tlfhnjul10hs', '127.0.0.1', 1573847068, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834373036383B),
	('0pqrt56kmict08pjk3uhth5hjcn602um', '127.0.0.1', 1573847383, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834373338333B),
	('6dke632s2u5rikbekjvuh6ibmq5gdf75', '127.0.0.1', 1573847764, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834373736343B),
	('6v6tlp2tpmn97f5c334htq0c9a9a58jf', '127.0.0.1', 1573848168, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834383136383B),
	('kec6js54mtievtvgcmhnm38slqilng8a', '127.0.0.1', 1573848672, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834383637323B),
	('jl90ddbkcsgokc0jfuhpcfhh1cg6dudm', '127.0.0.1', 1573849013, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834393031333B),
	('ltu8b7kjaf28bb93v4ja0nff8ei2nkql', '127.0.0.1', 1573849760, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834393736303B),
	('s51k68np7chf6di55uk5j1oa3avm8nmv', '127.0.0.1', 1573849761, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333834393736303B),
	('6pqmdvf37108hdo3bc1krcag89000j33', '127.0.0.1', 1573857423, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333835373431373B),
	('v86lepudemph91e7jocc8kdss7s5ocec', '127.0.0.1', 1574020898, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343032303839383B),
	('3gpqnveg8ag8hj6b38tn4hiovr40pbqo', '127.0.0.1', 1574020899, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343032303839383B),
	('5b54ag9fulq9id5d49v7l9pqtnpoh4nh', '127.0.0.1', 1574550852, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343535303834373B),
	('3mk0jk2p4q201bu71nliujdebolo97mk', '127.0.0.1', 1574907752, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343930373735323B),
	('f9blp56sf05g5qpvucjlsmk9q78t6gjg', '127.0.0.1', 1574908329, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343930383332393B),
	('lv44599n5b5tmhdmcgrepba4reave7h5', '127.0.0.1', 1574908660, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343930383636303B),
	('01b78dhhq8jhnqopmv7gt5cd3p4dp5cu', '127.0.0.1', 1574911707, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343931313730373B),
	('b6fr0gbd5ihrclpfbukd3hu5v7lmp58c', '127.0.0.1', 1574912026, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343931323032363B),
	('8kefq9jjqsvmae8a7jkg4uctcuuh9m54', '127.0.0.1', 1574912441, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343931323434313B),
	('m9u5plv3kcbornukpph22dken1ernvms', '127.0.0.1', 1574912826, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343931323832363B),
	('8d05mpqtrogu3sjg2abne9ret9mdb9je', '127.0.0.1', 1574913133, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343931333133333B),
	('1tnejerc9is5i9gjmibe9heqbf49kj8g', '127.0.0.1', 1574913135, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343931333133333B),
	('68i4to2v0srivp15gcigloda9du6b0sm', '127.0.0.1', 1574981940, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537343938313836323B),
	('uk0fpoqgjnm14a5ln1stkn7a76n90dvg', '127.0.0.1', 1575060627, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353036303632373B),
	('7lcn93hjv895h0oau1ldv0h96b43mevj', '127.0.0.1', 1575061326, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353036313332363B),
	('s8mpuol18v8baoti3vubtdqppb32q0lc', '127.0.0.1', 1575061485, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353036313332363B),
	('ubtp1qn1lvrkhsjgrfj8ivl2459vi6ur', '127.0.0.1', 1575149148, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353134393134383B),
	('sdi37ie35omotehoteqmfde96cu7celu', '127.0.0.1', 1575149222, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353134393134383B),
	('bou0qdjflqaellv5d1c9jvun2cngfijj', '127.0.0.1', 1575157604, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353135373630313B),
	('k1p9srhe2icmvu6v8dvkikt1mo8avu0b', '127.0.0.1', 1575230708, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353233303730363B),
	('3o4iapmvm8779ftr4k05qh29eh9h2qd8', '127.0.0.1', 1575258031, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353235383033313B),
	('u0geite7l139ttb6dultbco0g6l357c9', '127.0.0.1', 1575258032, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353235383033313B),
	('4hh7strapoe89uae9u2llld8q6pt4jc9', '127.0.0.1', 1575297596, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353239373539363B),
	('85ml997ibb817qveivs9bi43g46smo60', '127.0.0.1', 1575297883, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313537353239373539363B);
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;

-- Copiando estrutura para tabela u524093236_bovinos.inseminacao
CREATE TABLE IF NOT EXISTS `inseminacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bovino_id` int(11) NOT NULL,
  `raca_id` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_natalidade_bovino` (`bovino_id`),
  KEY `FK_natalidade_raca` (`raca_id`),
  CONSTRAINT `FK_natalidade_bovino` FOREIGN KEY (`bovino_id`) REFERENCES `bovino` (`id`),
  CONSTRAINT `FK_natalidade_raca` FOREIGN KEY (`raca_id`) REFERENCES `raca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.inseminacao: ~2 rows (aproximadamente)
DELETE FROM `inseminacao`;
/*!40000 ALTER TABLE `inseminacao` DISABLE KEYS */;
INSERT INTO `inseminacao` (`id`, `bovino_id`, `raca_id`, `data`) VALUES
	(2, 7, 1, '2017-11-03'),
	(3, 1, 1, '2019-06-04');
/*!40000 ALTER TABLE `inseminacao` ENABLE KEYS */;

-- Copiando estrutura para tabela u524093236_bovinos.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.logs: ~107 rows (aproximadamente)
DELETE FROM `logs`;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
	(281, 'rest/Bovino/Resumo/1', 'get', 'a:11:{s:2:"id";s:1:"1";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"501e0e84-652b-4fbe-a0d6-58d39205ff05";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=t8l8qpn3uv274ajr5lmko9jajg6013kg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573690620, 1573690000, '1', 200),
	(282, 'rest/Bovino/Resumo/4', 'get', 'a:11:{s:2:"id";s:1:"4";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"256adb39-a001-4ea9-b9cf-a7addaf23b64";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=t8l8qpn3uv274ajr5lmko9jajg6013kg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573690625, 1573690000, '1', 200),
	(283, 'rest/Bovino/Resumo', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"ce67b7b2-df08-4fc9-96ef-194f061c0eeb";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=t8l8qpn3uv274ajr5lmko9jajg6013kg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573690631, 1573690000, '1', 200),
	(284, 'rest/bovino/1', 'get', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"2d909705-e0ed-426c-9d59-87ee0f46c7a0";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"81";s:6:"Cookie";s:43:"ci_session=r9733agfift86cifd6o67dqqecvboc43";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573692078, 1573690000, '1', 200),
	(285, 'rest/Bovino', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"181f942e-8123-4f98-ac87-e3b6820ebd2b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"113";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573843015, 1573840000, '1', 200),
	(286, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"8ec1c3de-c378-4cf1-8dd4-90967f24cbdf";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"163";s:6:"Cookie";s:43:"ci_session=qf0kh0mbd559hl3tqn8v14csul0nmrv0";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:8:"Mancinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573843112, 1573840000, '1', 0),
	(287, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"12ad89d0-2587-4754-b1ed-ab0cea0c0c69";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"163";s:6:"Cookie";s:43:"ci_session=qf0kh0mbd559hl3tqn8v14csul0nmrv0";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:8:"Mancinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573843264, 1573840000, '1', 0),
	(288, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"ba59405a-7602-422c-aa53-fab2090c5e04";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"163";s:6:"Cookie";s:43:"ci_session=qf0kh0mbd559hl3tqn8v14csul0nmrv0";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:8:"Mancinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573843267, 1573840000, '1', 0),
	(289, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"0201c811-5730-4e8b-84af-334f6def69eb";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"163";s:6:"Cookie";s:43:"ci_session=qf0kh0mbd559hl3tqn8v14csul0nmrv0";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:8:"Mancinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573843445, 1573840000, '1', 0),
	(290, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"536faa28-19fb-4331-84a9-c79d371bc1f1";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"163";s:6:"Cookie";s:43:"ci_session=jbr7f7sq6k95hm8t8vt02af6tkulbee3";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:8:"Mancinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573843476, 1573840000, '1', 0),
	(291, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"30d19443-7635-4b9b-a3e2-697518b7279e";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"163";s:6:"Cookie";s:43:"ci_session=jbr7f7sq6k95hm8t8vt02af6tkulbee3";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:8:"Mancinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573844317, 1573840000, '1', 0),
	(292, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"bd9c137a-0992-41c8-a3fc-3da8cf228c2b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"163";s:6:"Cookie";s:43:"ci_session=tb608ia6hdqd8bja5alq06b4hdmu28ud";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:8:"Mancinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845071, 1573850000, '1', 0),
	(293, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"daa91088-bd65-49bf-9162-0026038c8547";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=fl2m2e4jbepu5d57213gpb2a8db14a0q";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845208, 1573850000, '1', 0),
	(294, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"ba4416f4-f489-41f6-9948-b7fadb8529ef";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=fl2m2e4jbepu5d57213gpb2a8db14a0q";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845228, 1573850000, '1', 0),
	(295, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"f10f8f29-4e81-4a55-bd29-f01ba83cb076";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=fl2m2e4jbepu5d57213gpb2a8db14a0q";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845300, 1573850000, '1', 0),
	(296, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9131e83b-4805-433c-81f8-78e9c78104e0";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=fl2m2e4jbepu5d57213gpb2a8db14a0q";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845333, 1573850000, '1', 0),
	(297, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"3f197e86-3f7b-4460-a7d5-a9e4503ea282";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=fl2m2e4jbepu5d57213gpb2a8db14a0q";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845357, 1573850000, '1', 0),
	(298, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9042aacb-b38d-43fd-bac2-d294d4d1fc1d";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=fl2m2e4jbepu5d57213gpb2a8db14a0q";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845370, 1573850000, '1', 0),
	(299, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9cc54288-a207-4ccc-9483-f3ea66e68774";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=fl2m2e4jbepu5d57213gpb2a8db14a0q";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845412, 1573850000, '1', 0),
	(300, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"402dd314-f17f-4e81-91fb-f8ed1473a37b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=3g5itsai1cqhue0mf9vs617scnqvml84";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845451, 1573850000, '1', 0),
	(301, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a222d132-e050-4d5d-a7b2-89a186ed8cc6";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=3g5itsai1cqhue0mf9vs617scnqvml84";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845532, 1573850000, '1', 0),
	(302, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"b649c627-9f84-4c93-9892-9071a3f63305";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=3g5itsai1cqhue0mf9vs617scnqvml84";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845603, 1573850000, '1', 0),
	(303, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"0ba65b0e-6403-4330-aa04-60e3d26c278b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=3g5itsai1cqhue0mf9vs617scnqvml84";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845620, 1573850000, '1', 0),
	(304, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"5d95c1a6-2660-4b6e-aacc-260a2702c180";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=3g5itsai1cqhue0mf9vs617scnqvml84";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845671, 1573850000, '1', 0),
	(305, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"620c5ecc-c7f8-4e80-bb94-019a2d42eb61";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=3g5itsai1cqhue0mf9vs617scnqvml84";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845716, 1573850000, '1', 0),
	(306, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"c5bef4fa-f3ae-43a5-9a91-64e00b073c9f";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=r5o1dp7h1h65udpmhnsg2jgq5b7nshf3";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845742, 1573850000, '1', 0),
	(307, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"c603c4ec-b948-4575-8789-65f0604c53f3";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=r5o1dp7h1h65udpmhnsg2jgq5b7nshf3";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845814, 1573850000, '1', 0),
	(308, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"5d0aab63-3e83-418f-ada3-6607b25974dc";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=r5o1dp7h1h65udpmhnsg2jgq5b7nshf3";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845848, 1573850000, '1', 0),
	(309, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"75933433-11bc-4162-9b79-04fd37f48781";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=r5o1dp7h1h65udpmhnsg2jgq5b7nshf3";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573845976, 1573850000, '1', 0),
	(310, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"08dd6eda-d109-4c21-9886-7b2a2d6fb96c";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=r5o1dp7h1h65udpmhnsg2jgq5b7nshf3";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573846120, 1573850000, '1', 0),
	(311, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"6e0166b0-587f-435f-a196-7fd3b1534ae8";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=2nfmv15f09rq56v6vrqoese8q2r87g23";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573846339, 1573850000, '1', 0),
	(312, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"32699636-5984-43cd-ba04-f8bd659dfee7";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"165";s:6:"Cookie";s:43:"ci_session=2nfmv15f09rq56v6vrqoese8q2r87g23";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:10:"Estrelinha";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573846373, 1573850000, '1', 200),
	(313, 'rest/bovino/1', 'post', 'a:16:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"da1cbdb1-175f-4267-acdd-ef486fbd7724";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"162";s:6:"Cookie";s:43:"ci_session=2nfmv15f09rq56v6vrqoese8q2r87g23";s:10:"Connection";s:10:"keep-alive";s:7:"raca_id";s:1:"1";s:6:"brinco";s:10:"1212121214";s:4:"nome";s:7:"Pequena";s:10:"nascimento";s:10:"2015-01-03";s:4:"peso";s:7:"459.111";}', 'acesso', '127.0.0.1', 1573846490, 1573850000, '1', 200),
	(314, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"0048c191-12bb-4ba9-a5f9-5e98f7656d8c";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=a82nfhpmvfrnrdrs58h4tlfhnjul10hs";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847069, 1573850000, '1', 400),
	(315, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"3b124f47-4b7c-4735-89ab-ceff1741607d";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=0pqrt56kmict08pjk3uhth5hjcn602um";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847113, 1573850000, '1', 400),
	(316, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"59e564ef-4328-44f8-b078-d38e65f97f3a";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=0pqrt56kmict08pjk3uhth5hjcn602um";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847223, 1573850000, '1', 400),
	(317, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"75977740-9c91-428f-ab34-4d4cc3be7384";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=0pqrt56kmict08pjk3uhth5hjcn602um";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847238, 1573850000, '1', 400),
	(318, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"7ce12388-18f5-4a1c-9783-ee29a6d5fa59";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=0pqrt56kmict08pjk3uhth5hjcn602um";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847319, 1573850000, '1', 0),
	(319, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"96de1ec3-8102-476a-9686-41a9c5cd913b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=0pqrt56kmict08pjk3uhth5hjcn602um";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847341, 1573850000, '1', 0),
	(320, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9e50aabb-d0ed-4714-9c75-ce7c712ce7ea";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=0pqrt56kmict08pjk3uhth5hjcn602um";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847355, 1573850000, '1', 0),
	(321, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"dcbb153e-0044-4039-a408-238433cc836b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=0pqrt56kmict08pjk3uhth5hjcn602um";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847383, 1573850000, '1', 0),
	(322, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a13da68e-439a-49c1-acd8-afe4aedcba7f";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6dke632s2u5rikbekjvuh6ibmq5gdf75";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847395, 1573850000, '1', 0),
	(323, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"e02704cf-3370-4f01-bbe0-1c45e21d19a2";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6dke632s2u5rikbekjvuh6ibmq5gdf75";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847412, 1573850000, '1', 0),
	(324, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"36577467-0424-4842-9af1-1b4f7e1b7a79";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6dke632s2u5rikbekjvuh6ibmq5gdf75";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847518, 1573850000, '1', 0),
	(325, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a5e73c91-d0c2-43f1-b7f1-55f59f72f545";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6dke632s2u5rikbekjvuh6ibmq5gdf75";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847535, 1573850000, '1', 400),
	(326, 'rest/bovino/19', 'delete', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"b9946b74-952f-4764-a826-3c9fc61fd6dd";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6dke632s2u5rikbekjvuh6ibmq5gdf75";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847660, 1573850000, '1', 400),
	(327, 'rest/Bovino/19', 'delete', 'a:12:{s:2:"id";s:2:"19";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"05b6f58e-f7ca-49db-970c-ad05d219ded3";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6dke632s2u5rikbekjvuh6ibmq5gdf75";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847764, 1573850000, '1', 0),
	(328, 'rest/Bovino/19', 'delete', 'a:12:{s:2:"id";s:2:"19";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"bc808919-7d8a-414f-ba79-1dc6b9c69f3c";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6v6tlp2tpmn97f5c334htq0c9a9a58jf";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847795, 1573850000, '1', 200),
	(329, 'rest/Bovino/2', 'delete', 'a:12:{s:2:"id";s:1:"2";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"dedf8349-59d3-4fb6-93e1-49d05f3615b4";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6v6tlp2tpmn97f5c334htq0c9a9a58jf";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573847824, 1573850000, '1', 200),
	(330, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"3ea03580-e32d-44bf-9fc7-9a8caf935826";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=6v6tlp2tpmn97f5c334htq0c9a9a58jf";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573848169, 1573850000, '1', 400),
	(331, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"76d4b34f-3245-4eeb-9739-ea80341222bf";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=kec6js54mtievtvgcmhnm38slqilng8a";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573848214, 1573850000, '1', 400),
	(332, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"b372b0a0-9aa5-452f-8a72-41f1425a9122";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=kec6js54mtievtvgcmhnm38slqilng8a";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573848248, 1573850000, '1', 0),
	(333, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"751345bc-6f2a-4cca-bebf-2ec557272ff0";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=kec6js54mtievtvgcmhnm38slqilng8a";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573848268, 1573850000, '1', 0),
	(334, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a7c24e77-e316-4e76-833a-bc705929f80d";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=kec6js54mtievtvgcmhnm38slqilng8a";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573848320, 1573850000, '1', 200),
	(335, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9deda8dd-0c0d-431c-a961-d274ed7fce25";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=kec6js54mtievtvgcmhnm38slqilng8a";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573848672, 1573850000, '1', 0),
	(336, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"feec4bcb-5bcc-4b07-815b-b4f6eeff84fb";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=jl90ddbkcsgokc0jfuhpcfhh1cg6dudm";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573848696, 1573850000, '1', 0),
	(337, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"097c6675-2468-44a8-9549-864a05b70835";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=jl90ddbkcsgokc0jfuhpcfhh1cg6dudm";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573849014, 1573850000, '1', 0),
	(338, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:7:"acessod";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"39d35a71-aad7-48cd-8d48-a8bfdc2b0d55";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=ltu8b7kjaf28bb93v4ja0nff8ei2nkql";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', '', '127.0.0.1', 1573849250, 1573850000, '0', 403),
	(339, 'rest/Bovino/12', 'delete', 'a:12:{s:2:"id";s:2:"12";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"423c4396-6882-43b2-9b93-9fce1e271e8b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=ltu8b7kjaf28bb93v4ja0nff8ei2nkql";s:14:"Content-Length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1573849760, 1573850000, '1', 400),
	(340, 'rest/Raca', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"3ae7b7bf-bfad-47fe-8c60-82959aaac57b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"81";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574016528, 1574020000, '1', 200),
	(341, 'rest/Raca', 'get', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.19.0";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"f234817b-ace5-43b8-b5d3-d77c411430c7";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"81";s:6:"Cookie";s:43:"ci_session=v86lepudemph91e7jocc8kdss7s5ocec";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574020898, 1574020000, '1', 200),
	(342, 'rest/Ordenha', 'get', 'a:9:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"5143ec1d-ef70-4407-99ee-53a13e17bff7";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574550848, 1574550000, '1', 200),
	(343, 'rest/Partos/1', 'get', 'a:10:{s:2:"id";s:1:"1";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"2e2d7e43-1f3f-4bda-9362-82348e73fa0b";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574907431, 1574910000, '1', 0),
	(344, 'rest/Partos/1', 'get', 'a:11:{s:2:"id";s:1:"1";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"8b5bdbb9-ce77-4f7c-8a51-4457facff975";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=3mk0jk2p4q201bu71nliujdebolo97mk";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574907489, 1574910000, '1', 200),
	(345, 'rest/Partos/1', 'get', 'a:11:{s:2:"id";s:1:"1";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"60454e9d-bd08-4664-bf71-09f48c894770";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=3mk0jk2p4q201bu71nliujdebolo97mk";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574907707, 1574910000, '1', 200),
	(346, 'rest/Partos/1', 'get', 'a:11:{s:2:"id";s:1:"1";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"e1e1298d-b836-4831-8d2d-140bfe38ee4f";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=3mk0jk2p4q201bu71nliujdebolo97mk";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574907752, 1574910000, '1', 200),
	(347, 'rest/Partos', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"5febd28c-4e96-4f8b-9527-b7cf516df85c";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=f9blp56sf05g5qpvucjlsmk9q78t6gjg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574907798, 1574910000, '1', 200),
	(348, 'rest/Partos', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"f79ae469-9e1b-400a-a53d-26ece77a8707";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=f9blp56sf05g5qpvucjlsmk9q78t6gjg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574907868, 1574910000, '1', 200),
	(349, 'rest/Partos', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"1829995c-ed82-44bf-8891-8d3dd2d29afa";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=f9blp56sf05g5qpvucjlsmk9q78t6gjg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574907943, 1574910000, '1', 200),
	(350, 'rest/Partos', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"179eb620-52e2-4c14-b046-9b93a36a1c30";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=f9blp56sf05g5qpvucjlsmk9q78t6gjg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574908006, 1574910000, '1', 200),
	(351, 'rest/Partos', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"66f95c51-49e6-48e1-ae4f-f08eb342d102";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=f9blp56sf05g5qpvucjlsmk9q78t6gjg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574908329, 1574910000, '1', 200),
	(352, 'rest/Partos', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"0e01067f-72a8-4afb-9790-6300f5be5ed9";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=lv44599n5b5tmhdmcgrepba4reave7h5";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574908591, 1574910000, '1', 200),
	(353, 'rest/Partos', 'post', 'a:15:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9ce20bb7-f1d9-494f-bce2-6496ac2bb01e";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"87";s:6:"Cookie";s:43:"ci_session=lv44599n5b5tmhdmcgrepba4reave7h5";s:10:"Connection";s:10:"keep-alive";s:2:"id";s:1:"1";s:9:"bovino_id";s:1:"1";s:4:"data";s:10:"2000-12-16";s:7:"nascido";s:1:"1";}', 'acesso', '127.0.0.1', 1574908661, 1574910000, '1', 200),
	(354, 'rest/Partos', 'post', 'a:15:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"0ed6ae02-a772-4964-8505-b820247755bd";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"87";s:6:"Cookie";s:43:"ci_session=01b78dhhq8jhnqopmv7gt5cd3p4dp5cu";s:10:"Connection";s:10:"keep-alive";s:2:"id";s:1:"1";s:9:"bovino_id";s:1:"1";s:4:"data";s:10:"21-10-1989";s:7:"nascido";s:1:"1";}', 'acesso', '127.0.0.1', 1574911708, 1574910000, '1', 200),
	(355, 'rest/Partos', 'post', 'a:15:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"2aceb523-5830-4b4a-a3eb-1dedbae11f3a";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"87";s:6:"Cookie";s:43:"ci_session=b6fr0gbd5ihrclpfbukd3hu5v7lmp58c";s:10:"Connection";s:10:"keep-alive";s:2:"id";s:1:"1";s:9:"bovino_id";s:1:"1";s:4:"data";s:10:"21-10-1989";s:7:"nascido";s:1:"1";}', 'acesso', '127.0.0.1', 1574912027, 1574910000, '1', 0),
	(356, 'rest/Partos', 'post', 'a:15:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"7c33f470-485c-4ea3-a9bc-dd4ad43b3fb6";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"87";s:6:"Cookie";s:43:"ci_session=8kefq9jjqsvmae8a7jkg4uctcuuh9m54";s:10:"Connection";s:10:"keep-alive";s:2:"id";s:1:"1";s:9:"bovino_id";s:1:"1";s:4:"data";s:10:"21-10-1989";s:7:"nascido";s:1:"1";}', 'acesso', '127.0.0.1', 1574912442, 1574910000, '1', 0),
	(357, 'rest/Partos', 'post', 'a:15:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"7de53c59-8022-4302-9822-2f34d82065c2";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"87";s:6:"Cookie";s:43:"ci_session=m9u5plv3kcbornukpph22dken1ernvms";s:10:"Connection";s:10:"keep-alive";s:2:"id";s:1:"1";s:9:"bovino_id";s:1:"1";s:4:"data";s:10:"21-10-1989";s:7:"nascido";s:1:"1";}', 'acesso', '127.0.0.1', 1574912826, 1574910000, '1', 200),
	(358, 'rest/Partos', 'post', 'a:15:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"dfcbbbce-782f-41bb-9824-bbc0160a45ff";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"87";s:6:"Cookie";s:43:"ci_session=8d05mpqtrogu3sjg2abne9ret9mdb9je";s:10:"Connection";s:10:"keep-alive";s:2:"id";s:1:"1";s:9:"bovino_id";s:1:"1";s:4:"data";s:10:"21-10-2017";s:7:"nascido";s:1:"1";}', 'acesso', '127.0.0.1', 1574912971, 1574910000, '1', 200),
	(359, 'rest/Partos/11', 'put', 'a:15:{s:2:"id";s:1:"1";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9bf182eb-aec1-45bb-b82e-07ec42b876e6";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"87";s:6:"Cookie";s:43:"ci_session=8d05mpqtrogu3sjg2abne9ret9mdb9je";s:10:"Connection";s:10:"keep-alive";s:9:"bovino_id";s:1:"1";s:4:"data";s:10:"21-10-2017";s:7:"nascido";s:1:"1";}', 'acesso', '127.0.0.1', 1574913134, 1574910000, '1', 200),
	(360, 'rest/Partos', 'get', 'a:9:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"93a826f3-da4b-4ab2-b568-bf1b9bcd344a";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1574981862, 1574980000, '1', 200),
	(361, 'rest/Partos', 'post', 'a:15:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"2ddbf6fb-c808-4a74-ac0f-54ed956a99e9";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:3:"106";s:6:"Cookie";s:43:"ci_session=68i4to2v0srivp15gcigloda9du6b0sm";s:10:"Connection";s:10:"keep-alive";s:2:"id";s:1:"1";s:9:"bovino_id";s:1:"1";s:4:"data";s:10:"21-10-2017";s:7:"nascido";s:20:"Bezerro Nascido Vivo";}', 'acesso', '127.0.0.1', 1574981940, 1574980000, '1', 200),
	(362, 'rest/Inseminacao', 'get', 'a:9:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"82012567-409f-459f-b22b-8cf53b36873f";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575060112, 1575060000, '1', 0),
	(363, 'rest/Inseminacao', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"8e3f8a10-d2be-4c9f-b50d-e76fff299a9f";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=uk0fpoqgjnm14a5ln1stkn7a76n90dvg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575060285, 1575060000, '1', 200),
	(364, 'rest/Inseminacao', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"8468cb60-d4d8-4b73-8ab1-845c553181e6";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=uk0fpoqgjnm14a5ln1stkn7a76n90dvg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575060358, 1575060000, '1', 0),
	(365, 'rest/Inseminacao', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"3e02933c-0c0c-43d1-8260-652a7588533e";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=uk0fpoqgjnm14a5ln1stkn7a76n90dvg";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575060627, 1575060000, '1', 200),
	(366, 'rest/Bovino', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"1dd887b8-87bb-4d4a-955a-22f9470eb65d";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=7lcn93hjv895h0oau1ldv0h96b43mevj";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575061327, 1575060000, '1', 0),
	(367, 'rest/Bovino/ordenha/2', 'get', 'a:12:{i:0;N;s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"52b8d1c7-bcf9-4cb1-85f4-52ccee0e26e2";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=s8mpuol18v8baoti3vubtdqppb32q0lc";s:10:"Connection";s:10:"keep-alive";i:1;N;}', 'acesso', '127.0.0.1', 1575061374, 1575060000, '1', 200),
	(368, 'rest/Bovino/ordenha/1', 'get', 'a:12:{i:0;N;s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"981dc5f2-d584-4343-8d05-7dd609f12d9f";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=s8mpuol18v8baoti3vubtdqppb32q0lc";s:10:"Connection";s:10:"keep-alive";i:1;N;}', 'acesso', '127.0.0.1', 1575061378, 1575060000, '1', 200),
	(369, 'rest/Bovino/1', 'get', 'a:11:{s:2:"id";s:1:"1";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"6e9ca5ee-9e58-40fa-9278-447ecafad966";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=s8mpuol18v8baoti3vubtdqppb32q0lc";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575061383, 1575060000, '1', 200),
	(370, 'rest/Bovino/1', 'get', 'a:11:{s:2:"id";s:1:"1";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a671aeca-8c35-4c04-8165-ffd58044ba35";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=s8mpuol18v8baoti3vubtdqppb32q0lc";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575061452, 1575060000, '1', 200),
	(371, 'rest/Bovino', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"72d19358-06fe-4ee5-9929-05cd9936612a";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=s8mpuol18v8baoti3vubtdqppb32q0lc";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575061484, 1575060000, '1', 200),
	(372, 'rest/Bovino/Ordenha', 'get', 'a:9:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9e96e635-f2d5-470f-be3d-81af17bfc13e";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575148767, 1575150000, '1', 200),
	(373, 'rest/Bovino/Alimentacao/4', 'get', 'a:11:{s:2:"id";s:1:"4";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"41407804-95b7-4d3a-a26e-825cd21e71b5";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=ubtp1qn1lvrkhsjgrfj8ivl2459vi6ur";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575148833, 1575150000, '1', 200),
	(374, 'rest/Bovino/Alimentacao', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"5ef24230-d24d-4f12-bca2-aaeab8a9d01f";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=ubtp1qn1lvrkhsjgrfj8ivl2459vi6ur";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575148839, 1575150000, '1', 200),
	(375, 'rest/Inseminacao/parto', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"e2c41ef8-d6b9-4552-baed-15acd7d76589";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=ubtp1qn1lvrkhsjgrfj8ivl2459vi6ur";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575148954, 1575150000, '1', 200),
	(376, 'rest/Inseminacao/Parto', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"aa1ca22b-a5f7-49d5-8d22-97cb68b34679";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=ubtp1qn1lvrkhsjgrfj8ivl2459vi6ur";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575149041, 1575150000, '1', 200),
	(377, 'rest/Bovino/ordenha', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"bd6b607b-eef1-46ef-be05-775bca372040";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:43:"ci_session=ubtp1qn1lvrkhsjgrfj8ivl2459vi6ur";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575149148, 1575150000, '1', 200),
	(378, 'rest/Bovino/ordenha', 'get', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"207e962f-4676-4ce9-b561-6b5782fad39c";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:6:"Cookie";s:43:"ci_session=sdi37ie35omotehoteqmfde96cu7celu";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575149221, 1575150000, '1', 200),
	(379, 'rest/Bovino/Resumo', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"05bd6507-d76a-4e7a-b146-022734f443ed";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575157602, 1575160000, '1', 200),
	(380, 'rest/Bovino/Alimentacao', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"c9bf7321-1d7d-496b-9d81-39ac5759f94c";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575230706, 1575230000, '1', 200),
	(381, 'rest/Inseminacao/Parto', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"7dd35fa2-834f-4972-9f42-cf430f8e5afe";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575257337, 1575260000, '1', 200),
	(382, 'rest/Inseminacao/Parto', 'get', 'a:11:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"dcdc842e-2bb0-4f7b-a792-0ab4b944f2aa";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:6:"Cookie";s:43:"ci_session=3o4iapmvm8779ftr4k05qh29eh9h2qd8";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575258031, 1575260000, '1', 200),
	(383, 'rest/Bovino', 'get', 'a:10:{s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"e690abf0-80a4-406c-aa6a-126c1c1035b5";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:10:"Connection";s:10:"keep-alive";}', 'acesso', '127.0.0.1', 1575297272, 1575300000, '1', 200),
	(384, 'rest/Bovino/9', 'delete', 'a:13:{s:2:"id";s:1:"9";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"d8860942-39c9-417a-8702-92b37eb4b826";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:6:"Cookie";s:43:"ci_session=4hh7strapoe89uae9u2llld8q6pt4jc9";s:10:"Connection";s:10:"keep-alive";s:47:"{\n	"inicio":"2000-01-01",\n	"fim":"2020-12-31"\n}";s:0:"";}', 'acesso', '127.0.0.1', 1575297298, 1575300000, '1', 0),
	(385, 'rest/Bovino/9', 'delete', 'a:13:{s:2:"id";s:1:"9";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"36afe4d4-e082-4aaf-877c-d6b29f46fb0e";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:6:"Cookie";s:43:"ci_session=4hh7strapoe89uae9u2llld8q6pt4jc9";s:10:"Connection";s:10:"keep-alive";s:47:"{\n	"inicio":"2000-01-01",\n	"fim":"2020-12-31"\n}";s:0:"";}', 'acesso', '127.0.0.1', 1575297596, 1575300000, '1', 0),
	(386, 'rest/Bovino/9', 'delete', 'a:13:{s:2:"id";s:1:"9";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9df94567-152d-4001-9917-5d06c3d38bc9";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:6:"Cookie";s:43:"ci_session=85ml997ibb817qveivs9bi43g46smo60";s:10:"Connection";s:10:"keep-alive";s:47:"{\n	"inicio":"2000-01-01",\n	"fim":"2020-12-31"\n}";s:0:"";}', 'acesso', '127.0.0.1', 1575297784, 1575300000, '1', 0),
	(387, 'rest/Bovino/9', 'delete', 'a:13:{s:2:"id";s:1:"9";s:5:"token";s:6:"acesso";s:12:"Content-Type";s:16:"application/json";s:10:"User-Agent";s:21:"PostmanRuntime/7.20.1";s:6:"Accept";s:3:"*/*";s:13:"Cache-Control";s:8:"no-cache";s:13:"Postman-Token";s:36:"7310a0b7-d9a2-419d-a8e4-30b3465f712a";s:4:"Host";s:9:"127.0.0.1";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:14:"Content-Length";s:2:"47";s:6:"Cookie";s:43:"ci_session=85ml997ibb817qveivs9bi43g46smo60";s:10:"Connection";s:10:"keep-alive";s:47:"{\n	"inicio":"2000-01-01",\n	"fim":"2020-12-31"\n}";s:0:"";}', 'acesso', '127.0.0.1', 1575297882, 1575300000, '1', 200);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Copiando estrutura para view u524093236_bovinos.mediaproducao
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `mediaproducao` (
	`id` INT(11) NOT NULL,
	`nome` VARCHAR(35) NULL COLLATE 'utf8_general_ci',
	`media` DOUBLE NULL
) ENGINE=MyISAM;

-- Copiando estrutura para tabela u524093236_bovinos.ordenha
CREATE TABLE IF NOT EXISTS `ordenha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bovino_id` int(11) NOT NULL,
  `leite` double NOT NULL,
  `descarte` double NOT NULL DEFAULT '0',
  `coleta` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ordenha_bovino` (`bovino_id`),
  CONSTRAINT `FK_ordenha_bovino` FOREIGN KEY (`bovino_id`) REFERENCES `bovino` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.ordenha: ~114 rows (aproximadamente)
DELETE FROM `ordenha`;
/*!40000 ALTER TABLE `ordenha` DISABLE KEYS */;
INSERT INTO `ordenha` (`id`, `bovino_id`, `leite`, `descarte`, `coleta`) VALUES
	(1, 1, 31, 0.5, '1999-12-01'),
	(2, 1, 32, 0.5, '1999-12-02'),
	(3, 1, 30, 0.5, '1999-12-03'),
	(4, 1, 30, 0.5, '1999-12-04'),
	(5, 1, 31, 0.5, '1999-12-05'),
	(6, 1, 32, 0.5, '1999-12-06'),
	(7, 1, 33, 0.5, '1999-12-07'),
	(8, 1, 32, 0.5, '1999-12-08'),
	(9, 1, 32, 0.5, '1999-12-09'),
	(10, 1, 32, 0.5, '1999-12-10'),
	(11, 1, 31, 0.5, '1999-12-11'),
	(12, 1, 32, 0.5, '1999-12-12'),
	(13, 1, 32, 0.5, '1999-12-13'),
	(14, 1, 31, 0.5, '1999-12-14'),
	(15, 1, 30, 0.5, '1999-12-15'),
	(16, 1, 30, 0.5, '1999-12-16'),
	(17, 1, 30, 0.5, '1999-12-17'),
	(18, 1, 30, 0.5, '1999-12-18'),
	(19, 1, 30, 0.5, '1999-12-19'),
	(20, 1, 30, 0.5, '1999-12-20'),
	(21, 1, 30, 0.5, '1999-12-21'),
	(22, 1, 30, 0.5, '1999-12-22'),
	(23, 1, 30, 0.5, '1999-12-23'),
	(24, 1, 31, 0.5, '1999-12-24'),
	(25, 1, 31, 0.5, '1999-12-25'),
	(26, 1, 31, 0.5, '1999-12-26'),
	(27, 1, 31, 0.5, '1999-12-27'),
	(28, 1, 31, 0.5, '1999-12-28'),
	(29, 1, 31, 0.5, '1999-12-29'),
	(30, 1, 31, 0.5, '1999-12-30'),
	(31, 1, 32, 0.5, '1999-12-31'),
	(32, 1, 31, 0.5, '2000-01-01'),
	(33, 1, 32, 0.5, '2000-01-02'),
	(34, 1, 32, 0.5, '2000-01-03'),
	(35, 1, 30.5, 3, '2000-01-04'),
	(36, 1, 30.5, 3, '2000-01-05'),
	(37, 1, 30.5, 0, '2000-01-06'),
	(38, 1, 30.5, 1, '2000-01-07'),
	(39, 1, 30.5, 0, '2000-01-08'),
	(40, 1, 28, 1, '2000-01-09'),
	(41, 1, 31, 1, '2000-01-10'),
	(42, 1, 26, 1, '2000-01-11'),
	(43, 1, 30.5, 3, '2000-01-12'),
	(44, 1, 30.5, 3, '2000-01-13'),
	(45, 1, 30.5, 0, '2000-01-14'),
	(46, 1, 30.5, 1, '2000-01-15'),
	(47, 1, 30.5, 0, '2000-01-16'),
	(48, 1, 32, 0.5, '2001-01-17'),
	(49, 1, 32, 0.5, '2001-01-18'),
	(50, 1, 32, 0.5, '2001-01-19'),
	(51, 1, 32, 0.5, '2001-01-20'),
	(52, 1, 32, 0.5, '2001-01-21'),
	(53, 1, 32, 0.5, '2001-01-22'),
	(54, 1, 32, 0.5, '2001-01-23'),
	(55, 1, 32, 0.5, '2001-01-24'),
	(56, 1, 32, 0.5, '2001-01-25'),
	(57, 1, 32, 0.5, '2001-01-26'),
	(58, 1, 32, 0.5, '2001-01-27'),
	(59, 1, 32, 0.5, '2001-01-28'),
	(60, 1, 32, 0.5, '2001-01-29'),
	(61, 1, 32, 0.5, '2001-01-30'),
	(62, 1, 32, 0.5, '2001-01-31'),
	(187, 7, 28.5, 1, '1999-12-01'),
	(188, 7, 28.5, 1, '1999-12-02'),
	(189, 7, 28.5, 1, '1999-12-03'),
	(190, 7, 28.5, 1, '1999-12-04'),
	(191, 7, 28.5, 1, '1999-12-05'),
	(192, 7, 28.5, 1, '1999-12-06'),
	(193, 7, 28.5, 1, '1999-12-07'),
	(194, 7, 28.5, 1, '1999-12-08'),
	(195, 7, 28.5, 1, '1999-12-09'),
	(196, 7, 28.5, 1, '1999-12-10'),
	(197, 7, 28.5, 1, '1999-12-11'),
	(198, 7, 28.5, 1, '1999-12-12'),
	(199, 7, 28.5, 1, '1999-12-13'),
	(200, 7, 28.5, 1, '1999-12-14'),
	(201, 7, 28.5, 1, '1999-12-15'),
	(202, 7, 28.5, 1, '1999-12-16'),
	(203, 7, 28.5, 1, '1999-12-17'),
	(204, 7, 28.5, 1, '1999-12-18'),
	(205, 7, 28.5, 1, '1999-12-19'),
	(206, 7, 28.5, 1, '1999-12-20'),
	(207, 7, 28.5, 1, '1999-12-21'),
	(208, 7, 28.5, 1, '1999-12-22'),
	(209, 7, 28.5, 1, '1999-12-23'),
	(210, 7, 28.5, 1, '1999-12-24'),
	(211, 7, 28.5, 1, '1999-12-25'),
	(212, 7, 28.5, 1, '1999-12-26'),
	(213, 7, 28.5, 1, '1999-12-27'),
	(214, 7, 28.5, 1, '1999-12-28'),
	(215, 7, 28.5, 1, '1999-12-29'),
	(216, 7, 28.5, 1, '1999-12-30'),
	(217, 7, 28.5, 1, '1999-12-31'),
	(218, 7, 28.5, 1, '2000-01-01'),
	(219, 7, 28.5, 1, '2000-01-02'),
	(220, 7, 28.5, 1, '2000-01-03'),
	(234, 7, 28.5, 1, '2000-01-17'),
	(235, 7, 28.5, 1, '2000-01-18'),
	(236, 7, 28.5, 1, '2000-01-19'),
	(237, 7, 28.5, 1, '2000-01-20'),
	(238, 7, 28.5, 1, '2000-01-21'),
	(239, 7, 28.5, 1, '2000-01-22'),
	(240, 7, 28.5, 1, '2000-01-23'),
	(241, 7, 28.5, 1, '2000-01-24'),
	(242, 7, 28.5, 1, '2000-01-25'),
	(243, 7, 28.5, 1, '2000-01-26'),
	(244, 7, 28.5, 1, '2000-01-27'),
	(245, 7, 28.5, 1, '2000-01-28'),
	(246, 7, 28.5, 1, '2000-01-29'),
	(247, 7, 28.5, 1, '2000-01-30'),
	(248, 7, 28.5, 1, '2000-01-31'),
	(249, 1, 30, 0, '2019-11-11'),
	(250, 1, 32, 0, '2019-11-10'),
	(253, 3, 21, 0, '2019-11-03');
/*!40000 ALTER TABLE `ordenha` ENABLE KEYS */;

-- Copiando estrutura para tabela u524093236_bovinos.partos
CREATE TABLE IF NOT EXISTS `partos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bovino_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `nascido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_partos_bovino` (`bovino_id`),
  CONSTRAINT `FK_partos_bovino` FOREIGN KEY (`bovino_id`) REFERENCES `bovino` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.partos: ~0 rows (aproximadamente)
DELETE FROM `partos`;
/*!40000 ALTER TABLE `partos` DISABLE KEYS */;
/*!40000 ALTER TABLE `partos` ENABLE KEYS */;

-- Copiando estrutura para tabela u524093236_bovinos.raca
CREATE TABLE IF NOT EXISTS `raca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.raca: ~3 rows (aproximadamente)
DELETE FROM `raca`;
/*!40000 ALTER TABLE `raca` DISABLE KEYS */;
INSERT INTO `raca` (`id`, `nome`) VALUES
	(1, 'Holândes'),
	(2, 'Gir'),
	(3, 'Jersey');
/*!40000 ALTER TABLE `raca` ENABLE KEYS */;

-- Copiando estrutura para tabela u524093236_bovinos.token
CREATE TABLE IF NOT EXISTS `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apikey` varchar(40) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_token_usuario` (`usuario_id`),
  CONSTRAINT `FK_token_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.token: ~2 rows (aproximadamente)
DELETE FROM `token`;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` (`id`, `apikey`, `usuario_id`) VALUES
	(1, 'acesso', 1),
	(2, 'd125a874318684c7d491a20acbd3b879', 2);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;

-- Copiando estrutura para tabela u524093236_bovinos.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela u524093236_bovinos.usuario: ~2 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`) VALUES
	(1, 'Administrador', 'adm@gmail.com', '123'),
	(2, 'Segundo', 'usuario2@gmail.com', '123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Copiando estrutura para view u524093236_bovinos.mediaproducao
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `mediaproducao`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mediaproducao` AS select `bovino`.`id` AS `id`,`bovino`.`nome` AS `nome`,(select avg(`ordenha`.`leite`) from `ordenha` where ((`bovino`.`id` = `ordenha`.`bovino_id`) and (`ordenha`.`coleta` > (curdate() - interval 1 month)))) AS `media` from `bovino`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
