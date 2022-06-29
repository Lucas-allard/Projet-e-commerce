<?php

declare(strict_types=1);

namespace config;

class DataBase
{
    // attributs 
    private const SERVEUR = "db.3wa.io";
    private const USER = "lucasallard";
    private const MDP = "25f57d89c63d66d4c5f1cbb5771b9683";
    private const BDD = "lucasallard_camiseta";
    private $connexion;

    //méthodes 
    public function getConnexion(): ?\PDO
    {
        $this->connexion = null;
        try {
            $this->connexion = new \PDO("mysql:host=" . self::SERVEUR . ";dbname=" . self::BDD, self::USER, self::MDP);
            $this->connexion->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            // gestion des accents 
            $this->connexion->exec("SET CHARACTER SET utf8"); // -> appel une méthode d'une classe 

            // var_dump($connexion);
        } catch (\Exception $message) {
            echo ' une erreur est parvenue au moment de la connexion BDD : ' . $message->getMessage();
        }

        return $this->connexion;
    }
}
