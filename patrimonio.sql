-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Mar-2015 às 00:28
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `patrimonio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ambiente`
--

CREATE TABLE IF NOT EXISTS `ambiente` (
`id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `abrev` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ambiente`
--

INSERT INTO `ambiente` (`id`, `nome`, `abrev`) VALUES
(1, 'Eletricidade I A-127', 'Eletricidade I'),
(2, 'Eletrônica Industrial A-128', 'Eletrônica Industral'),
(3, 'Máquinas Elétricas A-130', 'Máquinas Elétricas'),
(4, 'Eletricidade II A-131', 'Eletricidade II'),
(5, 'Equipamentos Biomédicos A-132', 'Equip Biomédicos'),
(6, 'CAD Aplicado À Eletrônica e Telecomunicações A-133', 'CAD'),
(7, 'Eletrônica Fundamental A-134', 'Eletrôn Fundamental'),
(8, 'PROMAP A-135', 'PROMAP'),
(9, 'Comandos Elétricos A-136', 'Comandos Elétricos'),
(10, 'Manutenção Eletromecânica A-137', 'Manutenção Eletromec'),
(11, 'Rádio e TV A-138', 'Rádio e TV'),
(12, 'Instalações Elétricas I A-139', 'Instalações I'),
(13, 'Circuito Impresso A-140', 'Circuito Impresso'),
(14, 'Iniciação à Prática Profissional A-141', 'IPP'),
(15, 'Almoxarifado de Equipamentos (Circuito Impresso)', 'Almoxarifado Equip'),
(16, 'Instrumentação Biomédica', 'Instrum Biomédica'),
(17, 'Calibração e Aferição de Equipamentos Biomédicos', 'Calib Biomédica'),
(18, 'Medidas em Telecomunicações', 'Medidas Telecom'),
(19, 'Telecomunicações', 'Telecomunicações'),
(20, 'Almoxarifado de Componentes Eletrônicos', 'Almoxarifado Compon');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('afb6383a345d5574e3527c37b5e19c5b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1425598056, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamento`
--

CREATE TABLE IF NOT EXISTS `equipamento` (
  `modelo` varchar(20) NOT NULL,
  `fabricante` varchar(50) NOT NULL,
  `descricao` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `equipamento`
--

INSERT INTO `equipamento` (`modelo`, `fabricante`, `descricao`) VALUES
('1735', 'Fluke', 'Analisador de Energia Trifásico'),
('33210A', 'Agilent', 'Gerador de Função 10MHz'),
('33220A', 'Agilent', 'Gerador de Função 20MHz'),
('33521A', 'Agilent', 'Gerador de Função 30MHz'),
('444-45', 'Kern', 'Balança Digital de Precisão'),
('8110', 'Topward', 'Gerador de Função 2MHz'),
('850A', 'Sunko', 'Estação de Retrabalho Analógica'),
('8810', 'Datapool', 'Módulo Eletrônica Digital'),
('AW-4700', 'Icel', 'Alicate Wattímetro Trifásico RMS'),
('DE0', 'Altera', 'Kit Desenvolvimento FPGA'),
('DE2-115', 'Altera', 'Kit Desenvolvimento FPGA'),
('DSO-X 2012A', 'Agilent', 'Osciloscópio Digital 100MHz 2 canais'),
('DSO1012A', 'Agilent', 'Osciloscópio Digital 100MHz 2 canais'),
('DSO1022A', 'Agilent', 'Osciloscópio Digital 200MHz 2 canais'),
('E3631A', 'Agilent', 'Fonte DC Regulada 1 + 1 canais'),
('EKS-LM3S6965', 'Texas Instruments', 'Kit Desenvolvimento Stellaris ARM'),
('ES-910-220', 'Instrutherm', 'Estação de Solda Analógica'),
('ES-915-220', 'Instrutherm', 'Estação de Solda Analógica'),
('ESD-800-220', 'Instrutherm', 'Estação de Retrabalho'),
('FA-3030', 'Instrutherm', 'Fonte DC Regulada 2 + 1 canais'),
('FSC3003D', 'Dawer', 'Fonte DC Regulada'),
('G1330', 'Grelco', 'Fonte DC 13V 30A'),
('GDS-2102', 'GW Instek', 'Osciloscópio Digital 100MHz 1GSa/s'),
('GDS-820C', 'GW Instek', 'Osciloscópio Digital 150MHz 25GSa/s'),
('GV-2002', 'Icel', 'Gerador de Função Digital 2MHz'),
('HK-936B', 'Hikari', 'Estação de Solda Analógica'),
('HP-760D', 'HoldPeak', 'Multímetro Digital'),
('LER-121A', 'Leap', 'Apagador de EEPROM'),
('MBT 301', 'Pace', 'Sistema de Solda'),
('MFG-4201', 'Minipa', 'Gerador de Função 2MHz'),
('MFG-4221', 'Minipa', 'Gerador de Função 20MHz 2 canais'),
('MG-3000', 'Icel', 'Megômetro Digital'),
('MO-2150', 'Minipa', 'Osciloscópio Digital 150MHz'),
('MP-2420', 'Minipa', 'Protoboard 2420 pontos'),
('MP-2420A', 'Minipa', 'Protoboard 2420 pontos metal'),
('MPC-303D', 'Minipa', 'Fonte DC Regulada 2 + 1 canais'),
('MPL-3303', 'Minipa', 'Fonte DC Regulada 2 + 1 canais'),
('MPL-3305M', 'Minipa', 'Fonte DC Regulada 2 +1 canais'),
('MSB-400', 'Icel', 'Protoboard 2420 pontos'),
('MX-1050', 'Minipa', 'Ponte LCR'),
('Phaser 3428', 'Xerox', 'Impressora Laser'),
('ST-100', 'Pace', 'Sistema de Solda SMD'),
('TD-706', 'Instrutherm', 'Tacômetro Digital'),
('TD8012', 'Bit9', 'Kit Didático p/ Eletrônica Digital'),
('TR-5700', 'Icel', 'Alicate Terrômetro'),
('TS-850D', 'Toyo', 'Estação de Retrabalho'),
('U1211A', 'Agilent', 'Alicate Amperímetro RMS'),
('U1232A', 'Agilent', 'Multímetro Digital Portátil True RMS'),
('U1242B', 'Agilent', 'Multímetro Digital Portátil'),
('U1252B', 'Agilent', 'Multímetro Digital Portátil'),
('U1731C', 'Agilent', 'Medidor LCR'),
('U3401A', 'Agilent', 'Multímetro Digital de Bancada'),
('U8031A', 'Agilent', 'Fonte DC Regulada 2 + 1 canais'),
('VC2002', 'Victor', 'Gerador de Função 2MHz');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
`id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrimonio`
--

CREATE TABLE IF NOT EXISTS `patrimonio` (
`id` int(11) NOT NULL,
  `tombo` mediumint(9) DEFAULT NULL,
  `n_serie` varchar(100) DEFAULT NULL,
  `modelo` varchar(20) NOT NULL,
  `ambiente` int(11) DEFAULT NULL,
  `data_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_mod` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `usuario_add` int(11) DEFAULT NULL,
  `usuario_mod` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `patrimonio`
--

INSERT INTO `patrimonio` (`id`, `tombo`, `n_serie`, `modelo`, `ambiente`, `data_add`, `data_mod`, `usuario_add`, `usuario_mod`) VALUES
(1, 94143, 'MY53360139', 'U1232A', 10, '2015-01-26 14:02:30', NULL, 2, NULL),
(2, 94139, 'MY53360173', 'U1232A', 10, '2015-01-26 14:03:30', NULL, 2, NULL),
(6, 65542, 'MY51451677', 'DSO-X 2012A', 5, '2015-01-26 20:30:48', '2015-03-05 21:38:25', 2, 2),
(7, 65532, 'MY51451722', 'DSO-X 2012A', 7, '2015-01-26 20:30:48', NULL, 2, NULL),
(8, 51084, 'MO2150000017', 'MO-2150', 1, '2015-01-26 20:33:19', '2015-03-05 17:09:19', 2, 2),
(9, 51079, 'MO2150000021', 'MO-2150', 7, '2015-01-26 20:33:19', NULL, 2, NULL),
(10, 51080, 'MO2150000016', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
(11, 51082, 'MO2150000018', 'MO-2150', 1, '2015-01-26 20:33:20', '2015-03-05 17:09:19', 2, 2),
(12, 51085, 'MO2150000022', 'MO-2150', 1, '2015-01-26 20:33:20', '2015-03-05 17:09:19', 2, 2),
(13, 51083, 'MO2150000026', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
(14, 51077, 'MO2150000027', 'MO-2150', 1, '2015-01-26 20:33:20', '2015-03-05 17:09:19', 2, 2),
(15, 51078, 'MO2150000019', 'MO-2150', 1, '2015-01-26 20:33:20', '2015-03-05 17:09:19', 2, 2),
(16, 51081, 'MO2150000025', 'MO-2150', 1, '2015-01-26 20:33:20', '2015-03-05 17:09:19', 2, 2),
(17, 50903, '08080100392495', 'FA-3030', 7, '2015-01-26 20:37:35', NULL, 2, NULL),
(18, 50905, '08080100392512', 'FA-3030', 7, '2015-01-26 20:37:35', NULL, 2, NULL),
(19, 50906, '07091200285667', 'FA-3030', 7, '2015-01-26 20:37:35', NULL, 2, NULL),
(20, 50907, '08080100392503', 'FA-3030', 7, '2015-01-26 20:37:35', NULL, 2, NULL),
(21, 50904, '08080100392502', 'FA-3030', 7, '2015-01-26 20:37:35', NULL, 2, NULL),
(22, 50913, '08080100392505', 'FA-3030', 7, '2015-01-26 20:37:35', NULL, 2, NULL),
(23, 50902, '08030300340442', 'FA-3030', 7, '2015-01-26 20:37:35', NULL, 2, NULL),
(24, 52582, 'MP3303002693', 'MPL-3303', 7, '2015-01-26 20:40:23', NULL, 2, NULL),
(25, 52580, 'MP3303002844', 'MPL-3303', 7, '2015-01-26 20:40:23', NULL, 2, NULL),
(26, 52587, 'MP3303002735', 'MPL-3303', 7, '2015-01-26 20:40:23', NULL, 2, NULL),
(27, 52584, 'MP3303002737', 'MPL-3303', 7, '2015-01-26 20:40:23', NULL, 2, NULL),
(28, 52585, 'MP3303002749', 'MPL-3303', 7, '2015-01-26 20:40:23', NULL, 2, NULL),
(29, 52479, '992314319', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(30, 48605, '99856573', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(31, 52476, '992314350', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(32, 52487, '992314333', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(33, 52483, '992314337', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(34, 52478, '992314320', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(35, 48601, '99856581', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(36, 52485, '992314349', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(37, 52486, '992314356', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(38, 52477, '992314357', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(39, 52480, '992314348', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(40, 52482, '992314261', 'GV-2002', 7, '2015-01-26 20:44:25', NULL, 2, NULL),
(41, 65552, 'MY51020081', 'U3401A', 7, '2015-01-26 20:59:08', NULL, 2, NULL),
(42, 65553, 'MY51040062', 'U3401A', 7, '2015-01-26 20:59:08', NULL, 2, NULL),
(43, 51551, 'MY51040044', 'U3401A', 7, '2015-01-26 20:59:08', NULL, 2, NULL),
(44, 65551, 'MY51040028', 'U3401A', 7, '2015-01-26 20:59:08', NULL, 2, NULL),
(45, 65554, 'MY51490055', 'U3401A', 7, '2015-01-26 20:59:08', NULL, 2, NULL),
(46, 65527, 'MY51010040', 'E3631A', 7, '2015-01-26 21:00:33', NULL, 2, NULL),
(47, 65528, 'MY51020137', 'E3631A', 7, '2015-01-26 21:00:33', NULL, 2, NULL),
(48, 65529, 'MY51490005', 'E3631A', 7, '2015-01-26 21:00:33', NULL, 2, NULL),
(49, 65530, 'MY51010036', 'E3631A', 7, '2015-01-26 21:00:33', NULL, 2, NULL),
(50, 0, 'MY51020105', 'E3631A', 10, '2015-01-26 21:00:51', '2015-02-06 16:31:12', 2, 2),
(51, 0, 'MY51510018', 'E3631A', 10, '2015-01-26 21:01:08', '2015-02-06 16:31:12', 2, 2),
(52, 65534, 'MY51451671', 'DSO-X 2012A', 16, '2015-01-26 21:23:39', NULL, 2, NULL),
(53, 65536, 'MY51451683', 'DSO-X 2012A', 16, '2015-01-26 21:23:39', NULL, 2, NULL),
(54, 65535, 'MY51451652', 'DSO-X 2012A', 16, '2015-01-26 21:23:39', NULL, 2, NULL),
(55, 65541, 'MY51451650', 'DSO-X 2012A', 16, '2015-01-26 21:23:39', NULL, 2, NULL),
(56, 65533, 'MY51451658', 'DSO-X 2012A', 16, '2015-01-26 21:23:39', NULL, 2, NULL),
(57, 65537, 'MY51451724', 'DSO-X 2012A', 16, '2015-01-26 21:23:39', NULL, 2, NULL),
(58, 65538, 'MY51451644', 'DSO-X 2012A', 16, '2015-01-26 21:23:39', NULL, 2, NULL),
(59, 65531, 'MY51451540', 'DSO-X 2012A', 16, '2015-01-26 21:23:39', NULL, 2, NULL),
(60, 65545, 'MY51500006', 'U3401A', 16, '2015-01-26 21:25:17', NULL, 2, NULL),
(61, 65548, 'MY51500031', 'U3401A', 16, '2015-01-26 21:25:17', NULL, 2, NULL),
(62, 65549, 'MY51500044', 'U3401A', 16, '2015-01-26 21:25:17', NULL, 2, NULL),
(63, 65543, 'MY51500039', 'U3401A', 16, '2015-01-26 21:25:17', NULL, 2, NULL),
(64, 65550, 'MY51490015', 'U3401A', 16, '2015-01-26 21:25:17', NULL, 2, NULL),
(65, 65546, 'MY51500011', 'U3401A', 16, '2015-01-26 21:25:17', NULL, 2, NULL),
(66, 65544, 'MY51500040', 'U3401A', 16, '2015-01-26 21:25:17', NULL, 2, NULL),
(67, 65547, 'MY51490070', 'U3401A', 16, '2015-01-26 21:25:17', NULL, 2, NULL),
(68, 65519, 'MY51510020', 'E3631A', 16, '2015-01-26 21:27:03', NULL, 2, NULL),
(69, 65520, 'MY51510021', 'E3631A', 16, '2015-01-26 21:27:03', NULL, 2, NULL),
(70, 65526, 'MY51480118', 'E3631A', 16, '2015-01-26 21:27:03', NULL, 2, NULL),
(71, 65524, 'MY51510003', 'E3631A', 16, '2015-01-26 21:27:03', NULL, 2, NULL),
(72, 65523, 'MY51510009', 'E3631A', 16, '2015-01-26 21:27:03', NULL, 2, NULL),
(73, 65521, 'MY51470115', 'E3631A', 16, '2015-01-26 21:27:03', NULL, 2, NULL),
(74, 65525, 'MY51510023', 'E3631A', 16, '2015-01-26 21:27:03', NULL, 2, NULL),
(75, 65522, 'MY51510019', 'E3631A', 16, '2015-01-26 21:27:03', NULL, 2, NULL),
(76, 65511, 'MY50002964', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL),
(77, 65507, 'MY50002955', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL),
(78, 65514, 'MY50002941', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL),
(79, 65513, 'MY50002961', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL),
(80, 65512, 'MY50002936', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL),
(81, 65509, 'MY50002967', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL),
(82, 65510, 'MY50002969', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL),
(83, 65508, 'MY50002971', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL),
(84, 55104, '', 'Phaser 3428', 10, '2015-01-26 21:43:20', NULL, 3, NULL),
(85, 0, 'MY51040066', 'U3401A', 19, '2015-02-06 18:01:15', NULL, 2, NULL),
(86, 0, 'MY51050017', 'U3401A', 19, '2015-02-06 18:01:15', NULL, 2, NULL),
(87, 0, 'MY51050002', 'U3401A', 19, '2015-02-06 18:01:15', NULL, 2, NULL),
(88, 0, 'MY51040045', 'U3401A', 19, '2015-02-06 18:01:15', NULL, 2, NULL),
(89, 0, 'MY51040041', 'U3401A', 19, '2015-02-06 18:01:15', NULL, 2, NULL),
(90, 0, 'MY51040079', 'U3401A', 19, '2015-02-06 18:01:15', NULL, 2, NULL),
(91, 0, 'MY51040055', 'U3401A', 19, '2015-02-06 18:01:15', NULL, 2, NULL),
(92, 0, 'MY51040052', 'U3401A', 19, '2015-02-06 18:01:15', NULL, 2, NULL),
(93, 0, 'MY51020139', 'E3631A', 19, '2015-02-06 18:04:50', NULL, 2, NULL),
(94, 0, 'MY51020101', 'E3631A', 19, '2015-02-06 18:04:50', NULL, 2, NULL),
(95, 0, 'MY51020165', 'E3631A', 19, '2015-02-06 18:04:50', NULL, 2, NULL),
(96, 0, 'MY51020152', 'E3631A', 19, '2015-02-06 18:04:50', NULL, 2, NULL),
(97, 0, 'MY51020003', 'E3631A', 19, '2015-02-06 18:04:50', NULL, 2, NULL),
(98, 0, 'MY51020166', 'E3631A', 19, '2015-02-06 18:04:50', NULL, 2, NULL),
(99, 0, 'MY51020170', 'E3631A', 19, '2015-02-06 18:04:50', NULL, 2, NULL),
(100, 0, 'MY51020135', 'E3631A', 19, '2015-02-06 18:04:50', NULL, 2, NULL),
(101, 94132, 'MY53360126', 'U1232A', 19, '2015-02-06 18:09:05', NULL, 2, NULL),
(102, 94137, 'MY53360180', 'U1232A', 19, '2015-02-06 18:10:42', NULL, 2, NULL),
(103, 94136, 'MY53360187', 'U1232A', 19, '2015-02-06 18:10:42', NULL, 2, NULL),
(104, 94138, 'MY53360045', 'U1232A', 19, '2015-02-06 18:10:42', NULL, 2, NULL),
(105, 94135, 'MY53360037', 'U1232A', 19, '2015-02-06 18:10:42', NULL, 2, NULL),
(106, 94131, 'MY53350259', 'U1232A', 19, '2015-02-06 18:10:42', NULL, 2, NULL),
(107, 94133, 'MY53360176', 'U1232A', 19, '2015-02-06 18:10:42', NULL, 2, NULL),
(108, 94134, 'MY53360063', 'U1232A', 19, '2015-02-06 18:10:42', NULL, 2, NULL),
(109, 0, 'CN50493958', 'DSO1012A', 7, '2015-02-13 18:13:41', '2015-03-05 17:08:36', 2, 2),
(110, 0, 'CN50483802', 'DSO1012A', 7, '2015-02-13 18:13:41', '2015-03-05 17:08:35', 2, 2),
(111, 0, 'CN50483837', 'DSO1012A', 7, '2015-02-13 18:13:41', '2015-03-05 17:08:36', 2, 2),
(112, 0, 'CN50493960', 'DSO1012A', 7, '2015-02-13 18:13:41', '2015-03-05 17:08:36', 2, 2),
(113, 0, 'CN50493990', 'DSO1012A', 7, '2015-02-13 18:13:41', '2015-03-05 17:08:36', 2, 2),
(114, 0, 'CN50483774', 'DSO1012A', 7, '2015-02-13 18:13:41', '2015-03-05 17:08:35', 2, 2),
(115, 0, 'CN50473511', 'DSO1012A', 7, '2015-02-13 18:13:41', '2015-03-05 17:08:35', 2, 2),
(116, 65540, 'CN50493997', 'DSO1012A', 7, '2015-02-13 18:13:41', '2015-03-05 17:08:36', 2, 2),
(117, 0, 'MY44052558', '33220A', 19, '2015-02-13 18:15:01', NULL, 2, NULL),
(118, 0, 'MY44052925', '33220A', 19, '2015-02-13 18:15:01', NULL, 2, NULL),
(119, 0, 'MY44052930', '33220A', 19, '2015-02-13 18:15:01', NULL, 2, NULL),
(120, 0, 'MY44052878', '33220A', 19, '2015-02-13 18:15:01', NULL, 2, NULL),
(121, 0, 'MY44051835', '33220A', 19, '2015-02-13 18:15:01', NULL, 2, NULL),
(122, 0, 'MY44052811', '33220A', 19, '2015-02-13 18:15:01', NULL, 2, NULL),
(123, 0, 'MY44052838', '33220A', 19, '2015-02-13 18:15:01', NULL, 2, NULL),
(124, 0, 'MY44052461', '33220A', 19, '2015-02-13 18:15:01', NULL, 2, NULL),
(125, 110395, 'MY54090013', 'U1731C', 19, '2015-02-13 18:16:50', NULL, 2, NULL),
(126, 63861, '0', 'MP-2420', 19, '2015-02-13 18:19:33', NULL, 2, NULL),
(127, 63860, '0', 'MP-2420', 19, '2015-02-13 18:19:33', NULL, 2, NULL),
(128, 63865, '0', 'MP-2420', 19, '2015-02-13 18:19:33', NULL, 2, NULL),
(129, 63864, '0', 'MP-2420', 19, '2015-02-13 18:19:33', NULL, 2, NULL),
(130, 63866, '0', 'MP-2420', 19, '2015-02-13 18:19:33', NULL, 2, NULL),
(131, 63862, '0', 'MP-2420', 19, '2015-02-13 18:19:33', NULL, 2, NULL),
(132, 63863, '0', 'MP-2420', 19, '2015-02-13 18:19:33', NULL, 2, NULL),
(133, 0, '0', 'MP-2420', 19, '2015-02-13 18:19:33', NULL, 2, NULL),
(134, 115376, 'MY53401139', 'DSO-X 2012A', 19, '2015-02-23 20:04:57', '2015-03-05 17:08:15', 2, 2),
(135, 115378, 'MY53481260', 'DSO-X 2012A', 19, '2015-02-23 20:04:57', '2015-03-05 17:08:15', 2, 2),
(136, 115381, 'MY53401141', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(137, 115377, 'MY53401127', 'DSO-X 2012A', 19, '2015-02-23 20:04:57', '2015-03-05 17:08:15', 2, 2),
(138, 115373, 'MY53401119', 'DSO-X 2012A', 19, '2015-02-23 20:04:57', '2015-03-05 17:08:15', 2, 2),
(139, 115380, 'MY53401143', 'DSO-X 2012A', 19, '2015-02-23 20:04:57', '2015-03-05 17:08:15', 2, 2),
(140, 115375, 'MY53401137', 'DSO-X 2012A', 19, '2015-02-23 20:04:57', '2015-03-05 17:08:15', 2, 2),
(141, 115379, 'MY53401124', 'DSO-X 2012A', 19, '2015-02-23 20:04:57', '2015-03-05 17:08:15', 2, 2),
(142, 115382, 'MY53401140', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(143, 115374, 'MY53401132', 'DSO-X 2012A', 19, '2015-02-23 20:04:57', '2015-03-05 17:08:15', 2, 2),
(144, 615, 'MY51451712', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(145, 51558, 'MY52495134', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(146, 69365, '11100009-0807', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(147, 69364, '11100009-0806', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(148, 69362, '11100009-1052', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(149, 69367, '11100009-1051', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(150, 67359, '11100009-0804', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(151, 69366, '11100009-0801', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(152, 69361, '11100009-0808', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(153, 69360, '11100009-1135', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(154, 69363, '11100009-0816', 'DE2-115', 15, '2015-02-23 20:09:42', NULL, 2, NULL),
(155, 0, '10030078', 'MFG-4221', 15, '2015-02-23 20:26:33', NULL, 2, NULL),
(156, 59378, 'CN49424483', 'DSO1022A', 2, '2015-02-23 20:27:38', '2015-03-05 17:10:43', 2, 2),
(157, 59379, 'CN49424484', 'DSO1022A', 2, '2015-02-23 20:27:38', '2015-03-05 17:10:43', 2, 2),
(160, 55610, '', 'TD8012', 15, '2015-02-24 21:09:21', NULL, 2, NULL),
(161, 55611, '', 'TD8012', 15, '2015-02-24 21:09:21', NULL, 2, NULL),
(162, 68434, '9931748', 'MG-3000', 15, '2015-02-24 21:10:01', NULL, 2, NULL),
(163, 0, 'MP3305000337', 'MPL-3305M', 15, '2015-02-24 21:11:09', NULL, 2, NULL),
(164, 0, 'MP3305000298', 'MPL-3305M', 15, '2015-02-24 21:11:09', NULL, 2, NULL),
(165, 0, 'MP3305000300', 'MPL-3305M', 15, '2015-02-24 21:11:09', NULL, 2, NULL),
(166, 0, 'MP3305000295', 'MPL-3305M', 15, '2015-02-24 21:11:09', NULL, 2, NULL),
(167, 0, 'MP3305000320', 'MPL-3305M', 15, '2015-02-24 21:11:09', NULL, 2, NULL),
(168, 52690, '21J17603846', 'HK-936B', 15, '2015-02-24 21:27:56', NULL, 2, NULL),
(169, 90679, '21J17605411', 'HK-936B', 15, '2015-02-24 21:27:57', NULL, 2, NULL),
(170, 0, 'BI1205212064', 'ES-915-220', 15, '2015-02-24 21:29:09', NULL, 2, NULL),
(171, 0, 'BI1205212024', 'ES-915-220', 15, '2015-02-24 21:29:09', NULL, 2, NULL),
(172, 0, 'BI1205212003', 'ES-915-220', 15, '2015-02-24 21:29:09', NULL, 2, NULL),
(173, 0, 'BI1205212037', 'ES-915-220', 15, '2015-02-24 21:29:09', NULL, 2, NULL),
(174, 0, '850D13155A-0859', 'TS-850D', 15, '2015-02-24 21:33:13', NULL, 2, NULL),
(175, 0, '850D13155A-0858', 'TS-850D', 15, '2015-02-24 21:33:13', NULL, 2, NULL),
(176, 48625, '07091200285139-N261920', 'TD-706', 15, '2015-02-24 21:34:12', NULL, 2, NULL),
(177, 0, '04704-1708', 'EKS-LM3S6965', 15, '2015-02-24 21:35:47', NULL, 2, NULL),
(178, 0, '04704-1781', 'EKS-LM3S6965', 15, '2015-02-24 21:35:47', NULL, 2, NULL),
(179, 0, '04704-1733', 'EKS-LM3S6965', 15, '2015-02-24 21:35:47', NULL, 2, NULL),
(180, 0, '45060-0603', 'EKS-LM3S6965', 15, '2015-02-24 21:35:47', NULL, 2, NULL),
(181, 0, '60051-0711', 'EKS-LM3S6965', 15, '2015-02-24 21:35:47', NULL, 2, NULL),
(182, 50915, 'CH8031000278', 'ESD-800-220', 15, '2015-02-24 21:36:29', NULL, 2, NULL),
(183, 69384, '', 'ST-100', 15, '2015-02-24 21:36:55', NULL, 2, NULL),
(184, 69385, '', 'ST-100', 15, '2015-02-24 21:36:55', NULL, 2, NULL),
(185, 52574, 'MP3303002746', 'MPL-3303', 15, '2015-02-24 21:37:29', NULL, 2, NULL),
(186, 50910, '08030300340438', 'FA-3030', 15, '2015-02-24 21:37:56', NULL, 2, NULL),
(187, 339, 'MY51510013', 'E3631A', 15, '2015-02-24 21:38:22', NULL, 2, NULL),
(188, 340, 'MY50002947', '33521A', 15, '2015-02-24 21:39:19', NULL, 2, NULL),
(189, 51545, 'MY50003684', '33521A', 15, '2015-02-24 21:39:19', NULL, 2, NULL),
(190, 342, 'MY51500010', 'U3401A', 15, '2015-02-24 21:56:43', NULL, 2, NULL),
(191, 51544, 'MY51520002', 'U3401A', 15, '2015-02-24 22:09:49', NULL, 2, NULL),
(192, 131766, 'MY48013483', '33210A', 15, '2015-02-24 22:11:40', NULL, 2, NULL),
(193, 131767, 'MY48013434', '33210A', 15, '2015-02-24 22:11:40', NULL, 2, NULL),
(194, 131768, 'MY48013433', '33210A', 15, '2015-02-24 22:11:40', NULL, 2, NULL),
(195, 131769, 'MY48013470', '33210A', 15, '2015-02-24 22:11:40', NULL, 2, NULL),
(196, 131770, 'MY48013490', '33210A', 15, '2015-02-24 22:11:40', NULL, 2, NULL),
(197, 131762, 'MY54150028', 'U8031A', 15, '2015-02-24 22:12:47', NULL, 2, NULL),
(198, 131763, 'MY54150022', 'U8031A', 15, '2015-02-24 22:12:48', NULL, 2, NULL),
(199, 131764, 'MY54150030', 'U8031A', 15, '2015-02-24 22:12:48', NULL, 2, NULL),
(200, 131765, 'MY54150025', 'U8031A', 15, '2015-02-24 22:12:48', NULL, 2, NULL),
(201, 68432, 'T5700-0144', 'TR-5700', 15, '2015-02-24 22:14:04', NULL, 2, NULL),
(202, 0, '21520920727', '444-45', 15, '2015-02-24 22:14:37', NULL, 2, NULL),
(203, 69141, 'S115113139B6', '1735', 15, '2015-02-24 22:15:14', NULL, 2, NULL),
(204, 69386, '020-100-B-004-40935', 'MBT 301', 15, '2015-02-24 22:17:06', NULL, 2, NULL),
(205, 0, '100017177', 'LER-121A', 15, '2015-02-24 22:18:29', NULL, 2, NULL),
(206, 0, '100017176', 'LER-121A', 15, '2015-02-24 22:18:29', NULL, 2, NULL),
(207, 0, '02048420', '850A', 15, '2015-02-24 22:20:15', NULL, 2, NULL),
(208, 0, '481675', 'G1330', 15, '2015-02-24 22:21:08', NULL, 2, NULL),
(209, 0, '10030027', 'MFG-4221', 15, '2015-02-27 16:24:03', NULL, 2, NULL),
(210, 0, '10030025', 'MFG-4221', 15, '2015-02-27 16:24:03', NULL, 2, NULL),
(211, 0, '10030035', 'MFG-4221', 15, '2015-02-27 16:24:04', NULL, 2, NULL),
(212, 0, '10030048', 'MFG-4221', 15, '2015-02-27 16:24:04', NULL, 2, NULL),
(213, 48600, '991165517', 'GV-2002', 15, '2015-02-27 16:25:25', NULL, 2, NULL),
(214, 48603, '991165479', 'GV-2002', 15, '2015-02-27 16:25:25', NULL, 2, NULL),
(215, 39167, 'GD420100614', 'MFG-4201', 15, '2015-02-27 16:28:46', NULL, 2, NULL),
(216, 52573, 'MP3303002757', 'MPL-3303', 1, '2015-02-27 16:56:45', '2015-03-05 17:11:10', 2, 2),
(217, 123, '123', '33210A', 20, '2015-02-27 20:04:03', NULL, 2, NULL),
(218, 131875, 'MY54102302', 'DSO-X 2012A', 10, '2015-03-03 16:47:14', NULL, 2, NULL),
(219, 131872, 'MY54102303', 'DSO-X 2012A', 10, '2015-03-03 16:47:14', NULL, 2, NULL),
(220, 131876, 'MY54102233', 'DSO-X 2012A', 10, '2015-03-03 16:47:14', NULL, 2, NULL),
(221, 131781, 'MY54102279', 'DSO-X 2012A', 10, '2015-03-03 16:47:14', NULL, 2, NULL),
(222, 131871, 'MY54102182', 'DSO-X 2012A', 10, '2015-03-03 16:47:14', NULL, 2, NULL),
(223, 131870, 'MY54102244', 'DSO-X 2012A', 10, '2015-03-03 16:47:14', NULL, 2, NULL),
(224, 131774, 'MY54100032', 'U3401A', 10, '2015-03-03 16:48:54', NULL, 2, NULL),
(225, 131866, 'MY53500001', 'U8031A', 10, '2015-03-03 16:49:59', NULL, 2, NULL),
(226, 131867, 'MY53510008', 'U8031A', 10, '2015-03-03 16:49:59', NULL, 2, NULL),
(227, 131864, 'MY53510009', 'U8031A', 10, '2015-03-03 16:49:59', NULL, 2, NULL),
(228, 131865, 'MY53510016', 'U8031A', 10, '2015-03-03 16:49:59', NULL, 2, NULL),
(229, 110385, 'MY48013480', '33210A', 10, '2015-03-03 16:52:42', NULL, 2, NULL),
(230, 110388, 'MY48013491', '33210A', 10, '2015-03-03 16:52:42', NULL, 2, NULL),
(231, 110387, 'MY48013452', '33210A', 10, '2015-03-03 16:52:42', NULL, 2, NULL),
(232, 110389, 'MY48013475', '33210A', 10, '2015-03-03 16:52:42', NULL, 2, NULL),
(233, 110390, 'MY48013282', '33210A', 10, '2015-03-03 16:52:42', NULL, 2, NULL),
(234, 110391, 'MY48012823', '33210A', 10, '2015-03-03 16:52:42', NULL, 2, NULL),
(235, 110410, 'MY54070097', 'U1252B', 10, '2015-03-03 16:53:41', NULL, 2, NULL),
(236, 110409, 'MY54070095', 'U1252B', 10, '2015-03-03 16:53:41', NULL, 2, NULL),
(237, 131776, 'MY54150387', 'U1242B', 10, '2015-03-03 16:56:20', NULL, 2, NULL),
(238, 131775, 'MY54150406', 'U1242B', 10, '2015-03-03 16:56:20', NULL, 2, NULL),
(239, 131777, 'MY54150350', 'U1242B', 10, '2015-03-03 16:56:20', NULL, 2, NULL),
(240, 131778, 'MY54150348', 'U1242B', 10, '2015-03-03 16:56:20', NULL, 2, NULL),
(241, 131779, 'MY54140130', 'U1242B', 10, '2015-03-03 16:56:20', NULL, 2, NULL),
(242, 131780, 'MY54140294', 'U1242B', 10, '2015-03-03 16:56:20', NULL, 2, NULL),
(243, 110405, 'MY54080098', 'U1242B', 10, '2015-03-03 16:57:58', NULL, 2, NULL),
(244, 110404, 'MY54040190', 'U1242B', 10, '2015-03-03 16:57:58', NULL, 2, NULL),
(245, 110402, 'MY54080074', 'U1242B', 10, '2015-03-03 16:57:58', NULL, 2, NULL),
(246, 110403, 'MY54080106', 'U1242B', 10, '2015-03-03 16:57:58', NULL, 2, NULL),
(247, 0, 'BI8102100224', 'ES-910-220', 10, '2015-03-03 17:00:27', NULL, 2, NULL),
(248, 0, 'BI8102100132', 'ES-910-220', 10, '2015-03-03 17:00:27', NULL, 2, NULL),
(249, 0, 'BI8102100313', 'ES-910-220', 10, '2015-03-03 17:00:27', NULL, 2, NULL),
(250, 0, 'BI8102100294', 'ES-910-220', 10, '2015-03-03 17:00:27', NULL, 2, NULL),
(251, 0, 'BI8102100225', 'ES-910-220', 10, '2015-03-03 17:00:27', NULL, 2, NULL),
(252, 110371, 'MY53480038', 'U1211A', 10, '2015-03-03 17:03:25', NULL, 2, NULL),
(253, 110377, 'MY53480001', 'U1211A', 10, '2015-03-03 17:03:25', NULL, 2, NULL),
(254, 110376, 'MY53480062', 'U1211A', 10, '2015-03-03 17:03:25', NULL, 2, NULL),
(255, 110375, 'MY53480058', 'U1211A', 10, '2015-03-03 17:03:25', NULL, 2, NULL),
(256, 110374, 'MY53440004', 'U1211A', 10, '2015-03-03 17:03:25', NULL, 2, NULL),
(257, 145, 'A4700-1087', 'AW-4700', 10, '2015-03-03 17:05:23', NULL, 2, NULL),
(258, 148, 'A4700-1080', 'AW-4700', 10, '2015-03-03 17:05:23', NULL, 2, NULL),
(259, 150, 'A4700-1082', 'AW-4700', 10, '2015-03-03 17:05:23', NULL, 2, NULL),
(260, 152, 'A4700-1084', 'AW-4700', 10, '2015-03-03 17:05:23', NULL, 2, NULL),
(261, 149, 'A4700-1081', 'AW-4700', 10, '2015-03-03 17:05:23', NULL, 2, NULL),
(262, 147, 'A4700-1089', 'AW-4700', 10, '2015-03-03 17:05:23', NULL, 2, NULL),
(263, 151, 'A4700-1083', 'AW-4700', 10, '2015-03-03 17:05:23', NULL, 2, NULL),
(264, 146, 'A4700-1088', 'AW-4700', 10, '2015-03-03 17:05:23', NULL, 2, NULL),
(265, 0, 'S0062WF10030010348', 'DE0', 10, '2015-03-03 17:07:23', NULL, 2, NULL),
(266, 0, 'S0062WF10030010343', 'DE0', 10, '2015-03-03 17:07:23', NULL, 2, NULL),
(267, 0, 'S0062WF10030010347', 'DE0', 10, '2015-03-03 17:07:23', NULL, 2, NULL),
(268, 0, 'S0062WF10030010346', 'DE0', 10, '2015-03-03 17:07:23', NULL, 2, NULL),
(269, 0, 'S0062WF10030010344', 'DE0', 10, '2015-03-03 17:07:23', NULL, 2, NULL),
(270, 0, 'S0062WF10030010345', 'DE0', 10, '2015-03-03 17:07:23', NULL, 2, NULL),
(271, 51825, '', 'MSB-400', 7, '2015-03-03 21:26:20', NULL, 2, NULL),
(272, 51827, '', 'MSB-400', 7, '2015-03-03 21:26:20', NULL, 2, NULL),
(273, 69296, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(274, 69292, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(275, 69299, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(276, 69279, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(277, 69289, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(278, 69281, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(279, 69290, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(280, 69283, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(281, 69282, '', 'MP-2420A', 7, '2015-03-03 21:28:01', NULL, 2, NULL),
(282, 51559, 'MY52495168', 'DSO-X 2012A', 5, '2015-03-05 17:10:13', '2015-03-05 21:38:25', 2, 2),
(283, 51560, 'MY52495112', 'DSO-X 2012A', 7, '2015-03-05 17:10:13', NULL, 2, NULL),
(284, 0, '999762898', 'VC2002', 1, '2015-03-05 17:12:52', NULL, 2, NULL),
(285, 0, '999762820', 'VC2002', 1, '2015-03-05 17:12:52', NULL, 2, NULL),
(286, 0, '999762800', 'VC2002', 1, '2015-03-05 17:12:52', NULL, 2, NULL),
(287, 0, '999762802', 'VC2002', 1, '2015-03-05 17:12:52', NULL, 2, NULL),
(288, 0, '999762846', 'VC2002', 1, '2015-03-05 17:12:52', NULL, 2, NULL),
(289, 0, '999762848', 'VC2002', 1, '2015-03-05 17:12:52', NULL, 2, NULL),
(290, 52586, 'MPL3303002568', 'MPL-3303', 1, '2015-03-05 17:14:24', NULL, 2, NULL),
(291, 49051, 'MPL3303001578', 'MPL-3303', 1, '2015-03-05 17:14:24', NULL, 2, NULL),
(292, 52576, 'MPL3303002754', 'MPL-3303', 1, '2015-03-05 17:14:24', NULL, 2, NULL),
(293, 49048, 'MPL3303001534', 'MPL-3303', 1, '2015-03-05 17:14:24', NULL, 2, NULL),
(294, 52575, 'MPL3303002487', 'MPL-3303', 1, '2015-03-05 17:14:24', NULL, 2, NULL),
(295, 52581, 'MPL3303002682', 'MPL-3303', 1, '2015-03-05 17:14:24', NULL, 2, NULL),
(296, 49050, 'MPL3303001521', 'MPL-3303', 1, '2015-03-05 17:14:24', NULL, 2, NULL),
(297, 49047, 'MPL3303001535', 'MPL-3303', 1, '2015-03-05 17:14:24', NULL, 2, NULL),
(298, 0, '102070-L', '8810', 1, '2015-03-05 17:16:05', NULL, 2, NULL),
(299, 0, '102082-L', '8810', 1, '2015-03-05 17:16:05', NULL, 2, NULL),
(300, 0, '102083-L', '8810', 1, '2015-03-05 17:16:05', NULL, 2, NULL),
(301, 0, '102054-L', '8810', 1, '2015-03-05 17:16:05', NULL, 2, NULL),
(302, 0, '102071-L', '8810', 1, '2015-03-05 17:16:05', NULL, 2, NULL),
(303, 0, '102076-L', '8810', 1, '2015-03-05 17:16:05', NULL, 2, NULL),
(304, 40336, '11028', 'FSC3003D', 1, '2015-03-05 17:19:56', NULL, 2, NULL),
(305, 40359, '11023', 'FSC3003D', 1, '2015-03-05 17:19:56', NULL, 2, NULL),
(306, 39624, '10258', 'FSC3003D', 1, '2015-03-05 17:19:56', NULL, 2, NULL),
(307, 49820, 'EH162144', 'GDS-2102', 15, '2015-03-05 21:28:59', NULL, 2, NULL),
(308, 49821, 'EH162148', 'GDS-2102', 15, '2015-03-05 21:28:59', NULL, 2, NULL),
(309, 54022, 'EI171269', 'GDS-820C', 15, '2015-03-05 21:29:29', NULL, 2, NULL),
(310, 0, 'EI171202', 'GDS-820C', 15, '2015-03-05 21:29:29', NULL, 2, NULL),
(311, 39169, 'FND30300111', 'MPC-303D', 15, '2015-03-05 21:32:39', NULL, 2, NULL),
(312, 65539, 'CN50473449', 'DSO1012A', 7, '2015-03-05 21:39:50', NULL, 2, NULL),
(313, 115372, 'CN50493974', 'DSO1012A', 7, '2015-03-05 21:39:50', NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qtd_equip_amb`
--
CREATE TABLE IF NOT EXISTS `qtd_equip_amb` (
`ambiente_id` int(11)
,`qtd_equip` bigint(21)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`) VALUES
(2, 'gutierrez', '$P$BLDCSZ0o0jb/S4QRw022jeSKtqAXsv.', 'gabriel.soares@ifpb.edu.br', 1, 0, NULL, NULL, NULL, NULL, NULL, '::1', '2015-03-05 22:07:30', '2015-01-05 21:51:56', '2015-03-05 21:07:30'),
(3, 'jonatas', '$P$BMq3iNeJv77mUxTxc0EC.7GQhGZDjG0', 'jonatas.bezerra@ifpb.edu.br', 1, 0, NULL, NULL, NULL, NULL, NULL, '::1', '2015-01-26 22:42:27', '2015-01-26 22:42:19', '2015-01-26 21:42:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_autologin`
--

CREATE TABLE IF NOT EXISTS `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_profiles`
--

CREATE TABLE IF NOT EXISTS `user_profiles` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `country`, `website`) VALUES
(1, 2, NULL, NULL),
(2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure for view `qtd_equip_amb`
--
DROP TABLE IF EXISTS `qtd_equip_amb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qtd_equip_amb` AS select distinct `ambiente`.`id` AS `ambiente_id`,(select count(`p2`.`id`) from `patrimonio` `p2` where (`ambiente`.`id` = `p2`.`ambiente`)) AS `qtd_equip` from `ambiente` order by `ambiente`.`nome`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambiente`
--
ALTER TABLE `ambiente`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
 ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `equipamento`
--
ALTER TABLE `equipamento`
 ADD PRIMARY KEY (`modelo`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patrimonio`
--
ALTER TABLE `patrimonio`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ambiente` (`ambiente`), ADD KEY `fk_cad_usuario` (`usuario_add`), ADD KEY `fk_usuario_mod` (`usuario_mod`), ADD KEY `fk_modelo` (`modelo`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_autologin`
--
ALTER TABLE `user_autologin`
 ADD PRIMARY KEY (`key_id`,`user_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ambiente`
--
ALTER TABLE `ambiente`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `patrimonio`
--
ALTER TABLE `patrimonio`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=314;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `patrimonio`
--
ALTER TABLE `patrimonio`
ADD CONSTRAINT `fk_cad_usuario` FOREIGN KEY (`usuario_add`) REFERENCES `users` (`id`),
ADD CONSTRAINT `fk_localizacao` FOREIGN KEY (`ambiente`) REFERENCES `ambiente` (`id`),
ADD CONSTRAINT `fk_modelo` FOREIGN KEY (`modelo`) REFERENCES `equipamento` (`modelo`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_usuario_mod` FOREIGN KEY (`usuario_mod`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
