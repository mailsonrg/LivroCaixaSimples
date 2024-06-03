-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jun-2024 às 01:20
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `livrocaixa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `usuario`) VALUES
(1, 'Supermercado', 1),
(2, 'Salário', 1),
(4, 'Restaurante', 1),
(5, 'Assinatura', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comprovantes`
--

CREATE TABLE `comprovantes` (
  `id` int(11) NOT NULL,
  `comp` mediumblob NOT NULL,
  `nome` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ext` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tamanho` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `exclusoes`
--

INSERT INTO `exclusoes` (`id`, `id_mov_exc`, `tipo_mov`, `valor_mov`, `cat_mov`, `conta_mov`, `data_exc`, `desc_mov`, `usuario_mov`) VALUES
(1, 2, 0, 100.00, 1, 1, '2019-12-22', 'Compras do mês', 1),
(2, 17, 0, 2.99, 5, 2, '2023-07-29', 'Netflix', 1),
(3, 39, 0, 25.00, 5, 1, '2023-07-29', 'Teste', 1),
(4, 37, 1, 500.00, 2, 1, '2023-07-29', 'Folha de Março', 1),
(5, 38, 0, 100.00, 1, 1, '2023-07-29', 'Compras do mês', 1),
(6, 40, 1, 2.00, 2, 1, '2023-07-29', 'Teste 25', 1),
(7, 42, 1, 20.00, 2, 1, '2023-07-29', 'Medicamentos', 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`id`, `id_mov`, `just_id`, `conta_mov`, `data`, `usuario`) VALUES
(1, 8, 6, 1, '2023-03-26', 1),
(2, 8, 1, 1, '2023-03-26', 1),
(3, 8, 7, 1, '2023-03-26', 1),
(4, 36, 6, 1, '2023-07-29', 1),
(5, 36, 7, 1, '2023-07-29', 1),
(6, 36, 8, 3, '2023-07-29', 1),
(7, 35, 6, 1, '2023-07-29', 1),
(8, 35, 8, 3, '2023-07-29', 1),
(9, 34, 6, 1, '2023-07-29', 1),
(10, 34, 7, 1, '2023-07-29', 1),
(11, 34, 7, 1, '2023-07-29', 1),
(12, 34, 1, 1, '2023-07-29', 1),
(13, 34, 2, 1, '2023-07-29', 1),
(14, 34, 3, 1, '2023-07-29', 1),
(15, 34, 4, 1, '2023-07-29', 1),
(16, 34, 5, 1, '2023-07-29', 1),
(17, 34, 6, 1, '2023-07-29', 1),
(18, 34, 7, 1, '2023-07-29', 1),
(19, 34, 8, 1, '2023-07-29', 1),
(37, 44, 6, 1, '2023-09-03', 1),
(36, 44, 6, 1, '2023-09-03', 1),
(35, 47, 4, 1, '2023-09-02', 1),
(34, 44, 6, 1, '2023-09-02', 1),
(33, 44, 7, 1, '2023-09-02', 1),
(32, 44, 6, 1, '2023-09-02', 1),
(31, 44, 6, 1, '2023-09-02', 1),
(30, 41, 6, 1, '2023-07-29', 1),
(29, 41, 7, 1, '2023-07-29', 1),
(38, 44, 6, 1, '2023-09-03', 1),
(39, 44, 6, 1, '2023-09-03', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `just_ed`
--

CREATE TABLE `just_ed` (
  `id` int(11) NOT NULL,
  `just` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `movimentos`
--

INSERT INTO `movimentos` (`id`, `dia`, `mes`, `ano`, `tipo`, `valor`, `nparcela`, `parcelas`, `cat`, `conta`, `usuario`, `descricao`, `edicao`, `comp_img`) VALUES
(48, 21, 04, 2024, 1, 1412.00, 1, 1, 2, 1, 1, 'Folha de Abril', NULL, NULL),
(41, 29, 07, 2023, 1, 800.00, 1, 1, 2, 1, 1, 'Folha', 'Editado', NULL),
(43, 29, 07, 2023, 0, 25.00, 1, 1, 5, 1, 1, 'Netflix', NULL, NULL),
(44, 02, 09, 2023, 0, 100.00, 1, 1, 5, 1, 1, '+ Teste', 'Editado', NULL),
(46, 02, 09, 2023, 0, 10.00, 1, 1, 5, 1, 1, 'Medicamentos', NULL, NULL),
(45, 02, 09, 2023, 1, 1000.00, 1, 1, 2, 1, 1, 'Folha de Pgto', NULL, NULL),
(47, 02, 09, 2023, 0, 30.00, 1, 1, 5, 1, 1, 'Netflix', 'Editado', NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `orcamento`
--

INSERT INTO `orcamento` (`id`, `mes`, `ano`, `valor`, `conta`, `usuario`) VALUES
(1, 3, 2023, 1000.00, 2, 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `sobrenome`, `usuario`, `senha`, `data`, `ultimavisita`, `n_acesso_f`, `visa`, `dia_venc_v`, `master`, `dia_venc_m`) VALUES
(1, 'Mailson', 'Rafael', 'mailsonrg', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '2019-12-22', '2024-06-02 20:11:53', 12, 100.00, 5, 0.00, NULL),
(2, 'Teste', '123456', 'teste', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '2024-04-21', '2024-04-21 13:49:59', 1, 0.00, NULL, 0.00, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `comprovantes`
--
ALTER TABLE `comprovantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `exclusoes`
--
ALTER TABLE `exclusoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `just_ed`
--
ALTER TABLE `just_ed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `movimentos`
--
ALTER TABLE `movimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
