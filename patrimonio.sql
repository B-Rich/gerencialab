-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26-Jan-2015 às 22:31
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
(15, 'Almoxarifado de Equipamentos (Circuito Impresso', 'Almoxarifado Equip'),
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
('31024614bb7a0c67aef7bed375918474', '10.0.27.162', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1422305105, ''),
('8d114eef10e8a81d17dbc1376cc97045', '10.0.27.162', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1422306179, ''),
('af0660342d7ba3b2c2984895e4433590', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1422300740, 'a:4:{s:9:"user_data";s:0:"";s:7:"user_id";s:1:"2";s:8:"username";s:9:"gutierrez";s:6:"status";s:1:"1";}'),
('f7fb71a6a8b6f8cfc026a9ed2a4e9b91', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1422307618, 'a:4:{s:9:"user_data";s:0:"";s:7:"user_id";s:1:"2";s:8:"username";s:9:"gutierrez";s:6:"status";s:1:"1";}');

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
('33521A', 'Agilent', 'Gerador de Função 30MHz'),
('DSO-X 2012A', 'Agilent', 'Osciloscopio Digital 100MHz 2 canais'),
('E3631A', 'Agilent', 'Fonte DC Regulada 2 canais'),
('FA-3030', 'Instrutherm', 'Fonte DC regulada 2 canais'),
('GV-2002', 'Icel', 'Gerador de Função Digital 2MHz'),
('MO-2150', 'Minipa', 'Osciloscópio Digital 150MHz'),
('MPL-3303', 'Minipa', 'Fonte DC Regulada 2 canais'),
('MX-1050', 'Minipa', 'Ponte LCR'),
('U1232A', 'Agilent', 'Multímetro Digital Portátil True RMS'),
('U3401A', 'Agilent', 'Multímetro Digital de Bancada');

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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

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
(50, 0, 'MY51020105', 'E3631A', 7, '2015-01-26 21:00:51', NULL, 2, NULL),
(51, 0, 'MY51510018', 'E3631A', 7, '2015-01-26 21:01:08', NULL, 2, NULL),
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
(83, 65508, 'MY50002971', '33521A', 16, '2015-01-26 21:29:15', NULL, 2, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`) VALUES
(2, 'gutierrez', '$P$BLDCSZ0o0jb/S4QRw022jeSKtqAXsv.', 'gabriel.soares@ifpb.edu.br', 1, 0, NULL, NULL, NULL, NULL, NULL, '10.0.27.162', '2015-01-26 21:56:16', '2015-01-05 21:51:56', '2015-01-26 20:56:16');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `country`, `website`) VALUES
(1, 2, NULL, NULL);

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
 ADD PRIMARY KEY (`id`), ADD KEY `fk_modelo` (`modelo`), ADD KEY `fk_ambiente` (`ambiente`), ADD KEY `fk_cad_usuario` (`usuario_add`), ADD KEY `fk_usuario_mod` (`usuario_mod`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `patrimonio`
--
ALTER TABLE `patrimonio`
ADD CONSTRAINT `fk_cad_usuario` FOREIGN KEY (`usuario_add`) REFERENCES `users` (`id`),
ADD CONSTRAINT `fk_localizacao` FOREIGN KEY (`ambiente`) REFERENCES `ambiente` (`id`),
ADD CONSTRAINT `fk_modelo` FOREIGN KEY (`modelo`) REFERENCES `equipamento` (`modelo`),
ADD CONSTRAINT `fk_usuario_mod` FOREIGN KEY (`usuario_mod`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
