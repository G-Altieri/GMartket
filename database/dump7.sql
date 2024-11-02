-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 31, 2024 alle 15:00
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

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
  `id` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `misura` varchar(10) DEFAULT NULL COMMENT 'unità di misura',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `caratteristica`
--

INSERT INTO `caratteristica` (`id`, `id_categoria`, `nome`, `misura`, `version`) VALUES
(1, 1, 'Memoria', 'gb', 1),
(2, 3, 'Sistema Operativo', 'os', 1),
(3, 5, 'Touch', 'Si/No', 1),
(4, 6, 'Colore', '.', 1),
(5, 7, 'Numero di Lavandini', '.', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `ha_figlio` tinyint(1) DEFAULT NULL,
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id`, `nome`, `id_padre`, `ha_figlio`, `version`) VALUES
(1, 'Tecnologia', NULL, 1, 2),
(2, 'Informatica', 1, 1, 2),
(3, 'PC', 2, NULL, 1),
(4, 'Telefonia', 1, 0, 2),
(5, 'Smartphone', 4, NULL, 1),
(6, 'Arredo', NULL, 0, 2),
(7, 'Cucina', 6, NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `notifica`
--

CREATE TABLE `notifica` (
  `id` int(11) NOT NULL,
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `titolo` varchar(50) DEFAULT NULL,
  `contenuto` text DEFAULT NULL,
  `letta` tinyint(1) NOT NULL DEFAULT 0,
  `id_utente` int(11) DEFAULT NULL,
  `richiesta` int(11) DEFAULT NULL,
  `proposta` int(11) DEFAULT NULL,
  `ordine` int(11) DEFAULT NULL,
  `ruolo` enum('AMMINISTRATORE','TECNICO','ORDINANTE') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `notifica`
--

INSERT INTO `notifica` (`id`, `version`, `titolo`, `contenuto`, `letta`, `id_utente`, `richiesta`, `proposta`, `ordine`, `ruolo`, `created_at`) VALUES
(4, 1, 'Nuova Richiesta', 'Richiesta di GiovanniO Rossi categoria: Smartphone', 1, NULL, 37, NULL, NULL, 'TECNICO', '2024-10-31 12:26:30'),
(5, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta richiesta #2ZRPI é stata presa in carico da: GiovanniT Rossi', 1, 1, 37, NULL, NULL, NULL, '2024-10-31 12:26:30'),
(6, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #2ZRPI', 1, 1, 37, 17, NULL, NULL, '2024-10-31 12:26:30'),
(7, 1, 'Aggiornamento Stato Proposta', 'La proposta #SG8MJ é stata valutata', 1, 2, 37, 17, NULL, NULL, '2024-10-31 12:26:30'),
(8, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #2ZRPI', 1, 1, 37, 18, NULL, NULL, '2024-10-31 12:26:30'),
(9, 1, 'Aggiornamento Stato Proposta', 'La proposta #TJXR3 é stata valutata: ACCETTATO', 1, 2, 37, 18, NULL, NULL, '2024-10-31 12:26:30'),
(10, 1, 'Ordine Spedito!!!', 'Il tuo ordine #TJXR3 é stata spedito in data: 2024-10-29 21:43:48.345', 1, 1, 37, 18, 18, NULL, '2024-10-31 12:26:30'),
(11, 1, 'Ordine Contrassegnato', 'L\'ordine #TJXR3 é stata contrassegnato con: RESPINTO_NONCONFORME', 1, NULL, 37, 18, 18, 'TECNICO', '2024-10-31 12:26:30'),
(12, 1, 'Nuova Richiesta', 'Richiesta di GiovanniO Rossi categoria: PC', 1, NULL, 38, NULL, NULL, 'TECNICO', '2024-10-31 12:26:30'),
(13, 1, 'La tua richiesta é stata presa in carico!!!', 'La richiesta #4ISRZ é stata presa in carico da: GiovanniT Rossi', 1, 1, 38, NULL, NULL, NULL, '2024-10-31 12:26:30'),
(14, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #4ISRZ', 1, 1, 38, 19, NULL, NULL, '2024-10-31 12:26:30'),
(15, 1, 'Aggiornamento Stato Proposta', 'La proposta #EI5OS é stata valutata: ACCETTATO', 1, 2, 38, 19, NULL, NULL, '2024-10-31 12:26:30'),
(16, 1, 'Aggiornamento Stato Proposta', 'La proposta #1IU3H é stata valutata: RIFIUTATO', 1, 2, 22, 14, NULL, NULL, '2024-10-31 12:26:30'),
(17, 1, 'Ordine Spedito!!!', 'Il tuo ordine #EI5OS é stata spedito in data: 2024-10-30 20:10:03.223', 1, 1, 38, 19, 19, NULL, '2024-10-31 12:26:30'),
(18, 1, 'Ordine Contrassegnato', 'L\'ordine #EI5OS é stata contrassegnato con: ACCETTATO', 1, NULL, 38, 19, 19, 'TECNICO', '2024-10-31 12:26:30'),
(19, 1, 'Nuova Proposta!!!', 'Una nuova proposta per la richiesta #50FMG', 1, 1, 22, 20, NULL, NULL, '2024-10-31 12:26:30'),
(20, 1, 'Aggiornamento Stato Proposta', 'La proposta #T56U7 é stata valutata: ACCETTATO', 1, 2, 22, 20, NULL, NULL, '2024-10-31 13:53:21'),
(21, 1, 'Ordine Spedito!!!', 'Il tuo ordine #T56U7 é stata spedito in data: 2024-10-31 14:53:58.084', 0, 1, 22, 20, 20, NULL, '2024-10-31 13:53:58');

-- --------------------------------------------------------

--
-- Struttura della tabella `proposta`
--

CREATE TABLE `proposta` (
  `id` int(11) NOT NULL,
  `codice_proposta` varchar(5) DEFAULT NULL,
  `id_richiesta` int(11) DEFAULT NULL,
  `nome_produttore` varchar(20) DEFAULT NULL,
  `nome_prodotto` varchar(20) DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `link` text DEFAULT NULL,
  `note` varchar(30) DEFAULT NULL,
  `stato` enum('ACCETTATO','RIFIUTATO','IN_SOSPESO','SPEDITO','CONTRASSEGNATO') DEFAULT NULL,
  `motivazione` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `stato_ordine` enum('ACCETTATO','RESPINTO_NONCONFORME','RESPINTO_NONFUNZIONANTE','IN_ATTESA') DEFAULT NULL COMMENT 'gestione del rifiuto dell''ordine spedito',
  `data_ordine` timestamp NULL DEFAULT NULL,
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `proposta`
--

INSERT INTO `proposta` (`id`, `codice_proposta`, `id_richiesta`, `nome_produttore`, `nome_prodotto`, `prezzo`, `link`, `note`, `stato`, `motivazione`, `created_at`, `update_at`, `stato_ordine`, `data_ordine`, `version`) VALUES
(10, 'L5B58', 20, 'Coffe', 'bicchiere', 250, 'www', 'bello e blu', 'RIFIUTATO', '', '2024-10-25 16:28:44', NULL, NULL, NULL, 1),
(11, 'PP49E', 20, 'ford', 'bicchiere assurdo', 300, 'www', '', 'RIFIUTATO', 'costa troppo', '2024-10-25 16:51:26', NULL, NULL, NULL, 1),
(12, 'TCCDN', 20, 'fiat', 'panda', 100, 'www', 'meno di que non si puo fa', 'CONTRASSEGNATO', NULL, '2024-10-25 16:52:12', NULL, 'ACCETTATO', '2024-10-25 16:54:31', 4),
(13, '1T708', 21, 'Fiat', 'Panda', 12000, 'www.fiat.it', 'ti puo piacere?', 'SPEDITO', NULL, '2024-10-25 18:37:40', NULL, 'IN_ATTESA', '2024-10-25 19:25:49', 2),
(14, '1IU3H', 22, 'BCINO', 'Cucina Moderna', 2300, 'www.cucina.cas', 'costa un po ma Ã¨ bellissima', 'RIFIUTATO', '', '2024-10-25 19:48:50', NULL, NULL, NULL, 1),
(15, 'AE17J', 24, 'Mac', 'm1', 9000, 'www.google.com', '', 'RIFIUTATO', 'costa troppo', '2024-10-27 18:55:15', NULL, NULL, NULL, 1),
(16, '1ZXWN', 24, 'mac', 'm2', 120, 'ssss', 'costa poco', 'CONTRASSEGNATO', NULL, '2024-10-27 18:56:24', NULL, 'RESPINTO_NONCONFORME', '2024-10-27 18:57:06', 3),
(17, 'SG8MJ', 37, 'Mac', 'm1', 12, 'www.google.com', 'notifica', 'RIFIUTATO', '', '2024-10-29 19:18:54', NULL, NULL, NULL, 1),
(18, 'TJXR3', 37, 'Mac', 'm2', 120, 'www.google.com', 'notifica2', 'CONTRASSEGNATO', NULL, '2024-10-29 20:30:59', NULL, 'RESPINTO_NONCONFORME', '2024-10-29 20:43:48', 3),
(19, 'EI5OS', 38, 'proporsta1', 'asd', 233, 'wwwww', 'asd', 'CONTRASSEGNATO', NULL, '2024-10-30 19:08:17', NULL, 'ACCETTATO', '2024-10-30 19:10:03', 3),
(20, 'T56U7', 22, 'asd', 'dsa', 222, 'aaaa', '', 'SPEDITO', NULL, '2024-10-30 22:33:42', NULL, 'IN_ATTESA', '2024-10-31 13:53:58', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta`
--

CREATE TABLE `richiesta` (
  `id` int(11) NOT NULL,
  `codice` varchar(5) DEFAULT NULL,
  `id_ordinante` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL COMMENT 'del nipote',
  `note` text DEFAULT NULL,
  `stato` enum('ASSEGNATO','IN_ATTESA','COMPLETATO','SPEDITO') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `richiesta`
--

INSERT INTO `richiesta` (`id`, `codice`, `id_ordinante`, `id_tecnico`, `id_categoria`, `note`, `stato`, `created_at`, `updated_at`, `version`) VALUES
(20, '7MRVB', 1, 2, 3, NULL, 'COMPLETATO', '2024-10-25 16:22:45', NULL, 4),
(21, 'RZOMG', 1, 2, 3, 'lo voglio nero', 'SPEDITO', '2024-10-25 18:33:02', NULL, 3),
(22, '50FMG', 1, 2, 7, 'deve essere moderna', 'SPEDITO', '2024-10-25 19:46:24', NULL, 3),
(23, 'QWA8G', 1, NULL, 7, 'non so ', 'IN_ATTESA', '2024-10-25 19:46:35', NULL, 1),
(24, '69OES', 1, 2, 3, 'deve costare poco', 'COMPLETATO', '2024-10-27 18:54:20', NULL, 4),
(37, '2ZRPI', 1, 2, 5, 'testNotifica', 'COMPLETATO', '2024-10-28 20:33:22', NULL, 4),
(38, '4ISRZ', 1, 2, 3, NULL, 'COMPLETATO', '2024-10-30 18:12:43', NULL, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta_caratteristica`
--

CREATE TABLE `richiesta_caratteristica` (
  `id` int(11) NOT NULL,
  `id_richiesta` int(11) DEFAULT NULL,
  `valore` text DEFAULT NULL,
  `id_caratteristica` int(11) DEFAULT NULL,
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `richiesta_caratteristica`
--

INSERT INTO `richiesta_caratteristica` (`id`, `id_richiesta`, `valore`, `id_caratteristica`, `version`) VALUES
(26, 20, 'serioooo', 2, 1),
(27, 20, 'indifferente', 1, 1),
(28, 21, 'Mac os', 2, 1),
(29, 21, 'indifferente', 1, 1),
(30, 22, '1', 5, 1),
(31, 22, 'indifferente', 4, 1),
(32, 23, 'indifferente', 5, 1),
(33, 23, 'indifferente', 4, 1),
(34, 24, 'indifferente', 2, 1),
(35, 24, 'indifferente', 1, 1),
(36, 25, 'indifferente', 2, 1),
(37, 25, 'indifferente', 1, 1),
(38, 26, 'indifferente', 2, 1),
(39, 26, 'indifferente', 1, 1),
(40, 27, 'indifferente', 2, 1),
(41, 27, 'indifferente', 1, 1),
(42, 28, 'indifferente', 2, 1),
(43, 28, 'indifferente', 1, 1),
(44, 29, 'indifferente', 5, 1),
(45, 29, 'indifferente', 4, 1),
(46, 30, 'indifferente', 5, 1),
(47, 30, 'indifferente', 4, 1),
(48, 31, 'indifferente', 5, 1),
(49, 31, 'indifferente', 4, 1),
(50, 32, 'indifferente', 5, 1),
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
(63, 38, 'indifferente', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cognome` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `ruolo` enum('AMMINISTRATORE','TECNICO','ORDINANTE','') DEFAULT NULL,
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id`, `nome`, `cognome`, `email`, `password`, `created_at`, `updated_at`, `ruolo`, `version`) VALUES
(1, 'GiovanniO', 'Rossi', 'generale@generale.com', 'c2d4bf72431b05244e53e7cd1a5a001e3bc77e7ffcc85cb9d70646a47b7716f8103883662873d972656bfb926ce58fb8', '2024-10-22 09:21:53', NULL, 'ORDINANTE', 1),
(2, 'GiovanniT', 'Rossi', 'generale@generale.com', 'c2d4bf72431b05244e53e7cd1a5a001e3bc77e7ffcc85cb9d70646a47b7716f8103883662873d972656bfb926ce58fb8', '2024-10-22 09:21:53', NULL, 'TECNICO', 1),
(3, 'GiovanniA', 'Rossi', 'generale@generale.com', 'c2d4bf72431b05244e53e7cd1a5a001e3bc77e7ffcc85cb9d70646a47b7716f8103883662873d972656bfb926ce58fb8', '2024-10-22 09:21:53', NULL, 'AMMINISTRATORE', 1),
(5, 'giam', 'come', 'colleorzo62@gmail.com', 'ab910453533540a7814834cb5d7096b8539a1cf522b6166ee36335aa19c231c5d6c41f8b4fae42c56e717a3c6e53a20f', '2024-10-17 15:18:07', NULL, 'ORDINANTE', 1),
(9, 'sasso', 'successo', 'gianmarco.ubaldi@outlook.it', '4e508b03b64f4c063222ad5c4e86e7c83ea238f7b7ea66d4fd40216c9a8741920b37725a6fd96e501b84132345506806', '2024-10-19 16:43:13', NULL, 'ORDINANTE', 3),
(10, 'giammu', 'orale', 'colleorzo22@gmail.com', '48a2798d47e1e8dd4aac29db1c7f72e73d291c2790a6bf72ecdc8be9a6026e2dd66d0c0e26c8b42d2dae5f127c807b60', '2024-10-21 14:12:51', NULL, 'AMMINISTRATORE', 2),
(14, 'Giovanni', 'Vamp', 'test@test.com', '65818afc52f0619ccda710e938c2e5f2700a53b039283fac674a6169323de928a4be3b46ec0dda19731c6ba8c153efc4', '2024-10-23 08:58:09', NULL, 'ORDINANTE', 1),
(15, 'mario', 'mario', 'mario@mario.com', '631bd0e144bfde1f1de0628efa5fc5490ea4ee645342ab98f3855c61744c7074b4527cc263158ccdcc60ae7373ec28b9', '2024-10-25 17:23:54', NULL, 'TECNICO', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `notifica`
--
ALTER TABLE `notifica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `proposta`
--
ALTER TABLE `proposta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT per la tabella `richiesta_caratteristica`
--
ALTER TABLE `richiesta_caratteristica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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

--
-- Limiti per la tabella `richiesta_caratteristica`
--
ALTER TABLE `richiesta_caratteristica`
  ADD CONSTRAINT `id_caratteristica` FOREIGN KEY (`id_caratteristica`) REFERENCES `caratteristica` (`id`),
  ADD CONSTRAINT `id_richiesta` FOREIGN KEY (`id_richiesta`) REFERENCES `richiesta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;