-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 02, 2024 alle 19:23
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
  `misura` varchar(30) DEFAULT NULL COMMENT 'unità di misura',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `caratteristica`
--

INSERT INTO `caratteristica` (`id`, `id_categoria`, `nome`, `misura`, `version`) VALUES
(7, 11, 'Ram', 'GB', 1),
(8, 11, 'CPU', 'Ghz', 1),
(9, 12, 'Schermo', 'pollici', 1),
(10, 16, 'Velocita di stampa', 'ppm', 1),
(11, 15, 'Risoluzione', 'dpi', 1),
(12, 17, 'Formati Supportati', 'file', 1),
(13, 20, 'Formato', 'A4,A3, ecc', 1),
(14, 21, 'Grammatura', 'g/m', 1),
(15, 22, 'Tipo di modulo', '.', 1),
(16, 23, 'Inchiostro', 'biro,gel,ecc', 2),
(17, 18, 'Altezza', 'cm', 1),
(18, 24, 'Materiale', 'legno, metallo ecc', 1),
(19, 25, 'bracioli', 'si/no', 1),
(20, 27, 'Materiale', 'pelle, ecc', 1),
(21, 26, 'Capacita', 'litri', 1);

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
(11, 'Informatica', NULL, 1, 5),
(12, 'Notebook', 14, 1, 2),
(13, 'Pc Desktop', 14, 0, 2),
(14, 'Computer', 11, 1, 1),
(15, 'Periferiche', 11, 1, 2),
(16, 'Stampanti', 15, NULL, 1),
(17, 'Scanner', 15, NULL, 1),
(18, 'Arredamento', NULL, 1, 4),
(19, 'Cancelleria', NULL, 1, 2),
(20, 'Carta e Modulistica', 19, 1, 2),
(21, 'Carta da Stampa', 20, NULL, 1),
(22, 'Moduli', 20, NULL, 1),
(23, 'Penne', 19, NULL, 1),
(24, 'Scrivanie', 18, NULL, 1),
(25, 'Sedie', 18, 1, 2),
(26, 'Armadi', 18, NULL, 1),
(27, 'Sedia Ergonomica', 25, NULL, 1),
(28, 'Sedia da conferenza', 25, NULL, 1);

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
(4, 'Admin', 'Rossi', 'admin@admin.it', '2c0ce65edefce822180168d29c8e4c274a7261d2582e0d95b780e14a12c92934622c9870e6dfb9bbe66493f34147814e', '2024-10-17 15:18:07', NULL, 'AMMINISTRATORE', 2),
(5, 'Tecnico', 'Bianchi', 'tecnico@tecnico.it', '19945e55f0086d2e3618f906222a187bf401650589b509da512301fdfb66a121c4de01d23281476a9deeb519c0cadd6f', '2024-10-19 16:43:13', NULL, 'TECNICO', 4),
(6, 'Ordinante', 'Mancini', 'ordinante@ordinante.it', 'de220e1fbd3cb837f7a1c2ded5876aefa0645a9eba593612955aa01e83a99854faed8ec42f82c4b20fae6aebb2eba0f8', '2024-10-21 14:12:51', NULL, 'ORDINANTE', 3);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `notifica`
--
ALTER TABLE `notifica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT per la tabella `proposta`
--
ALTER TABLE `proposta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT per la tabella `richiesta_caratteristica`
--
ALTER TABLE `richiesta_caratteristica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
