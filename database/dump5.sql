-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Ott 25, 2024 alle 21:50
-- Versione del server: 10.4.20-MariaDB
-- Versione PHP: 8.0.8

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `proposta`
--

INSERT INTO `proposta` (`id`, `codice_proposta`, `id_richiesta`, `nome_produttore`, `nome_prodotto`, `prezzo`, `link`, `note`, `stato`, `motivazione`, `created_at`, `update_at`, `stato_ordine`, `data_ordine`, `version`) VALUES
(10, 'L5B58', 20, 'Coffe', 'bicchiere', 250, 'www', 'bello e blu', 'RIFIUTATO', '', '2024-10-25 16:28:44', NULL, NULL, NULL, 1),
(11, 'PP49E', 20, 'ford', 'bicchiere assurdo', 300, 'www', '', 'RIFIUTATO', 'costa troppo', '2024-10-25 16:51:26', NULL, NULL, NULL, 1),
(12, 'TCCDN', 20, 'fiat', 'panda', 100, 'www', 'meno di que non si puo fa', 'CONTRASSEGNATO', NULL, '2024-10-25 16:52:12', NULL, 'ACCETTATO', '2024-10-25 16:54:31', 4),
(13, '1T708', 21, 'Fiat', 'Panda', 12000, 'www.fiat.it', 'ti puo piacere?', 'SPEDITO', NULL, '2024-10-25 18:37:40', NULL, 'IN_ATTESA', '2024-10-25 19:25:49', 2),
(14, '1IU3H', 22, 'BCINO', 'Cucina Moderna', 2300, 'www.cucina.cas', 'costa un po ma Ã¨ bellissima', 'IN_SOSPESO', NULL, '2024-10-25 19:48:50', NULL, NULL, NULL, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `richiesta`
--

INSERT INTO `richiesta` (`id`, `codice`, `id_ordinante`, `id_tecnico`, `id_categoria`, `note`, `stato`, `created_at`, `updated_at`, `version`) VALUES
(20, '7MRVB', 1, 2, 3, NULL, 'COMPLETATO', '2024-10-25 16:22:45', NULL, 4),
(21, 'RZOMG', 1, 2, 3, 'lo voglio nero', 'SPEDITO', '2024-10-25 18:33:02', NULL, 3),
(22, '50FMG', 1, 2, 7, 'deve essere moderna', 'ASSEGNATO', '2024-10-25 19:46:24', NULL, 2),
(23, 'QWA8G', 1, NULL, 7, 'non so ', 'IN_ATTESA', '2024-10-25 19:46:35', NULL, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(33, 23, 'indifferente', 4, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- AUTO_INCREMENT per la tabella `proposta`
--
ALTER TABLE `proposta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT per la tabella `richiesta_caratteristica`
--
ALTER TABLE `richiesta_caratteristica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
