-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Jul-2023 às 17:20
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `livrocaixa3`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `usuario`) VALUES
(1, 'Supermercado', 1),
(2, 'Salário', 1),
(3, 'Farmácia', 1),
(4, 'Restaurante', 1),
(5, 'Assinatura', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comprovantes`
--

CREATE TABLE `comprovantes` (
  `id` int(11) NOT NULL,
  `comp` mediumblob NOT NULL,
  `nome` varchar(150) CHARACTER SET utf8 NOT NULL,
  `tipo` varchar(150) CHARACTER SET utf8 NOT NULL,
  `ext` varchar(15) CHARACTER SET utf8 NOT NULL,
  `tamanho` varchar(15) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `exclusoes`
--

CREATE TABLE `exclusoes` (
  `id` int(11) NOT NULL,
  `id_mov_exc` int(11) NOT NULL,
  `tipo_mov` int(11) NOT NULL,
  `valor_mov` decimal(12,2) NOT NULL,
  `cat_mov` int(11) NOT NULL,
  `conta_mov` int(11) NOT NULL,
  `data_exc` date NOT NULL,
  `desc_mov` longtext NOT NULL,
  `usuario_mov` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `exclusoes`
--

INSERT INTO `exclusoes` (`id`, `id_mov_exc`, `tipo_mov`, `valor_mov`, `cat_mov`, `conta_mov`, `data_exc`, `desc_mov`, `usuario_mov`) VALUES
(1, 2, 0, '100.00', 1, 1, '2019-12-22', 'Compras do mês', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `id` int(11) NOT NULL,
  `id_mov` int(11) NOT NULL,
  `just_id` int(11) NOT NULL,
  `conta_mov` int(11) NOT NULL,
  `data` date NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`id`, `id_mov`, `just_id`, `conta_mov`, `data`, `usuario`) VALUES
(1, 8, 6, 1, '2023-03-26', 1),
(2, 8, 1, 1, '2023-03-26', 1),
(3, 8, 7, 1, '2023-03-26', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `just_ed`
--

CREATE TABLE `just_ed` (
  `id` int(11) NOT NULL,
  `just` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `just_ed`
--

INSERT INTO `just_ed` (`id`, `just`) VALUES
(1, 'Dia.'),
(2, 'Mês.'),
(3, 'Ano.'),
(4, 'Tipo.'),
(5, 'Categoria.'),
(6, 'Descrição.'),
(7, 'Valor.'),
(8, 'Conta.'),
(9, 'Comprovante.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentos`
--

CREATE TABLE `movimentos` (
  `id` int(11) NOT NULL,
  `dia` int(2) UNSIGNED ZEROFILL DEFAULT NULL,
  `mes` int(2) UNSIGNED ZEROFILL DEFAULT NULL,
  `ano` int(4) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `nparcela` int(2) DEFAULT NULL,
  `parcelas` int(2) DEFAULT NULL,
  `cat` int(11) DEFAULT NULL,
  `conta` int(1) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `edicao` longtext DEFAULT NULL,
  `comp_img` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `movimentos`
--

INSERT INTO `movimentos` (`id`, `dia`, `mes`, `ano`, `tipo`, `valor`, `nparcela`, `parcelas`, `cat`, `conta`, `usuario`, `descricao`, `edicao`, `comp_img`) VALUES
(1, 22, 12, 2019, 1, '422.00', 1, 1, 2, 1, 1, 'Valor Bruto', NULL, NULL),
(3, 22, 12, 2019, 0, '100.00', 1, 1, 1, 1, 1, 'Compras do mês', NULL, NULL),
(4, 22, 12, 2019, 0, '28.00', 1, 1, 3, 1, 1, 'Analgésicos', NULL, NULL),
(5, 22, 12, 2019, 0, '25.00', 1, 1, 4, 1, 1, 'Pizza', NULL, NULL),
(6, 22, 12, 2019, 0, '22.00', 1, 1, 4, 1, 1, 'Açaí', NULL, NULL),
(7, 22, 12, 2019, 0, '254.00', 1, 1, 1, 1, 1, 'Outras compras', NULL, NULL),
(8, 21, 03, 2023, 1, '1.20', 1, 1, 2, 1, 1, 'Folha de Abril', 'Editado', NULL),
(9, 20, 03, 2023, 0, '443.00', 1, 1, 3, 1, 1, 'Compra de Medicamento', NULL, NULL),
(10, 30, 03, 2023, 0, '48.99', 1, 1, 3, 2, 1, 'Medicamentos', NULL, NULL),
(11, 30, 03, 2023, 0, '600.00', 1, 1, 1, 3, 1, 'Compras do mês', NULL, NULL),
(12, 30, 03, 2023, 1, '1000.00', 1, 1, 3, 3, 1, 'Limite do cartão', NULL, NULL),
(13, 30, 03, 2023, 0, '2.99', 1, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(14, 30, 04, 2023, 0, '2.99', 2, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(15, 30, 05, 2023, 0, '2.99', 3, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(16, 30, 06, 2023, 0, '2.99', 4, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(17, 30, 07, 2023, 0, '2.99', 5, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(18, 30, 08, 2023, 0, '2.99', 6, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(19, 30, 09, 2023, 0, '2.99', 7, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(20, 30, 10, 2023, 0, '2.99', 8, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(21, 30, 11, 2023, 0, '2.99', 9, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(22, 30, 12, 2023, 0, '2.99', 10, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(23, 30, 01, 2024, 0, '2.99', 11, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(24, 30, 02, 2024, 0, '2.99', 12, 12, 5, 2, 1, 'Netflix', NULL, NULL),
(25, 31, 03, 2023, 0, '20.00', 1, 1, 5, 2, 1, 'Compras do mês', NULL, NULL),
(26, 18, 07, 2023, 1, '3.00', 1, 1, 2, 1, 1, 'Lápis - Samuel', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento`
--

CREATE TABLE `orcamento` (
  `id` int(11) NOT NULL,
  `mes` int(2) NOT NULL,
  `ano` int(4) NOT NULL,
  `valor` decimal(12,2) NOT NULL,
  `conta` int(1) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `orcamento`
--

INSERT INTO `orcamento` (`id`, `mes`, `ano`, `valor`, `conta`, `usuario`) VALUES
(1, 3, 2023, '1000.00', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(150) NOT NULL,
  `data` date NOT NULL,
  `ultimavisita` datetime DEFAULT NULL,
  `n_acesso_f` int(11) NOT NULL DEFAULT 0,
  `visa` decimal(12,2) NOT NULL DEFAULT 0.00,
  `dia_venc_v` int(11) DEFAULT NULL,
  `master` decimal(12,2) NOT NULL DEFAULT 0.00,
  `dia_venc_m` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `sobrenome`, `usuario`, `senha`, `data`, `ultimavisita`, `n_acesso_f`, `visa`, `dia_venc_v`, `master`, `dia_venc_m`) VALUES
(1, 'Mailson', 'Rafael', 'mailsonrg', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '2019-12-22', '2019-12-22 06:11:53', 2, '0.00', NULL, '0.00', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `comprovantes`
--
ALTER TABLE `comprovantes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `exclusoes`
--
ALTER TABLE `exclusoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `just_ed`
--
ALTER TABLE `just_ed`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `movimentos`
--
ALTER TABLE `movimentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `comprovantes`
--
ALTER TABLE `comprovantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `exclusoes`
--
ALTER TABLE `exclusoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `just_ed`
--
ALTER TABLE `just_ed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `movimentos`
--
ALTER TABLE `movimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
