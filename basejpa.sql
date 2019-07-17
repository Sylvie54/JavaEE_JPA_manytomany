-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 13 mars 2019 à 17:19
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `basejpa`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `CLASSE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROF_ID` int(11) DEFAULT NULL,
  `CLASSE_NOM` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CLASSE_ID`),
  KEY `FK_RELATION_2` (`PROF_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`CLASSE_ID`, `PROF_ID`, `CLASSE_NOM`) VALUES
(1, 1, 'classe1'),
(2, 2, 'classe2'),
(3, 1, 'classe3'),
(4, 2, 'classe4');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `ELEVE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASSE_ID` int(11) DEFAULT NULL,
  `ELEVE_NOM` varchar(20) DEFAULT NULL,
  `ELEVE_PRENOM` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ELEVE_ID`),
  KEY `FK_RELATION_3` (`CLASSE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`ELEVE_ID`, `CLASSE_ID`, `ELEVE_NOM`, `ELEVE_PRENOM`) VALUES
(1, 1, 'elv1', 'prelv1'),
(2, 1, 'elv2', 'prelv2'),
(3, 1, 'elv3', 'prelv3'),
(4, 2, 'elv4', 'prelv4');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `MAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROF_ID` int(11) DEFAULT NULL,
  `MAT_NOM` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MAT_ID`),
  KEY `FK_RELATION_1` (`PROF_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`MAT_ID`, `PROF_ID`, `MAT_NOM`) VALUES
(1, 1, 'BDD'),
(2, 1, 'C#'),
(3, 1, 'java'),
(4, 2, 'PHP');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `PROF_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROF_NOM` varchar(20) DEFAULT NULL,
  `PROF_PRENOM` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PROF_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`PROF_ID`, `PROF_NOM`, `PROF_PRENOM`) VALUES
(1, 'bidochon', 'albert'),
(2, 'ducobu', 'raimonde'),
(3, 'dupond', 'joseph');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
