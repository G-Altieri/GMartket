-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Nov 02, 2024 alle 19:31
-- Versione del server: 8.0.35
-- Versione PHP: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gmarket_db`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `caratteristica`
--

CREATE TABLE `caratteristica` (
  `id` int NOT NULL,
  `id_categoria` int DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `misura` varchar(10) DEFAULT NULL COMMENT 'unità di misura',
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `caratteristica`
--

INSERT INTO `caratteristica` (`id`, `id_categoria`, `nome`, `misura`, `version`) VALUES
(1, 1, 'Memoria', 'gb', 1),
(3, 5, 'Touch', 'Si/No', 1),
(4, 6, 'Colore', '.', 1),
(5, 7, 'Numero di Lavandini', '.', 1),
(6, 2, 'Colore', 'cc', 1),
(7, 14, 'Pagine', 'n. Pagine', 1),
(8, 13, 'Larghezza', 'cm', 1),
(9, 13, 'Lunghezza', 'cm', 1),
(10, 13, 'Altezza', 'cm', 1),
(11, 10, 'Piazza', '1/2/3', 1),
(12, 11, 'Numero di Cuscini', 'numero', 1),
(13, 9, 'Grandezza', 'm^2', 1),
(14, 8, 'Grandezza', 'Pollici', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `id_padre` int DEFAULT NULL,
  `ha_figlio` tinyint(1) DEFAULT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id`, `nome`, `id_padre`, `ha_figlio`, `version`) VALUES
