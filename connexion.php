<?php 

// Lancer la connexion à la BDD

// creation des constantes

define("SERVEUR", "localhost");
define("USER", "root");
define("MDP", "Aqwzsx123456!");
define("BDDNAME", "camiseta");


// Gestion des erreurs

try {
    $connexion = new PDO("mysql:host=".SERVEUR.";dbname=".BDDNAME,USER,MDP);
    $connexion -> exec("SET CHARACTER SET utf8"); // signe -> correspond a l'appel d'une méthode
    
} catch (Exception $message) {
    echo "Une erreur à été trouvé lors de l'accès a la BDD :" . $message -> getMessage();
}