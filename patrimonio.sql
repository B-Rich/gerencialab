-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24-Fev-2015 às 23:27
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
('18dfc82f6f4a24b2cc328adb123f9e85', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1424814797, ''),
('66cae94b2861cb68908013e4bcbd0adf', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 1424812342, ''),
('67f55e337fa126b5fb7b1b24976878c9', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1424814796, 'a:2:{s:9:"user_data";s:0:"";s:8:"messages";a:0:{}}'),
('ac809c03cbd7d024dac9eb8b577c476b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1424816384, 'a:5:{s:9:"user_data";s:0:"";s:7:"user_id";s:1:"2";s:8:"username";s:9:"gutierrez";s:6:"status";s:1:"1";s:8:"messages";a:0:{}}');

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
('850A', 'Sunko', 'Estação de Retrabalho Analógica'),
('DE2-115', 'Altera', 'Kit Desenvolvimento FPGA'),
('DSO-X 2012A', 'Agilent', 'Osciloscópio Digital 100MHz 2 canais'),
('DSO1012A', 'Agilent', 'Osciloscópio Digital 100MHz 2 canais'),
('DSO1022A', 'Agilent', 'Osciloscópio Digital 200MHz 2 canais'),
('E3631A', 'Agilent', 'Fonte DC Regulada 2 canais'),
('EKS-LM3S6965', 'Texas Instruments', 'Kit Desenvolvimento Stellaris ARM'),
('ES-915-220', 'Instrutherm', 'Estação de Solda Analógica'),
('ESD-800-220', 'Instrutherm', 'Estação de Retrabalho'),
('FA-3030', 'Instrutherm', 'Fonte DC Regulada 2 canais'),
('G1330', 'Grelco', 'Fonte DC 13V 30A'),
('GV-2002', 'Icel', 'Gerador de Função Digital 2MHz'),
('HK-936B', 'Hikari', 'Estação de Solda Analógica'),
('HP-760D', 'HoldPeak', 'Multímetro Digital'),
('LER-121A', 'Leap', 'Apagador de EEPROM'),
('MBT 301', 'Pace', 'Sistema de Solda'),
('MFG-4221', 'Minipa', 'Gerador de Função 20MHz 2 canais'),
('MG-3000', 'Icel', 'Megômetro Digital'),
('MO-2150', 'Minipa', 'Osciloscópio Digital 150MHz'),
('MP-2420', 'Minipa', 'Protoboard 2420 pontos'),
('MPL-3303', 'Minipa', 'Fonte DC Regulada 2 canais'),
('MPL-3305M', 'Minipa', 'Fonte DC Regulada'),
('MX-1050', 'Minipa', 'Ponte LCR'),
('Phaser 3428', 'Xerox', 'Impressora Laser'),
('ST-100', 'Pace', 'Sistema de Solda SMD'),
('TD-706', 'Instrutherm', 'Tacômetro Digital'),
('TD8012', 'Bit9', 'Kit Didático p/ Eletrônica Digital'),
('TR-5700', 'Icel', 'Alicate Terrômetro'),
('TS-850D', 'Toyo', 'Estação de Retrabalho'),
('U1232A', 'Agilent', 'Multímetro Digital Portátil True RMS'),
('U1731C', 'Agilent', 'Medidor LCR'),
('U3401A', 'Agilent', 'Multímetro Digital de Bancada'),
('U8031A', 'Agilent', 'Fonte DC Regulada 2 + 1 canais');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
`id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `patrimonio`
--

INSERT INTO `patrimonio` (`id`, `tombo`, `n_serie`, `modelo`, `ambiente`, `data_add`, `data_mod`, `usuario_add`, `usuario_mod`) VALUES
(1, 94143, 'MY53360139', 'U1232A', 10, '2015-01-26 14:02:30', NULL, 2, NULL),
(2, 94139, 'MY53360173', 'U1232A', 10, '2015-01-26 14:03:30', NULL, 2, NULL),
(6, 65542, 'MY51451677', 'DSO-X 2012A', 7, '2015-01-26 20:30:48', NULL, 2, NULL),
(7, 65532, 'MY51451722', 'DSO-X 2012A', 7, '2015-01-26 20:30:48', NULL, 2, NULL),
(8, 51084, 'MO2150000017', 'MO-2150', 7, '2015-01-26 20:33:19', NULL, 2, NULL),
(9, 51079, 'MO2150000021', 'MO-2150', 7, '2015-01-26 20:33:19', NULL, 2, NULL),
(10, 51080, 'MO2150000016', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
(11, 51082, 'MO2150000018', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
(12, 51085, 'MO2150000022', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
(13, 51083, 'MO2150000026', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
(14, 51077, 'MO2150000027', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
(15, 51078, 'MO2150000019', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
(16, 51081, 'MO2150000025', 'MO-2150', 7, '2015-01-26 20:33:20', NULL, 2, NULL),
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
(109, 0, 'CN50493958', 'DSO1012A', 19, '2015-02-13 18:13:41', NULL, 2, NULL),
(110, 0, 'CN50483802', 'DSO1012A', 19, '2015-02-13 18:13:41', NULL, 2, NULL),
(111, 0, 'CN50483837', 'DSO1012A', 19, '2015-02-13 18:13:41', NULL, 2, NULL),
(112, 0, 'CN50493960', 'DSO1012A', 19, '2015-02-13 18:13:41', NULL, 2, NULL),
(113, 0, 'CN50493990', 'DSO1012A', 19, '2015-02-13 18:13:41', NULL, 2, NULL),
(114, 0, 'CN50483774', 'DSO1012A', 19, '2015-02-13 18:13:41', NULL, 2, NULL),
(115, 0, 'CN50473511', 'DSO1012A', 19, '2015-02-13 18:13:41', NULL, 2, NULL),
(116, 65540, 'CN50493997', 'DSO1012A', 19, '2015-02-13 18:13:41', NULL, 2, NULL),
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
(134, 115376, 'MY53401139', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(135, 115378, 'MY53481260', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(136, 115381, 'MY53401141', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(137, 115377, 'MY53401127', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(138, 115373, 'MY53401119', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(139, 115380, 'MY53401143', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(140, 115375, 'MY53401137', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(141, 115379, 'MY53401124', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(142, 115382, 'MY53401140', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
(143, 115374, 'MY53401132', 'DSO-X 2012A', 15, '2015-02-23 20:04:57', NULL, 2, NULL),
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
(156, 59378, 'CN49424483', 'DSO1022A', 15, '2015-02-23 20:27:38', NULL, 2, NULL),
(157, 59379, 'CN49424484', 'DSO1022A', 15, '2015-02-23 20:27:38', NULL, 2, NULL),
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
(208, 0, '481675', 'G1330', 15, '2015-02-24 22:21:08', NULL, 2, NULL);

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
(2, 'gutierrez', '$P$BLDCSZ0o0jb/S4QRw022jeSKtqAXsv.', 'gabriel.soares@ifpb.edu.br', 1, 0, NULL, NULL, NULL, NULL, NULL, '::1', '2015-02-24 19:07:19', '2015-01-05 21:51:56', '2015-02-24 18:07:19'),
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patrimonio`
--
ALTER TABLE `patrimonio`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=209;
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
