-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 03 mars 2019 à 17:47
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
-- Base de données :  `basedao`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `cls_id` int(11) NOT NULL AUTO_INCREMENT,
  `cls_nom` varchar(30) NOT NULL,
  PRIMARY KEY (`cls_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `elv_id` int(11) NOT NULL AUTO_INCREMENT,
  `elv_nom` varchar(30) NOT NULL,
  `elv_prenom` varchar(30) NOT NULL,
  `classe_id` int(11) NOT NULL,
  PRIMARY KEY (`elv_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`elv_id`, `elv_nom`, `elv_prenom`, `classe_id`) VALUES
(1, 'Durand', 'Helene', 1),
(2, 'Dupond', 'Joseph', 1),
(3, 'Durand', 'Helene', 2),
(4, 'Dupond', 'Joseph', 2);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `mat_id` int(11) NOT NULL AUTO_INCREMENT,
  `mat_nom` varchar(30) NOT NULL,
  PRIMARY KEY (`mat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`mat_id`, `mat_nom`) VALUES
(1, 'Info'),
(2, 'Math'),
(3, 'histoire'),
(4, 'geo');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `prof_id` int(11) NOT NULL AUTO_INCREMENT,
  `prof_nom` varchar(30) NOT NULL,
  `prof_prenom` varchar(30) NOT NULL,
  `class_id` int(11) NOT NULL,
  `mat_id` int(11) NOT NULL,
  PRIMARY KEY (`prof_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`prof_id`, `prof_nom`, `prof_prenom`, `class_id`, `mat_id`) VALUES
(1, 'bidochon', 'albert', 1, 1),
(2, 'klein', 'robert', 2, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
