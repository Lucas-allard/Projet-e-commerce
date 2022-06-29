-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db.3wa.io
-- Généré le : mer. 29 juin 2022 à 09:20
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
  `date_create` date NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id_article`, `title`, `date_create`, `content`) VALUES
(5, 'Ambage nulla praegressa inconsiderate et leviter', '2022-06-24', 'Nullam probo, unam, ut eodem modo erga amicum adfecti simus, quo erga nosmet ipsos, alteram, ut nostra in amicos benevolentia illorum erga nos benevolentiae pariter aequaliterque respondeat, tertiam, ut, quanti quisque se ipse facit, tanti fiat ab amicis. eodem tempore etiam hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum africam pro consule regeret carthaginiensibus victus inopia iam.\r\n\r\nNon certaverit alia advecticiis ita adfluere copiis et internis, et laodicia et apamia itidemque seleucia iam inde a primis auspiciis florentissimae. quae dum ita struuntur, indicatum est apud tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.\r\nIpsos, alteram, ut nostra in amicos benevolentia illorum erga nos benevolentiae pariter aequaliterque respondeat, tertiam, ut, quanti quisque se ipse facit, tanti fiat ab amicis. eodem tempore etiam hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum africam pro consule regeret carthaginiensibus victus inopia iam lassatis, ex horreis romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora. quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura. quod quidem quale sit, etiam in bestiis quibusdam animadverti potest, quae ex se natos ita amant ad quoddam tempus et ab eis ita amantur ut facile earum sensus appareat. quod in homine multo est evidentius, primum ex ea caritate quae est inter natos et parentes, quae.\r\n\r\nMentionem, si nulla res impediat, nemo est, quin eo, quo consuevit, libentius utatur quam intractato et novo. nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus. tu autem, fanni, quod mihi tantum tribui dicis quantum ego nec adgnosco nec postulo, facis amice; sed, ut mihi videris, non recte iudicas de catone; aut enim nemo, quod quidem magis credo, aut si quisquam, ille sapiens fuit. quo modo, ut alia omittam, mortem filii tulit! memineram paulum, videram galum, sed hi in pueris, cato in perfecto et spectato viro. per hoc minui studium suum existimans paulus, ut erat in conplicandis negotiis artifex dirus, unde ei catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo.\r\nQuo percitus ille exitio urgente abrupto ferro eundem adoritur paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum. hinc ille commotus ut iniusta perferens et indigna praefecti custodiam protectoribus mandaverat fidis. quo conperto montius tunc quaestor acer quidem sed ad lenitatem propensior, consulens in commune advocatos palatinarum primos scholarum adlocutus est mollius docens nec decere haec fieri nec prodesse addensque vocis obiurgatorio sonu quod si id placeret, post statuas constantii deiectas super adimenda vita praefecto conveniet securius cogitari. constituendi autem sunt qui sint in amicitia fines et quasi termini diligendi. de quibus tres video sententias ferri, quarum nullam probo, unam, ut eodem.\r\n'),
(6, 'Iis etiam quae sunt inanima, consuetudo valet', '2022-06-24', 'Unde ei catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum. hinc ille commotus ut iniusta perferens et indigna praefecti custodiam protectoribus.\r\n\r\nQuibusdam animadverti potest, quae ex se natos ita amant ad quoddam tempus et ab eis ita amantur ut facile earum sensus appareat. quod in homine multo est evidentius, primum ex ea caritate quae est inter natos et parentes, quae dirimi nisi detestabili scelere non potest; deinde cum similis sensus exstitit amoris, si aliquem nacti sumus cuius cum moribus et natura congruamus, quod in eo quasi lumen aliquod probitatis et virtutis perspicere videamur. quam ob rem vita quidem talis fuit vel fortuna vel gloria, ut nihil posset accedere, moriendi autem sensum celeritas abstulit; quo de genere mortis difficile dictu est; quid homines suspicentur, videtis; hoc vere tamen licet dicere, p. scipioni ex multis diebus, quos in vita celeberrimos laetissimosque.'),
(7, 'Quae dum ita struuntur, indicatum est', '2022-06-24', 'Conservanda; maxima est enim vis vetustatis et consuetudinis. quin in ipso equo, cuius modo feci mentionem, si nulla res impediat, nemo est, quin eo, quo consuevit, libentius utatur quam intractato et novo. nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus. tu autem, fanni, quod mihi tantum tribui dicis quantum ego nec adgnosco nec postulo, facis amice; sed, ut mihi videris, non recte iudicas de catone; aut enim nemo, quod quidem magis credo, aut si quisquam, ille sapiens fuit. quo modo, ut alia omittam, mortem filii tulit! memineram paulum, videram galum, sed hi in pueris, cato in perfecto et spectato viro. per hoc minui studium suum existimans paulus, ut erat in conplicandis negotiis artifex dirus, unde ei catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis.\r\n\r\nQuos in vita celeberrimos laetissimosque viderit, illum diem clarissimum fuisse, cum senatu dimisso domum reductus ad vesperum est a patribus conscriptis, populo romano, sociis et latinis, pridie quam excessit e vita, ut ex tam alto dignitatis gradu ad superos videatur deos.\r\nConscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.\r\n\r\nCasus levare multorum. hinc ille commotus ut iniusta perferens et indigna praefecti custodiam protectoribus mandaverat fidis. quo conperto montius tunc quaestor acer quidem sed ad lenitatem propensior, consulens in commune advocatos palatinarum primos scholarum adlocutus est mollius docens nec decere haec fieri nec prodesse addensque vocis obiurgatorio sonu quod si id placeret, post statuas constantii deiectas super adimenda vita.\r\nHoc minui studium suum existimans paulus, ut erat in conplicandis negotiis artifex dirus, unde ei catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita.\r\n\r\nEt quasi termini diligendi. de quibus tres video sententias ferri, quarum nullam probo, unam, ut eodem modo erga amicum adfecti simus, quo erga nosmet ipsos, alteram, ut nostra in amicos benevolentia illorum erga nos benevolentiae pariter aequaliterque respondeat, tertiam, ut, quanti.\r\nVel cuius usibus apparatum. ideoque rector provinciae tunc pater apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.\r\nMentionem, si nulla res impediat, nemo est, quin eo, quo consuevit, libentius utatur quam intractato et novo. nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in.\r\n\r\nLibentius utatur quam intractato et novo. nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus. tu autem, fanni, quod mihi tantum tribui dicis quantum ego nec adgnosco nec postulo, facis amice; sed, ut mihi videris, non recte iudicas de catone; aut enim nemo, quod quidem magis credo, aut si quisquam, ille sapiens fuit. quo modo, ut alia omittam, mortem filii tulit! memineram paulum, videram galum, sed hi in pueris, cato in perfecto et spectato viro. per hoc minui studium suum existimans paulus, ut erat in conplicandis negotiis artifex dirus, unde ei catenae inditum est cognomentum.\r\nNec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus. tu autem, fanni, quod mihi tantum tribui dicis quantum ego nec adgnosco nec postulo, facis amice; sed, ut mihi videris, non recte iudicas de catone; aut enim nemo, quod quidem magis credo, aut si quisquam, ille sapiens fuit. quo modo, ut alia omittam, mortem filii tulit! memineram paulum, videram galum, sed hi in pueris, cato in perfecto et spectato viro. per hoc minui studium suum existimans paulus, ut erat in conplicandis negotiis artifex dirus, unde ei catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum.\r\n\r\nMora. quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura. quod quidem quale sit, etiam in bestiis quibusdam animadverti potest, quae ex se natos ita amant ad quoddam tempus et ab eis ita amantur ut facile earum sensus appareat. quod in homine multo est evidentius, primum ex ea caritate quae est inter natos et parentes, quae dirimi nisi detestabili scelere non.\r\nGenere mortis difficile dictu est; quid homines suspicentur, videtis; hoc vere tamen licet dicere, p. scipioni ex multis diebus, quos in vita celeberrimos laetissimosque viderit, illum diem clarissimum fuisse, cum senatu dimisso domum reductus ad vesperum est a patribus conscriptis, populo romano, sociis et latinis, pridie quam excessit e vita, ut ex tam alto dignitatis gradu ad superos videatur deos potius quam ad inferos pervenisse. rogatus ad ultimum admissusque in consistorium ambage nulla praegressa inconsiderate et leviter proficiscere inquit ut praeceptum est, caesar sciens quod si cessaveris, et tuas et palatii tui auferri iubebo prope diem annonas. hocque solo contumaciter dicto subiratus abscessit nec in conspectum eius postea venit saepius arcessitus. dein syria.\r\n\r\nFieri nec prodesse addensque vocis obiurgatorio sonu quod si id placeret, post statuas constantii deiectas super adimenda vita praefecto conveniet securius cogitari. constituendi autem sunt qui sint in amicitia fines et quasi termini diligendi. de quibus tres video sententias ferri, quarum nullam probo, unam, ut eodem modo erga amicum adfecti simus, quo erga nosmet ipsos, alteram, ut nostra in amicos benevolentia illorum erga nos benevolentiae pariter aequaliterque respondeat, tertiam, ut, quanti quisque se ipse facit, tanti fiat ab amicis. eodem tempore etiam hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum africam pro consule regeret carthaginiensibus victus inopia iam lassatis, ex horreis romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora. quapropter.\r\n\r\nA primis auspiciis florentissimae. quae dum ita struuntur, indicatum est apud tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.\r\nEt latinis, pridie quam excessit e vita, ut ex tam alto dignitatis gradu ad superos videatur deos potius quam ad inferos pervenisse. rogatus ad ultimum admissusque in consistorium ambage nulla praegressa inconsiderate et leviter proficiscere inquit ut praeceptum est, caesar sciens quod si cessaveris, et tuas et palatii tui auferri iubebo prope diem annonas. hocque solo contumaciter dicto subiratus abscessit nec in conspectum eius postea venit saepius arcessitus. dein syria per speciosam interpatet diffusa planitiem. hanc nobilitat antiochia, mundo cognita civitas, cui non certaverit alia advecticiis ita adfluere copiis et internis, et laodicia et apamia itidemque seleucia iam inde a primis auspiciis florentissimae. quae dum ita struuntur, indicatum est apud tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater apollinaris eiusdem nominis ut conscius ductus est aliique congregati.\r\n\r\nPlanitiem. hanc nobilitat antiochia, mundo cognita civitas, cui non certaverit alia advecticiis ita adfluere copiis et internis, et laodicia et apamia itidemque seleucia iam inde a primis auspiciis florentissimae. quae dum ita struuntur, indicatum est apud tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.'),
(8, 'Cum provenisset segetum copia', '2022-06-24', 'Celeberrimos laetissimosque viderit, illum diem clarissimum fuisse, cum senatu dimisso domum reductus ad vesperum est a patribus conscriptis, populo romano, sociis et latinis, pridie quam excessit e vita, ut ex tam alto dignitatis gradu ad superos videatur deos potius quam ad inferos pervenisse. rogatus ad ultimum admissusque in consistorium ambage nulla praegressa inconsiderate et leviter proficiscere inquit ut praeceptum est, caesar sciens quod si cessaveris, et tuas et palatii tui auferri iubebo prope diem annonas. hocque solo contumaciter dicto subiratus abscessit nec in conspectum eius postea venit saepius arcessitus. dein syria per speciosam interpatet diffusa planitiem. hanc nobilitat antiochia, mundo cognita civitas, cui non certaverit alia advecticiis ita adfluere copiis et internis, et laodicia et apamia itidemque seleucia iam inde a primis auspiciis florentissimae. quae dum ita struuntur, indicatum est apud tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium. \r\n\r\nGenere mortis difficile dictu est; quid homines suspicentur, videtis; hoc vere tamen licet dicere, p. scipioni ex multis diebus, quos in vita celeberrimos laetissimosque viderit, illum diem clarissimum fuisse, cum senatu dimisso domum reductus ad vesperum est a patribus conscriptis, populo romano, sociis et latinis, pridie quam excessit e.'),
(9, 'Languente dextera, letaliter ferire', '2022-06-24', 'Iniusta perferens et indigna praefecti custodiam protectoribus mandaverat fidis. quo conperto montius tunc quaestor acer quidem sed ad lenitatem propensior, consulens in commune advocatos palatinarum primos scholarum adlocutus est mollius docens nec decere haec fieri nec prodesse addensque vocis obiurgatorio sonu quod si id placeret, post statuas constantii deiectas super adimenda vita praefecto conveniet securius cogitari. constituendi autem sunt qui sint in amicitia fines et quasi termini diligendi. de quibus tres video sententias ferri, quarum nullam probo, unam, ut eodem modo erga amicum adfecti simus, quo erga nosmet ipsos, alteram, ut nostra in amicos benevolentia illorum erga nos benevolentiae pariter aequaliterque respondeat, tertiam, ut, quanti quisque se ipse facit, tanti fiat ab amicis. eodem tempore etiam hymetii praeclarae indolis.\r\n\r\nLumen aliquod probitatis et. Gloria, ut nihil posset accedere.Inopia iam lassatis, ex horreis romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora. quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura. quod quidem quale sit, etiam in bestiis quibusdam animadverti potest, quae ex se natos ita amant ad quoddam tempus et ab eis ita amantur ut facile earum sensus appareat. quod in homine multo est evidentius, primum ex ea caritate quae est inter natos et.\r\n\r\n'),
(10, 'Et tuas et palatii tui auferri iubebo prope', '2022-06-24', 'Sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus. tu autem, fanni, quod mihi tantum tribui dicis quantum ego nec adgnosco nec postulo, facis amice; sed, ut mihi videris, non recte iudicas de catone; aut enim nemo, quod quidem magis credo, aut si quisquam, ille sapiens fuit. quo modo, ut alia omittam, mortem filii tulit! memineram paulum, videram galum, sed hi in pueris, cato in perfecto et spectato viro. per hoc minui studium suum existimans paulus, ut erat in conplicandis negotiis artifex dirus, unde ei catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem.\r\n\r\nEx diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.\r\nAbstulit; quo de genere mortis difficile dictu est; quid homines suspicentur, videtis; hoc vere tamen licet dicere, p. scipioni ex multis diebus, quos in vita celeberrimos laetissimosque viderit, illum diem clarissimum fuisse, cum senatu dimisso domum reductus ad vesperum est a patribus conscriptis, populo romano, sociis et latinis, pridie quam excessit e vita, ut ex tam alto dignitatis gradu ad superos videatur deos potius quam ad inferos pervenisse. rogatus ad ultimum admissusque in consistorium ambage nulla praegressa inconsiderate et leviter proficiscere inquit ut praeceptum est, caesar sciens quod si cessaveris, et tuas et palatii tui auferri iubebo prope diem annonas. hocque solo contumaciter dicto subiratus abscessit nec in conspectum eius postea venit saepius arcessitus. dein syria per speciosam interpatet diffusa planitiem. hanc nobilitat antiochia, mundo cognita civitas, cui non certaverit alia advecticiis ita adfluere copiis et internis, et laodicia et apamia itidemque seleucia iam inde a primis auspiciis florentissimae. quae dum ita struuntur, indicatum est apud tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater apollinaris eiusdem nominis ut conscius ductus.'),
(11, 'Solo contumaciter dicto subiratus abscessit nec', '2022-06-24', 'Ut tamquam in herbis non fallacibus fructus appareat, non sunt illae quidem repudiandae, vetustas tamen suo loco conservanda; maxima est enim vis vetustatis et consuetudinis. quin in ipso equo, cuius modo feci mentionem, si nulla res impediat, nemo est, quin eo, quo consuevit, libentius utatur quam intractato et novo. nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus. tu autem, fanni, quod mihi tantum tribui dicis quantum ego nec adgnosco nec postulo, facis amice; sed, ut mihi videris, non recte iudicas de catone; aut enim nemo, quod quidem magis credo, aut si quisquam, ille sapiens fuit. quo modo, ut alia omittam, mortem.\r\n\r\nNatos et parentes, quae dirimi nisi detestabili scelere non potest; deinde cum similis sensus exstitit amoris, si aliquem nacti sumus cuius cum moribus et natura congruamus, quod in eo quasi lumen aliquod probitatis et virtutis perspicere videamur. quam ob rem vita quidem talis fuit vel fortuna vel gloria, ut nihil posset accedere, moriendi autem sensum celeritas abstulit; quo de genere mortis difficile dictu est; quid homines suspicentur, videtis; hoc vere tamen licet dicere, p. scipioni ex multis diebus, quos in vita celeberrimos laetissimosque viderit, illum diem clarissimum fuisse, cum senatu dimisso domum reductus ad vesperum est a patribus conscriptis, populo romano, sociis et latinis, pridie quam excessit e vita, ut ex tam alto dignitatis gradu ad superos videatur deos potius quam ad inferos pervenisse. rogatus ad ultimum admissusque in consistorium ambage nulla praegressa inconsiderate et leviter proficiscere inquit ut praeceptum est, caesar sciens quod si cessaveris, et tuas et palatii tui auferri iubebo prope diem annonas. hocque solo contumaciter dicto subiratus abscessit nec in conspectum eius postea venit saepius arcessitus. dein syria per speciosam interpatet diffusa planitiem. hanc nobilitat antiochia, mundo cognita civitas, cui non certaverit alia advecticiis ita adfluere copiis et internis.');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_create` date NOT NULL,
  `content` varchar(300) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id_comment`, `last_name`, `name`, `date_create`, `content`, `id_article`) VALUES
(2, 'Romano', 'Generedetis.', '2022-06-27', 'Nulla res impediat, nemo est, quin eo, quo consuevit, libentius utatur quam intractato et novo. nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus.', 5),
(3, 'Alteram', 'Senatu', '2022-06-27', 'Nos benevolentiae pariter aequaliterque respondeat, tertiam, ut, quanti quisque se ipse facit, tanti fiat ab amicis. eodem tempore etiam hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum africam pro consule regeret carthagini.', 5),
(4, 'Licet', 'Dicere', '2022-06-27', 'Homine multo est evidentius, primum.', 5),
(5, 'Conperto', 'Ipsum', '2022-06-27', 'Tamquam in herbis non fallacibus fructus appareat, non.', 5),
(6, 'Alteram', 'Ipsum', '2022-06-27', 'Instabat ut eum quoque cum tribunis et aliis pluribus.', 7),
(7, 'Conperto', 'conscius', '2022-06-27', 'Et virtutis perspicere videamur. quam ob rem.', 7),
(8, 'Licet', 'Ipsum', '2022-06-27', 'Senatu dimisso domum reductus ad vesperum est a patribus conscriptis, populo romano, sociis et latinis, pridie quam excessit e vita, ut ex tam alto dignitatis gradu ad superos videatur deos potius quam ad inferos pervenisse. rogatus ad ultimum admissusque in consistorium ambage.', 7);

-- --------------------------------------------------------

--
-- Structure de la table `dislikes`
--

CREATE TABLE `dislikes` (
  `id_dislike` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dislikes`
