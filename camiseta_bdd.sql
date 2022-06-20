-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db.3wa.io
-- Généré le : lun. 20 juin 2022 à 21:01
-- Version du serveur :  5.7.33-0ubuntu0.18.04.1-log
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `lucasallard_camiseta`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$OyeSLPQOyUSJ/MuGFXFMsORmjsIVDj/82Zi3uYVfqHC68zVmAAiti');

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `id_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `lastname_author` varchar(15) NOT NULL,
  `firstname_author` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `comment` varchar(300) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id_image` int(11) NOT NULL,
  `image_src` varchar(100) NOT NULL,
  `image_alt` varchar(100) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(16, 'img/products/n8.jpg', 'Chemise', 16),
(17, '5.jpg', 'ff', 21),
(18, 'img/products/HUBERT.jpg', 'sfhk', 22),
(19, 'img/products/HUBERT.jpg', 'sfhk', 23),
(20, 'img/products/HUBERT.jpg', 'sfhk', 24),
(21, 'img/products/', 'aaaaa', 25),
(22, 'img/products/', 'aaaaa', 26),
(23, 'img/products/', 'aaaaa', 27),
(24, 'img/products/', 'aaaaa', 28),
(25, 'Array', 'bjr', 0),
(26, 'Array', 'bjr', 0),
(27, 'Array', 'bjr', 0),
(28, 'Array', 'bjr', 0),
(29, 'Array', 'bjr', 0),
(30, 'Array', '123', 31),
(31, 'visiteurs.jpg', '123', 32),
(32, 'img/products/visiteurs.jpg', '123', 33),
(33, 'img/products/visiteurs.jpg', '123', 34),
(34, 'img/products/visiteurs.jpg', '123', 35);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `order_date` datetime NOT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `statut` varchar(50) NOT NULL DEFAULT 'attente validation commerçant',
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id_order`, `total_price`, `order_date`, `shipped_date`, `statut`, `id_user`) VALUES
(1, 0, '2022-05-10 14:02:15', '2022-05-12 17:32:15', 'Livré', 0),
(4, 0, '2022-05-14 10:39:15', '2022-05-16 14:02:15', 'Livré', 0),
(7, 0, '2022-05-23 14:04:09', '2022-05-26 12:02:14', 'En acheminement', 0),
(11, 0, '2022-05-26 14:04:09', '2022-05-30 14:04:09', 'En préparation', 0),
(12, 632.9, '2022-06-20 19:31:56', NULL, 'attente validation commerçant', 8),
(13, 632.9, '2022-06-20 19:35:58', NULL, 'attente validation commerçant', 8),
(14, 632.9, '2022-06-20 19:40:15', NULL, 'attente validation commerçant', 8),
(15, 632.9, '2022-06-20 19:40:22', NULL, 'attente validation commerçant', 8),
(16, 632.9, '2022-06-20 19:43:26', NULL, 'attente validation commerçant', 8),
(17, 632.9, '2022-06-20 19:43:48', NULL, 'attente validation commerçant', 8),
(18, 632.9, '2022-06-20 19:44:23', NULL, 'attente validation commerçant', 8),
(19, 632.9, '2022-06-20 19:45:27', NULL, 'attente validation commerçant', 8),
(20, 632.9, '2022-06-20 19:46:31', NULL, 'attente validation commerçant', 8),
(21, 632.9, '2022-06-20 19:48:50', NULL, 'attente validation commerçant', 8),
(22, 632.9, '2022-06-20 19:50:33', NULL, 'attente validation commerçant', 8),
(23, 98.9, '2022-06-20 20:00:20', NULL, 'attente validation commerçant', 8),
(24, 187.9, '2022-06-20 20:01:28', NULL, 'attente validation commerçant', 8);

-- --------------------------------------------------------

--
-- Structure de la table `orders_details`
--

CREATE TABLE `orders_details` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity_ordered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `orders_details`
--

INSERT INTO `orders_details` (`id_order`, `id_product`, `quantity_ordered`) VALUES
(0, 2, 4),
(21, 1, 3),
(24, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id_user` int(11) NOT NULL,
  `check_number` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(70) NOT NULL,
  `product_description` text NOT NULL,
  `product_alt` text NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `delivery_price` double DEFAULT '9.9'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id_product`, `product_name`, `product_description`, `product_alt`, `price`, `delivery_price`) VALUES
(1, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 89, 9.9),
(2, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 89, 9.9),
(3, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 89, 9.9),
(4, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 89, 9.9),
(5, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio\r\n', 89, 9.9),
(6, 'Surchemise en velours', 'La chemise gildan ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '80% velours, 20% coton', 99, 9.9),
(7, 'Pantacourt en lin', 'Le pantacourt gildan ultra coton est fabriquée à partir de lin et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '80% lin, 20% coton', 89, 9.9),
(8, 'Tunique motif chat', 'La tunique ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 89, 9.9),
(9, 'Chemise à col mao', 'La chemise ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 89, 9.9),
(10, 'Chemise à rayure', 'La chemise ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes..', '100% coton', 99, 9.9),
(11, 'Chemise à col mao', 'La chemise ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 89, 9.9),
(12, 'Chemise à manche courte - urban', 'La chemise ultra coton est fabriquée à partir de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 89, 9.9),
(13, 'Chemise en jean', 'La chemise ultra coton est fabriquée à partir de denim. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% denim', 69, 9.9),
(14, 'Short à rayure ', 'Le short ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 89, 9.9),
(15, 'Chemise à poche ', 'La chemise ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 89, 9.9),
(16, 'Chemise manche courte à col mao', 'La chemise ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 89, 9.9),
(17, 'a', 'a', 'a', 0, 9.9),
(18, 'aaa', 'aaa', 'aaa', 12, 9.9),
(19, 'ff', 'cc', 'ff', 12, 9.9),
(20, 'ff', 'ff', 'ff', 12, 9.9),
(21, 'ff', 'ff', 'ff', 12, 9.9),
(22, 'aaaccccc', 'aaaaddddd', 'sqdqsd', 1, 9.9),
(23, 'aaaccccc', 'aaaaddddd', 'sqdqsd', 1, 9.9),
(24, 'aaaccccc', 'aaaaddddd', 'sqdqsd', 1, 9.9),
(25, 'Produit test', 'test', 'test', 12, 9.9),
(26, 'Produit test', 'test', 'test', 12, 9.9),
(27, 'Produit test', 'test', 'test', 12, 9.9),
(28, 'Produit test', 'test', 'test', 12, 9.9),
(29, 'Produit test', 'test', 'test', 12, 9.9),
(30, 'Produit test2', 'qsd', 'qsdd', 12, 9.9),
(31, '123', '123', '123', 123, 9.9),
(32, '123', '123', '123', 123, 9.9),
(33, '123', '123', '123', 123, 9.9),
(34, '123', '123', '123', 123, 9.9),
(35, '123', '123', '123', 123, 9.9);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `city` varchar(20) NOT NULL,
  `birth` date NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `username`, `lastname`, `name`, `phone`, `email`, `address`, `zip_code`, `city`, `birth`, `password`) VALUES
(8, 'user1', 'allard', 'lucas', '0633652764', 'allard.lucas.97@gmail.com', '5 rue isidore louveau', '35700', 'Rennes', '2022-06-22', '$2y$10$VASo1VIq7reWNXPCD1OdfeyPKSIzFP/Q3CXhUSpA9Bw1bmsctLSyS');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_author` (`id_author`);

--
-- Index pour la table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `id_product` (`id_product`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id_order`,`id_product`),
  ADD UNIQUE KEY `id_product` (`id_product`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id_user`,`check_number`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
