-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 11 juin 2022 à 16:45
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `camiseta`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `id_author` int(11) NOT NULL,
  PRIMARY KEY (`id_article`),
  KEY `id_author` (`id_author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id_author` int(11) NOT NULL AUTO_INCREMENT,
  `lastname_author` varchar(15) NOT NULL,
  `firstname_author` varchar(15) NOT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `customer_lastname` varchar(20) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `customer_mail` varchar(30) NOT NULL,
  `customer_phone` varchar(10) NOT NULL,
  `customer_adress` varchar(50) NOT NULL,
  `customer_city` varchar(50) NOT NULL,
  `customer_zip` int(11) NOT NULL,
  `customer_country` varchar(50) NOT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id_customer`, `customer_lastname`, `customer_name`, `customer_mail`, `customer_phone`, `customer_adress`, `customer_city`, `customer_zip`, `customer_country`) VALUES
(1, 'Duval', 'Pierre', 'pierre.duval@gmail.com', '0639234938', '5 rue isidore louveau', 'Rennes', 35700, 'France'),
(2, 'Doe', 'John', 'john.doe@gmail.com', '0648372839', '18 boulevard de la liberté', 'Paris', 75001, 'France'),
(3, 'Dupont', 'Marc', 'marc.dupont@gmail.com', '0736472947', '8 avenue monfort', 'Vannes', 56000, 'France'),
(4, 'Lafleur', 'Seven', 'seven.lafleur@gmail.com', '068492092', '8 rue du pré', 'Ile-aux-moines', 56780, 'France');

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `image_src` varchar(100) NOT NULL,
  `image_alt` varchar(100) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id_image`),
  KEY `id_product` (`id_product`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id_image`, `image_src`, `image_alt`, `id_product`) VALUES
(1, 'img/products/f1.jpg', 'Chemise', 1),
(2, 'img/products/f2.jpg', 'Chemise', 2),
(3, 'img/products/f3.jpg', 'Chemise', 3),
(4, 'img/products/f4.jpg', 'Chemise', 4),
(5, 'img/products/f5.jpg', 'Chemise', 5),
(6, 'img/products/f6.jpg', 'Pantacourt', 6),
(7, 'img/products/f7.jpg', 'Tunique', 7),
(8, 'img/products/f8.jpg', 'Chemise', 8),
(9, 'img/products/n1.jpg', 'Chemise', 9),
(10, 'img/products/n2.jpg', 'Chemise', 10),
(11, 'img/products/n3.jpg', 'Chemise', 11),
(12, 'img/products/n4.jpg', 'Chemise', 12),
(13, 'img/products/n5.jpg', 'Chemise', 13),
(14, 'img/products/n6.jpg', 'Short', 14),
(15, 'img/products/n7.jpg', 'Chemise', 15),
(16, 'img/products/n8.jpg', 'Chemise', 16);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `shipped_date` datetime NOT NULL,
  `statut` varchar(15) NOT NULL,
  `id_customer` int(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_customer` (`id_customer`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id_order`, `order_date`, `shipped_date`, `statut`, `id_customer`) VALUES
(1, '2022-05-10 14:02:15', '2022-05-12 17:32:15', 'Livré', 1),
(4, '2022-05-14 10:39:15', '2022-05-16 14:02:15', 'Livré', 2),
(7, '2022-05-23 14:04:09', '2022-05-26 12:02:14', 'En acheminement', 1),
(11, '2022-05-26 14:04:09', '2022-05-30 14:04:09', 'En préparation', 3);

-- --------------------------------------------------------

--
-- Structure de la table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE IF NOT EXISTS `orders_details` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity_ordered` int(11) NOT NULL,
  `price_each` double NOT NULL,
  PRIMARY KEY (`id_product`),
  UNIQUE KEY `id_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id_customer` int(11) NOT NULL,
  `check_number` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id_customer`,`check_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `productlines`
--

DROP TABLE IF EXISTS `productlines`;
CREATE TABLE IF NOT EXISTS `productlines` (
  `product_line` varchar(50) NOT NULL,
  `text_description` text,
  `html_description` mediumtext,
  `image` mediumblob,
  PRIMARY KEY (`product_line`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(70) NOT NULL,
  `product_description` text NOT NULL,
  `product_alt` text NOT NULL,
  `quantity_stock` smallint(6) NOT NULL,
  `buy_price` double NOT NULL,
  `MSRP` double NOT NULL,
  `TVA` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id_product`, `product_name`, `product_description`, `product_alt`, `quantity_stock`, `buy_price`, `MSRP`, `TVA`) VALUES
(1, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 100, 30, 89, '0'),
(2, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 80, 30, 89, '0'),
(3, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 100, 30, 89, '0'),
(4, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 100, 30, 89, '0'),
(5, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 100, 30, 89, '0'),
(6, 'Surchemise en velours', 'La chemise gildan ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '80% velours, 20% coton', 50, 50, 99, '0'),
(7, 'Pantacourt en lin', 'Le pantacourt gildan ultra coton est fabriquée à partir de lin et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '80% lin, 20% coton', 60, 40, 89, '0'),
(8, 'Tunique motif chat', 'La tunique ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 70, 30, 89, '0'),
(9, 'Chemise à col mao', 'La chemise ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 100, 30, 89, '0'),
(10, 'Chemise à rayure', 'La chemise ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes..', '100% coton', 60, 40, 99, '0'),
(11, 'Chemise à col mao', 'La chemise ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 70, 30, 89, '0'),
(12, 'Chemise à manche courte - urban', 'La chemise ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 50, 30, 89, '0'),
(13, 'Chemise en jean', 'La chemise ultra coton est fabriquée à partir de denim. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% denim', 60, 20, 69, '0'),
(14, 'Short à rayure ', 'Le short ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 100, 30, 89, '0'),
(15, 'Chemise à poche ', 'La chemise ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 100, 30, 89, '0'),
(16, 'Chemise manche courte à col mao', 'La chemise ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 100, 30, 89, '0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
