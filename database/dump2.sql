-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Ott 17, 2024 alle 10:33
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

-- --------------------------------------------------------

--
-- Struttura della tabella `proposta`
--

CREATE TABLE `proposta` (
  `codice_prodotto` varchar(5) NOT NULL,
  `codice_richiesta` varchar(5) DEFAULT NULL,
  `nome_produttore` varchar(20) DEFAULT NULL,
  `nome_prodotto` varchar(20) DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `link` text,
  `note` varchar(30) DEFAULT NULL,
  `stato` enum('ACCETTATO','RIFIUTATO','IN_SOSPESO','SPEDITO') DEFAULT NULL,
  `motivazione` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `stato_ordine` enum('ACCETTATO','RESPINTO_NONCONFORME','RESPINTO_NONFUNZIONANTE','IN_ATTESA') DEFAULT NULL COMMENT 'gestione del rifiuto dell''ordine spedito',
  `data_ordine` timestamp NULL DEFAULT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta`
--

CREATE TABLE `richiesta` (
  `codice` varchar(5) NOT NULL,
  `id_ordinante` int DEFAULT NULL,
  `id_tecnico` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL COMMENT 'del nipote',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `stato` enum('ASSEGNATO','IN_ATTESA','COMPLETATO','SPEDITO') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta_caretteristica`
--

CREATE TABLE `richiesta_caretteristica` (
  `id` int NOT NULL,
  `codice_richiesta` varchar(5) DEFAULT NULL,
  `valore` text,
  `id_caratteristica` int DEFAULT NULL,
  `version` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  ADD PRIMARY KEY (`codice_prodotto`),
  ADD KEY `codice_richiesta` (`codice_richiesta`);

--
-- Indici per le tabelle `richiesta`
--
ALTER TABLE `richiesta`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_ordinante` (`id_ordinante`);

--
-- Indici per le tabelle `richiesta_caretteristica`
--
ALTER TABLE `richiesta_caretteristica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_caratteristica` (`id_caratteristica`),
  ADD KEY `vicolo_richiesta` (`codice_richiesta`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `richiesta_caretteristica`
--
ALTER TABLE `richiesta_caretteristica`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `caratteristica`
--
ALTER TABLE `caratteristica`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `id_padre` FOREIGN KEY (`id_padre`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `proposta`
--
ALTER TABLE `proposta`
  ADD CONSTRAINT `codice_richiesta` FOREIGN KEY (`codice_richiesta`) REFERENCES `richiesta` (`codice`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_ordinante` FOREIGN KEY (`id_ordinante`) REFERENCES `utente` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `utente` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `richiesta_caretteristica`
--
ALTER TABLE `richiesta_caretteristica`
  ADD CONSTRAINT `id_caratteristica` FOREIGN KEY (`id_caratteristica`) REFERENCES `caratteristica` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `vicolo_richiesta` FOREIGN KEY (`codice_richiesta`) REFERENCES `richiesta` (`codice`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