(1, 'Tecnologia', NULL, 1, 2),
(2, 'Informatica', 1, 0, 3),
(3, 'PC', 2, NULL, 1),
(4, 'Telefonia', 1, 0, 2),
(5, 'Smartphone', 4, NULL, 1),
(6, 'Arredo', NULL, 0, 2),
(7, 'Cucina', 6, NULL, 1),
(8, 'Tablet', NULL, NULL, 1),
(9, 'Camera Da Letto', NULL, 1, 2),
(10, 'Letto', 9, 1, 2),
(11, 'Cuscini', 10, NULL, 1),
(12, 'Armadio', 9, NULL, 1),
(13, 'Scaffali', 9, 0, 2),
(14, 'Libri', 13, NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `notifica`
--

CREATE TABLE `notifica` (
  `id` int NOT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1',
  `titolo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contenuto` text COLLATE utf8mb4_general_ci,
  `letta` tinyint(1) NOT NULL DEFAULT '0',
  `id_utente` int DEFAULT NULL,
  `richiesta` int DEFAULT NULL,
  `proposta` int DEFAULT NULL,
  `ordine` int DEFAULT NULL,
  `ruolo` enum('AMMINISTRATORE','TECNICO','ORDINANTE') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `notifica`
--

INSERT INTO `notifica` (`id`, `version`, `titolo`, `contenuto`, `letta`, `id_utente`, `richiesta`, `proposta`, `ordine`, `ruolo`, `created_at`) VALUES
(25, 1, 'Nuova Richiesta', 'Richiesta di Rossello Esposito categoria: Smartphone', 1, NULL, 40, NULL, NULL, 'TECNICO', '2024-11-02 18:58:56'),
(26, 1, 'Nuova Richiesta', 'Richiesta di Rossello Esposito categoria: Cucina', 1, NULL, 41, NULL, NULL, 'TECNICO', '2024-11-02 18:59:34'),
(27, 1, 'Nuova Richiesta', 'Richiesta di Rossello Esposito categoria: PC', 0, NULL, 42, NULL, NULL, 'TECNICO', '2024-11-02 19:00:08'),
(28, 1, 'Nuova Richiesta', 'Richiesta di Rossello Esposito categoria: Cucina', 1, NULL, 43, NULL, NULL, 'TECNICO', '2024-11-02 19:00:39'),
(29, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta #MH1C2 é stata presa in carico da: Francesco  De Mirko', 1, 16, 43, NULL, NULL, NULL, '2024-11-02 19:08:13'),
(30, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #MH1C2', 1, 16, 43, 22, NULL, NULL, '2024-11-02 19:09:36'),
(31, 1, 'Nuova Richiesta', 'Richiesta di Filippo Di Marco categoria: Tablet', 1, NULL, 44, NULL, NULL, 'TECNICO', '2024-11-02 19:10:31'),
(32, 1, 'Nuova Richiesta', 'Richiesta di Filippo Di Marco categoria: Armadio', 1, NULL, 45, NULL, NULL, 'TECNICO', '2024-11-02 19:11:05'),
(33, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta #0HDZU é stata presa in carico da: Gentile De Rossi', 1, 16, 41, NULL, NULL, NULL, '2024-11-02 19:11:48'),
(34, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta #C0MMU é stata presa in carico da: Gentile De Rossi', 1, 19, 44, NULL, NULL, NULL, '2024-11-02 19:11:51'),
(35, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #C0MMU', 1, 19, 44, 23, NULL, NULL, '2024-11-02 19:13:15'),
(36, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta #HM1TN é stata presa in carico da: Gentile De Rossi', 1, 16, 40, NULL, NULL, NULL, '2024-11-02 19:13:30'),
(37, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #0HDZU', 1, 16, 41, 24, NULL, NULL, '2024-11-02 19:14:43'),
(38, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #HM1TN', 1, 16, 40, 25, NULL, NULL, '2024-11-02 19:15:31'),
(39, 1, 'Nuova Richiesta', 'Richiesta di Filippo Di Marco categoria: Cuscini', 1, NULL, 46, NULL, NULL, 'TECNICO', '2024-11-02 19:17:38'),
(40, 1, 'Aggiornamento Stato Proposta', 'La proposta #UBVRI é stata valutata: RIFIUTATO', 0, 17, 44, 23, NULL, NULL, '2024-11-02 19:18:04'),
(41, 1, 'Nuova Richiesta', 'Richiesta di Filippo Di Marco categoria: Libri', 0, NULL, 47, NULL, NULL, 'TECNICO', '2024-11-02 19:18:42'),
(42, 1, 'Nuova Richiesta', 'Richiesta di Filippo Di Marco categoria: Armadio', 1, NULL, 48, NULL, NULL, 'TECNICO', '2024-11-02 19:19:10'),
(43, 1, 'Aggiornamento Stato Proposta', 'La proposta #LMCKY é stata valutata: ACCETTATO', 0, 17, 41, 24, NULL, NULL, '2024-11-02 19:22:14'),
(44, 1, 'Aggiornamento Stato Proposta', 'La proposta #HN8CL é stata valutata: RIFIUTATO', 1, 18, 43, 22, NULL, NULL, '2024-11-02 19:22:30'),
(45, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta #P5WUT é stata presa in carico da: Francesco  De Mirko', 0, 19, 46, NULL, NULL, NULL, '2024-11-02 19:23:45'),
(46, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta #NBSLU é stata presa in carico da: Francesco  De Mirko', 1, 19, 45, NULL, NULL, NULL, '2024-11-02 19:23:47'),
(47, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta #CA1TD é stata presa in carico da: Francesco  De Mirko', 0, 19, 48, NULL, NULL, NULL, '2024-11-02 19:23:54'),
(48, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #CA1TD', 0, 19, 48, 26, NULL, NULL, '2024-11-02 19:26:05'),
(49, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #P5WUT', 1, 19, 46, 27, NULL, NULL, '2024-11-02 19:26:39'),
(50, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #MH1C2', 1, 16, 43, 28, NULL, NULL, '2024-11-02 19:27:16'),
(51, 1, 'Ordine Spedito!!!', 'Il tuo ordine #LMCKY é stata spedito in data: 2024-11-02 20:27:50.882', 1, 16, 41, 24, 24, NULL, '2024-11-02 19:27:50'),
(52, 1, 'Aggiornamento Stato Proposta', 'La proposta #CJI57 é stata valutata: ACCETTATO', 0, 18, 46, 27, NULL, NULL, '2024-11-02 19:28:58'),
(53, 1, 'Ordine Contrassegnato', 'L\'ordine #LMCKY é stata contrassegnato con: RESPINTO_NONCONFORME', 1, NULL, 41, 24, 24, 'TECNICO', '2024-11-02 19:29:54'),
(54, 1, 'Aggiornamento Stato Proposta', 'La proposta #Q9N7D é stata valutata: ACCETTATO', 0, 17, 40, 25, NULL, NULL, '2024-11-02 19:30:08'),
(55, 1, 'Aggiornamento Stato Proposta', 'La proposta #KJYJ6 é stata valutata: ACCETTATO', 0, 18, 43, 28, NULL, NULL, '2024-11-02 19:30:21'),
(56, 1, 'Ordine Spedito!!!', 'Il tuo ordine #CJI57 é stata spedito in data: 2024-11-02 20:30:45.807', 0, 19, 46, 27, 27, NULL, '2024-11-02 19:30:45');

-- --------------------------------------------------------

--
-- Struttura della tabella `proposta`
--

CREATE TABLE `proposta` (
  `id` int NOT NULL,
  `codice_proposta` varchar(5) DEFAULT NULL,
  `id_richiesta` int DEFAULT NULL,
  `nome_produttore` varchar(20) DEFAULT NULL,
  `nome_prodotto` varchar(20) DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `link` text,
  `note` varchar(30) DEFAULT NULL,
  `stato` enum('ACCETTATO','RIFIUTATO','IN_SOSPESO','SPEDITO','CONTRASSEGNATO') DEFAULT NULL,
  `motivazione` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `stato_ordine` enum('ACCETTATO','RESPINTO_NONCONFORME','RESPINTO_NONFUNZIONANTE','IN_ATTESA') DEFAULT NULL COMMENT 'gestione del rifiuto dell''ordine spedito',
  `data_ordine` timestamp NULL DEFAULT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `proposta`
--

INSERT INTO `proposta` (`id`, `codice_proposta`, `id_richiesta`, `nome_produttore`, `nome_prodotto`, `prezzo`, `link`, `note`, `stato`, `motivazione`, `created_at`, `update_at`, `stato_ordine`, `data_ordine`, `version`) VALUES
(22, 'HN8CL', 43, 'Amazon', 'Lavandino Bianco', 450, 'https://www.amazon.it', 'Lavandino semplice', 'RIFIUTATO', 'No su Amazon ', '2024-11-02 19:09:36', NULL, NULL, NULL, 1),
(23, 'UBVRI', 44, 'Samsung', 'Tablet As A12', 435, 'https://www.samsung.com/it/', 'C\'Ã¨ anche a meno', 'RIFIUTATO', 'Voglio anche quello che c\'e a meno', '2024-11-02 19:13:15', NULL, NULL, NULL, 1),
(24, 'LMCKY', 41, 'PoltroneSofa', 'Lavandino di acciaio', 330, 'https://www.poltronesofa.com/it-IT', '', 'CONTRASSEGNATO', NULL, '2024-11-02 19:14:44', NULL, 'RESPINTO_NONCONFORME', '2024-11-02 19:27:51', 3),
(25, 'Q9N7D', 40, 'Apple', 'I Phone 15', 1200, 'https://www.euronics.it', '', 'ACCETTATO', NULL, '2024-11-02 19:15:32', NULL, NULL, NULL, 1),
(26, 'O3TVN', 48, 'Ikea', 'Lavandino Ikea', 300, 'https://www.ikea.com/it/it/', '', 'IN_SOSPESO', NULL, '2024-11-02 19:26:05', NULL, NULL, NULL, 0),
(27, 'CJI57', 46, 'Ikea', 'Cuscini ikea', 250, 'https://www.ikea.com/it/it/', 'Sono rossi', 'SPEDITO', NULL, '2024-11-02 19:26:39', NULL, 'IN_ATTESA', '2024-11-02 19:30:46', 2),
(28, 'KJYJ6', 43, 'Ikea Mobili', 'Lavandino Ikea', 300, 'https://www.ikea.com/it/it/', 'No su Amazon', 'ACCETTATO', NULL, '2024-11-02 19:27:17', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta`
--

CREATE TABLE `richiesta` (
  `id` int NOT NULL,
  `codice` varchar(5) DEFAULT NULL,
  `id_ordinante` int DEFAULT NULL,
  `id_tecnico` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL COMMENT 'del nipote',
  `note` text,
  `stato` enum('ASSEGNATO','IN_ATTESA','COMPLETATO','SPEDITO') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `richiesta`
--

INSERT INTO `richiesta` (`id`, `codice`, `id_ordinante`, `id_tecnico`, `id_categoria`, `note`, `stato`, `created_at`, `updated_at`, `version`) VALUES
(40, 'HM1TN', 16, 17, 5, 'Senza graffi', 'ASSEGNATO', '2024-11-02 18:58:57', NULL, 2),
(41, '0HDZU', 16, 17, 7, 'Possibilmente non di plastica', 'COMPLETATO', '2024-11-02 18:59:35', NULL, 4),
(42, 'DW0CD', 16, NULL, 3, 'Possibilmente Apple', 'IN_ATTESA', '2024-11-02 19:00:08', NULL, 1),
(43, 'MH1C2', 16, 18, 7, 'piccoli per bagno di medie dimensioni', 'ASSEGNATO', '2024-11-02 19:00:40', NULL, 2),
(44, 'C0MMU', 19, 17, 8, 'Non troppo costoso', 'ASSEGNATO', '2024-11-02 19:10:32', NULL, 2),
(45, 'NBSLU', 19, 18, 12, 'Armadio a 2 ante', 'ASSEGNATO', '2024-11-02 19:11:05', NULL, 2),
(46, 'P5WUT', 19, 18, 11, NULL, 'SPEDITO', '2024-11-02 19:17:38', NULL, 3),
(47, 'DQXEY', 19, NULL, 14, NULL, 'IN_ATTESA', '2024-11-02 19:18:42', NULL, 1),
(48, 'CA1TD', 19, 18, 12, 'armadio piccolo ', 'ASSEGNATO', '2024-11-02 19:19:11', NULL, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta_caratteristica`
--

CREATE TABLE `richiesta_caratteristica` (
  `id` int NOT NULL,
  `id_richiesta` int DEFAULT NULL,
  `valore` text,
  `id_caratteristica` int DEFAULT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `richiesta_caratteristica`
--

INSERT INTO `richiesta_caratteristica` (`id`, `id_richiesta`, `valore`, `id_caratteristica`, `version`) VALUES
(51, 32, 'indifferente', 4, 1),
(52, 33, 'indifferente', 5, 1),
(53, 33, 'indifferente', 4, 1),
(54, 34, 'indifferente', 5, 1),
(55, 34, 'indifferente', 4, 1),
(56, 35, 'indifferente', 5, 1),
(57, 35, 'indifferente', 4, 1),
(58, 36, 'indifferente', 5, 1),
(59, 36, 'indifferente', 4, 1),
(60, 37, 'indifferente', 3, 1),
(61, 37, 'indifferente', 1, 1),
(62, 38, 'indifferente', 2, 1),
(63, 38, 'indifferente', 1, 1),
(64, 39, 'hahah', 3, 1),
(65, 39, 'ahaha', 1, 1),
(66, 40, 'Si', 3, 1),
(67, 40, '128', 1, 1),
(68, 41, '1', 5, 1),
(69, 41, 'indifferente', 4, 1),
(70, 42, 'Nero', 6, 1),
(71, 42, 'indifferente', 1, 1),
(72, 43, '5', 5, 1),
(73, 43, 'Bianchi e Neri', 4, 1),
(74, 44, '28', 14, 1),
(75, 45, '120', 13, 1),
(76, 46, '4', 12, 1),
(77, 46, '2', 11, 1),
(78, 46, '12', 13, 1),
(79, 47, 'indifferente', 7, 1),
(80, 47, '12', 8, 1),
(81, 47, '15', 9, 1),
(82, 47, '35', 10, 1),
(83, 47, 'indifferente', 13, 1),
(84, 48, '5', 13, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cognome` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ruolo` enum('AMMINISTRATORE','TECNICO','ORDINANTE','') DEFAULT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id`, `nome`, `cognome`, `email`, `password`, `created_at`, `updated_at`, `ruolo`, `version`) VALUES
(1, 'Davide', 'Bianchi', 'generale@generale.com', 'c2d4bf72431b05244e53e7cd1a5a001e3bc77e7ffcc85cb9d70646a47b7716f8103883662873d972656bfb926ce58fb8', '2024-10-22 09:21:53', NULL, 'ORDINANTE', 1),
(2, 'Francesco', 'Rossi', 'generale@generale.com', 'c2d4bf72431b05244e53e7cd1a5a001e3bc77e7ffcc85cb9d70646a47b7716f8103883662873d972656bfb926ce58fb8', '2024-10-22 09:21:53', NULL, 'TECNICO', 1),
(3, 'Alessandro', 'Verdi', 'generale@generale.com', 'c2d4bf72431b05244e53e7cd1a5a001e3bc77e7ffcc85cb9d70646a47b7716f8103883662873d972656bfb926ce58fb8', '2024-10-22 09:21:53', NULL, 'AMMINISTRATORE', 1),
(5, 'Roberto', 'Di carlo', 'robertodicarlo@gmail.com', 'ab910453533540a7814834cb5d7096b8539a1cf522b6166ee36335aa19c231c5d6c41f8b4fae42c56e717a3c6e53a20f', '2024-10-17 15:18:07', NULL, 'ORDINANTE', 1),
(9, 'Maria', 'Francesca', 'mariafrancesca@outlook.it', '4e508b03b64f4c063222ad5c4e86e7c83ea238f7b7ea66d4fd40216c9a8741920b37725a6fd96e501b84132345506806', '2024-10-19 16:43:13', NULL, 'ORDINANTE', 3),
(10, 'Leone', 'Mira', 'leonemira32@gmail.com', '48a2798d47e1e8dd4aac29db1c7f72e73d291c2790a6bf72ecdc8be9a6026e2dd66d0c0e26c8b42d2dae5f127c807b60', '2024-10-21 14:12:51', NULL, 'AMMINISTRATORE', 2),
(14, 'Rosella', 'Vampi', 'rossellavampi@gmail.com', '65818afc52f0619ccda710e938c2e5f2700a53b039283fac674a6169323de928a4be3b46ec0dda19731c6ba8c153efc4', '2024-10-23 08:58:09', NULL, 'ORDINANTE', 1),
(15, 'mario', 'Rocco', 'mariorocco@gmai.com', '631bd0e144bfde1f1de0628efa5fc5490ea4ee645342ab98f3855c61744c7074b4527cc263158ccdcc60ae7373ec28b9', '2024-10-25 17:23:54', NULL, 'TECNICO', 1),
(16, 'Rossello', 'Esposito', 'rosselloesposito10@gmail.com', '67a70829bacda4c152a9cb8374e29bdc116c92dc4f190a01f5da1bdb55b3ab7a20c93c864c655552cd4fc2f94b4d54bd', '2024-11-02 18:57:37', NULL, 'ORDINANTE', 1),
(17, 'Gentile', 'De Rossi', 'gentile10@gmail.com', 'd47c989a868e2cfe4e551105b6e599f28be4d534455f79fd14123f001a9ab62971284f0e234a5e2ef59d4d1f46feb868', '2024-11-02 19:01:28', NULL, 'TECNICO', 1),
(18, 'Francesco ', 'De Mirko', 'francesco@gmail.com', '8a9bd2ed263cde92172044f2e3ae0ef2db3c1bd6ed51e32775e831a15c79fa9fef5e78800bac6eec6503d39966d20e06', '2024-11-02 19:02:01', NULL, 'TECNICO', 1),
(19, 'Filippo', 'Di Marco', 'filippodimarco@gmail.com', '886802dac8bf65907cb00d4d4c1d3bb5e0a4565f1d7d9647f7d284842914fc77c25adabcf06305b1256a6ac7d49b407f', '2024-11-02 19:02:29', NULL, 'ORDINANTE', 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `caratteristica`
--
ALTER TABLE `caratteristica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria` (`id_categoria`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_padre` (`id_padre`);

--
-- Indici per le tabelle `notifica`
--
ALTER TABLE `notifica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY `proposta` (`proposta`),
  ADD KEY `richiesta` (`richiesta`);

--
-- Indici per le tabelle `proposta`
--
ALTER TABLE `proposta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_richiestaV` (`id_richiesta`);

--
-- Indici per le tabelle `richiesta`
--
ALTER TABLE `richiesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_ordinante` (`id_ordinante`);

--
-- Indici per le tabelle `richiesta_caratteristica`
--
ALTER TABLE `richiesta_caratteristica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_caratteristica` (`id_caratteristica`),
  ADD KEY `id_richiesta` (`id_richiesta`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `caratteristica`
--
ALTER TABLE `caratteristica`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `notifica`
--
ALTER TABLE `notifica`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT per la tabella `proposta`
--
ALTER TABLE `proposta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT per la tabella `richiesta_caratteristica`
--
ALTER TABLE `richiesta_caratteristica`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `caratteristica`
--
ALTER TABLE `caratteristica`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`);

--
-- Limiti per la tabella `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `id_padre` FOREIGN KEY (`id_padre`) REFERENCES `categoria` (`id`);

--
-- Limiti per la tabella `notifica`
--
ALTER TABLE `notifica`
  ADD CONSTRAINT `id_utente` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `ordine` FOREIGN KEY (`proposta`) REFERENCES `proposta` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `proposta` FOREIGN KEY (`proposta`) REFERENCES `proposta` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `richiesta` FOREIGN KEY (`richiesta`) REFERENCES `richiesta` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Limiti per la tabella `proposta`
--
ALTER TABLE `proposta`
  ADD CONSTRAINT `id_richiestaV` FOREIGN KEY (`id_richiesta`) REFERENCES `richiesta` (`id`);

--
-- Limiti per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `id_ordinante` FOREIGN KEY (`id_ordinante`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `id_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `utente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
