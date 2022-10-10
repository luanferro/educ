-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Out-2022 às 15:10
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `educ_database`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb01_aluno`
--

CREATE TABLE `tb01_aluno` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `data_nascimento` date NOT NULL,
  `ano` varchar(2) NOT NULL,
  `turma` varchar(5) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb01_aluno`
--

INSERT INTO `tb01_aluno` (`matricula`, `nome`, `sexo`, `data_nascimento`, `ano`, `turma`, `usuario`, `senha`) VALUES
(1232133, 'Laisa Lopes', 'feminino', '0000-00-00', '9', '19BV', 'laisalopes', 'laisa1007'),
(1234567, 'Luan Ferro', 'masculino', '0000-00-00', '9', '19BM', 'luanferro', 'luan2204');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb01_aluno`
--
ALTER TABLE `tb01_aluno`
  ADD PRIMARY KEY (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