--

INSERT INTO `dislikes` (`id_dislike`, `id_article`) VALUES
(1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id_image` int(11) NOT NULL,
  `image_src` varchar(100) NOT NULL,
  `image_alt` varchar(100) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_article` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id_image`, `image_src`, `image_alt`, `id_product`, `id_article`) VALUES
(139, 'img/products/f1.jpg', 'product image 1', 1, NULL),
(140, 'img/products/f2.jpg', 'product image 2', 2, NULL),
(141, 'img/products/f3.jpg', 'product image 3', 3, NULL),
(142, 'img/products/f4.jpg', 'product image 4', 4, NULL),
(143, 'img/products/f5.jpg', 'product image 5', 5, NULL),
(144, 'img/products/f6.jpg', 'product image 6', 6, NULL),
(145, 'img/products/f7.jpg', 'product image 7', 7, NULL),
(146, 'img/products/f8.jpg', 'product image 8', 8, NULL),
(147, 'img/products/n1.jpg', 'product image 9', 9, NULL),
(148, 'img/products/n2.jpg', 'product image 10', 10, NULL),
(149, 'img/products/n3.jpg', 'product image 11', 11, NULL),
(150, 'img/products/n4.jpg', 'product image 12', 12, NULL),
(151, 'img/products/n5.jpg', 'product image 13', 13, NULL),
(152, 'img/products/n6.jpg', 'product image 14', 14, NULL),
(153, 'img/products/n7.jpg', 'product image 15', 15, NULL),
(154, 'img/products/n8.jpg', 'product image 16', 16, NULL),
(155, 'img/blog/b1.jpg', 'blog image 1', NULL, 5),
(156, 'img/blog/b2.jpg', 'blog image 2', NULL, 6),
(157, 'img/blog/b3.jpg', 'blog image 3', NULL, 7),
(158, 'img/blog/b4.jpg', 'blog image 4', NULL, 8),
(159, 'img/blog/b5.jpg', 'blog image 5', NULL, 9),
(160, 'img/blog/b6.jpg', 'blog image 6', NULL, 10),
(161, 'img/blog/b7.jpg', 'blog image 7', NULL, 11);

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id_like` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id_like`, `id_article`) VALUES
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 6),
(9, 6),
(10, 6),
(11, 6);

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
(1, 187.9, '2022-06-29 11:16:28', NULL, 'attente validation commerçant', 8),
(2, 98.9, '2022-06-29 11:16:57', NULL, 'attente validation commerçant', 8),
(3, 187.9, '2022-06-29 11:17:41', NULL, 'attente validation commerçant', 8);

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
(1, 2, 2),
(2, 1, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id_payment` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
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
(1, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton polluant', 89, 9.9),
(2, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio', 89, 9.9),
(3, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio', 89, 9.9),
(4, 'Chemise manche courte - motif à fleurs', 'La chemise gildan ultra coton est fabriquée à partir de 100% de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'une encolure et d\'une épaule renforcées, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton bio', 89, 9.9),
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
(16, 'Chemise manche courte à col mao', 'La chemise ultra coton est fabriquée à partir de velours et de coton. Cette coupe classique en jersey offre un confort inégalé à chaque utilisation. Dotée d\'un dos nu, d\'un collet à double aiguille sans couture et disponible dans une gamme de couleurs, elle offre tout cela dans un ensemble qui fait tourner les têtes.', '100% coton', 89, 9.9);

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
  ADD PRIMARY KEY (`id_article`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `dislikes`
--
ALTER TABLE `dislikes`
  ADD PRIMARY KEY (`id_dislike`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_like`),
  ADD KEY `id_article` (`id_article`);

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
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_order` (`id_order`);

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
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `dislikes`
--
ALTER TABLE `dislikes`
  MODIFY `id_dislike` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
  ADD CONSTRAINT `delete_article` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `article_delete` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_delete` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `on_delete_article` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
